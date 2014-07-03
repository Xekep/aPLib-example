;    - aP_pack                  (-)
;    - aP_workmem_size          (-)
;    - aP_max_packed_size       (-)
;    - aP_depack_asm            (+) - depack.asm
;    - aP_depack_asm_fast       (+) - depackf.asm
;    - aP_depack_asm_safe       (+) - depacks.asm
;    - aP_crc32                 (+) - crc32.asm
;    - aPsafe_pack              (+) - spack.asm
;    - aPsafe_check             (+) - scheck.asm
;    - aPsafe_get_orig_size     (+) - sgetsize.asm
;    - aPsafe_depack            (+) - sdepack.asm


    format PE console 5.0

;   =====================
    include 'win32ax.inc'
;   =====================

;   =========================================================
    section '.code' import code writeable executable readable
;   =========================================================

;   =========================================================
    library msvcrt, 'msvcrt.dll',\
            ntdll, 'ntdll.dll'

    import  msvcrt,\
            fopen, 'fopen',\
            printf, 'printf',\
            fseek, 'fseek',\
            ftell, 'ftell',\
            malloc, 'malloc',\
            fread, 'fread',\
            getchar, 'getchar',\
            fwrite, 'fwrite',\
            fclose, 'fclose',\
            free, 'free'

    import  ntdll,\
            RtlComputeCrc32, 'RtlComputeCrc32'


;   =========================================================


    SEEK_SET        = 0
    SEEK_END        = 2
    APLIB_ERROR     = -1

;   ======================
    include 'aplib.asm'
;   ======================


;   =========================================================
;       Сжать файл.
;   =========================================================
proc compress_file, oldname, packedname
    locals
        frmt                db "packed: %u -> %u", 0
        r                   db "rb", 0
        w                   db "wb", 0
        xoldfile            rd 1
        xpackedfile         rd 1
        xinsize             rd 1
        xoutsize            rd 1
        xdata               rd 1
        xpacked             rd 1
        xworkmem            rd 1
    endl

    cinvoke fopen, [oldname], addr r
    mov [xoldfile], eax

    cmp [xoldfile], 0
    je _cerr

    cinvoke fseek, [xoldfile], 0, SEEK_END
    cinvoke ftell, [xoldfile]
    mov [xinsize], eax
    cinvoke fseek, [xoldfile], 0, SEEK_SET

    cinvoke malloc, [xinsize]
    mov [xdata], eax

    stdcall aP_max_packed_size, [xinsize]
    cinvoke malloc, eax
    mov [xpacked], eax

    mov eax, 0xA0000            ; aP_workmem_size
    cinvoke malloc, eax
    mov [xworkmem], eax

    cmp [xdata], 0
    je _cerr
    cmp [xpacked], 0
    je _cerr
    cmp [xworkmem], 0
    je _cerr

    cinvoke fread, [xdata], 1, [xinsize], [xoldfile]

    cmp eax, [xinsize]
    jne _cerr

    stdcall aPsafe_pack, [xdata], [xpacked], [xinsize], [xworkmem], NULL, NULL
    mov [xoutsize], eax

    cmp [xoutsize], APLIB_ERROR
    je _cerr

    cinvoke fopen, [packedname], addr w
    mov [xpackedfile], eax

    cmp [xpackedfile], 0
    je _cerr

    cinvoke fwrite, [xpacked], 1, [xoutsize], [xpackedfile]

    cinvoke printf, addr frmt, [xinsize], [xoutsize]

    cinvoke fclose, [xpackedfile]
    cinvoke fclose, [xoldfile]

    cinvoke free, [xworkmem]
    cinvoke free, [xpacked]
    cinvoke free, [xdata]

    xor eax, eax
    ret

_cerr:
    xor eax, eax
    dec eax
    ret
endp

;   =========================================================
;       Распаковать файл.
;   =========================================================
proc decompress_file, packedname, newname
    locals
        frmt                db "unpacked: %u -> %u", 0
        r                   db "rb", 0
        w                   db "wb", 0
        xnewfile            rd 1
        xpackedfile         rd 1
        xinsize             rd 1
        xoutsize            rd 1
        xdata               rd 1
        xpacked             rd 1
        xdepackedsize       rd 1
    endl

    cinvoke fopen, [packedname], addr r
    mov [xpackedfile], eax

    cmp [xpackedfile], 0
    je _derr

    cinvoke fseek, [xpackedfile], 0, SEEK_END
    cinvoke ftell, [xpackedfile]
    mov [xinsize], eax
    cinvoke fseek, [xpackedfile], 0, SEEK_SET

    cinvoke malloc, [xinsize]
    mov [xpacked], eax

    cmp [xpacked], 0
    je _derr

    cinvoke fread, [xpacked], 1, [xinsize], [xpackedfile]
    cmp eax, [xinsize]
    jne _derr

    stdcall aPsafe_get_orig_size, [xpacked]
    mov [xdepackedsize], eax

    cmp [xdepackedsize], APLIB_ERROR
    je _derr

    cinvoke malloc, [xdepackedsize]
    mov [xdata], eax

    cmp [xdata], 0
    je _derr

    stdcall aPsafe_depack, [xpacked], [xinsize], [xdata], [xdepackedsize]
    mov [xoutsize], eax

    cmp eax, [xdepackedsize]
    jne _derr

    cinvoke fopen, [newname], addr w
    mov [xnewfile], eax

    cmp [xnewfile], 0
    je _derr

    cinvoke fwrite, [xdata], 1, [xoutsize], [xnewfile]

    cinvoke printf, addr frmt, [xinsize], [xoutsize]

    cinvoke fclose, [xpackedfile]
    cinvoke fclose, [xnewfile]

    cinvoke free, [xpacked]
    cinvoke free, [xdata]

    xor eax, eax
    ret

_derr:
    xor eax, eax
    dec eax
    ret    
endp


;   =========================================================
;       Точка входа
;   =========================================================
entry $
    
    stdcall compress_file, f, p

    cinvoke printf, next_line

    stdcall decompress_file, p, n

    cinvoke getchar
    xor eax, eax
    ret


    f               db "file.exe", 0
    p               db "file_packed.exe", 0
    n               db "file_unpacked.exe", 0
    next_line       db 10
