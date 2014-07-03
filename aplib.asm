;   INFO: aP_pack, func_1..._9 - реверс

    SIGN = 'SIGN'

;   =========================================================
;       size_t aP_pack( const void *source,
;                       void *destination,
;                       size_t length,
;                       void *workmem,
;                       int (*callback)(size_t, size_t, size_t, void *),
;                       void *cbparam );
;   =========================================================
proc aP_pack
    var_42C         = -42Ch
    source          = 4
    destination     = 8
    length          = 0Ch
    workmem         = 10h
    callback        = 14h
    cbparam         = 18h


    mov eax, [esp + length]
    sub esp, 42Ch
    test eax, eax
    jnz short @f
    add esp, 42Ch
    retn 18h

@@: mov ecx, [esp + 42Ch + cbparam]
    mov edx, [esp + 42Ch + callback]
    push ecx
    mov ecx, [esp + 430h + source]
    push edx
    push eax
    mov eax, [esp + 438h + destination]
    push eax
    mov eax, [esp + 43Ch + workmem]
    push ecx
    lea ecx, [esp + 440h + var_42C]
    call func_1
    add esp, 42Ch

    retn 18h
endp


proc func_1
    var_40          = -40h
    var_3C          = -3Ch
    var_38          = -38h
    var_34          = -34h
    var_30          = -30h
    var_2C          = -2Ch
    var_28          = -28h
    var_24          = -24h
    var_20          = -20h
    var_1C          = -1Ch
    var_18          = -18h
    var_14          = -14h
    var_10          = -10h
    var_C           = -0Ch
    var_8           = -8
    var_4           = -4
    source          = 8
    destination     = 0Ch
    length          = 10h
    callback        = 14h
    cbparam         = 18h

    push ebp
    mov ebp, esp
    and esp, 0FFFFFFF8h
    sub esp, 44h
    cmp dword[ebp + length], 0
    push ebx
    push esi
    push edi
    mov esi, ecx
    jnz short @f
    xor eax, eax
    pop edi
    pop esi
    pop ebx
    mov esp, ebp
    pop ebp
    retn 14h

@@: mov ecx, [ebp + source]
    test ecx, ecx
    jnz short loc_10001982

loc_10001976:
    or eax, -1
    pop edi
    pop esi
    pop ebx
    mov esp, ebp
    pop ebp
    retn 14h

loc_10001982:
    mov edx, [ebp + destination]
    test edx, edx
    jz short loc_10001976
    test eax, eax
    jz short loc_10001976
    mov [esi], ecx
    dec ecx
    lea ebx, [eax + 5A018h]
    mov [esi + 420h], ecx
    mov [esi + 10h], eax
    xor eax, eax
    mov ecx, 10000h
    mov edi, ebx
    mov [esi + 4], edx
    rep stosd
    lea edx, [esi + 14h]
    mov eax, 100h

loc_100019B5:
    mov [edx], ebx
    add edx, 4
    add ebx, 400h
    dec eax
    jnz short loc_100019B5
    mov eax, [esi]
    mov edx, [esi + 10h]
    mov edi, [esi + 4]
    xor ebx, ebx
    mov [esi + 418h], eax
    mov [edx], ebx
    mov dl, [eax]
    inc eax
    mov [esi], eax
    mov eax, [ebp + length]
    mov ecx, 1
    dec eax
    mov [edi], dl
    inc edi
    mov [esp + 50h + var_38], ebx
    mov [esp + 50h + var_3C], ebx
    mov dword [esi + 424h], -1
    mov [esp + 50h + var_30], ebx
    mov [esi + 414h], ecx
    mov [esi + 41Ch], ebx
    mov [esi + 428h], ebx
    mov [esi + 4], edi
    mov dword[esp + 50h + var_2C], -1
    mov [esi + 0Ch], ecx
    mov [esp + 50h + var_40], ecx
    mov [esp + 50h + var_24], eax
    cmp eax, ecx
    jbe loc_10001FFC
    lea esp, [esp + 0]

loc_10001A30:
    cmp dword[ebp + callback], 0
    jz short loc_10001A66
    mov eax, [esp + 50h + var_30]
    inc eax
    mov [esp + 50h + var_30], eax
    test eax, 0FFFh
    jnz short loc_10001A66
    mov ecx, [esi + 4]
    mov eax, [ebp + cbparam]
    sub ecx, [ebp + destination]
    mov edx, [esi]
    sub edx, [ebp + source]
    push eax
    mov eax, [ebp + length]
    push ecx
    push edx
    push eax
    call dword[ebp + callback]
    test eax, eax
    jz loc_10001976

loc_10001A66:
    mov ecx, [esp + 50h + var_2C]
    cmp [esp + 50h + var_40], ecx
    jnz short loc_10001A82
    mov edx, [esp + 50h + var_8]
    mov eax, [esp + 50h + var_4]
    mov [esp + 50h + var_20], edx
    mov [esp + 50h + var_1C], eax
    jmp short loc_10001A9A

loc_10001A82:
    mov eax, [esp + 50h + var_40]
    mov ecx, [ebp + length]
    mov edx, [esi]
    sub ecx, eax
    push ecx
    push eax
    push edx
    lea eax, [esp + 5Ch + var_20]
    push eax
    call func_2

loc_10001A9A:
    cmp dword[esp + 50h + var_20], 2
    jl loc_10001E35
    mov eax, [esi + 424h]
    cmp [esp + 50h + var_1C], eax
    jnz short loc_10001B15
    cmp ebx, 1
    jbe loc_10001C18
    mov edi, [esp + 50h + var_14]
    cmp edi, eax
    jz loc_10001C18
    mov ecx, [esp + 50h + var_40]
    mov eax, [esp + 50h + var_3C]
    sub ecx, ebx
    push ebx
    push ecx
    call func_5
    mov [esp + 58h + var_28], eax
    add esp, 8
    mov ecx, ebx
    mov eax, edi
    mov edx, esi
    call func_4
    cmp eax, [esp + 50h + var_28]
    jge loc_10001C18
    mov eax, edi
    cmp eax, 500h
    jl short loc_10001B05
    cmp ebx, 2
    jz loc_10001C18

loc_10001B05:
    cmp eax, 7D00h
    jl short loc_10001B15
    cmp ebx, 3
    jz loc_10001C18

loc_10001B15:
    mov eax, [esp + 50h + var_40]
    mov edi, [ebp + length]
    sub edi, eax
    inc eax
    lea edx, [edi-1]
    push edx
    push eax
    mov eax, [esi]
    inc eax
    push eax
    lea ecx, [esp + 5Ch + var_8]
    push ecx
    mov [esp + 60h + var_28], edi
    call func_2
    mov eax, [esp + 50h + var_40]
    inc eax
    push ebx
    mov [esp + 54h + var_2C], eax
    push esi
    lea ecx, [esp + 58h + var_8]
    lea eax, [esp + 58h + var_20]
    call func_3
    mov [esp + 50h + var_34], eax
    test ebx, ebx
    jnz short loc_10001B99
    mov ecx, [esp + 50h + var_8]
    cmp ecx, [esp + 50h + var_20]
    jge short loc_10001B99
    mov eax, [esp + 50h + var_4]
    mov edx, esi
    call func_4
    mov edx, [esp + 50h + var_40]
    mov edi, eax
    mov eax, [esi]
    push 1
    push edx
    call func_5
    mov ecx, [esp + 58h + var_20]
    lea edi, [edi + eax + 1]
    mov eax, [esp + 58h + var_1C]
    add esp, 8
    mov edx, esi
    call func_4
    cmp edi, eax
    mov edi, [esp + 50h + var_28]
    jg short loc_10001BA4

loc_10001B99:
    cmp dword[esp + 50h + var_34], 0
    jnz loc_10001E14

loc_10001BA4:
    cmp dword[esp + 50h + var_20], 2
    jle short loc_10001C18
    mov ecx, [esp + 50h + var_40]
    mov edx, [esi]
    lea eax, [edi-2]
    push eax
    add ecx, 2
    push ecx
    add edx, 2
    push edx
    lea eax, [esp + 5Ch + var_10]
    push eax
    call func_2
    push ebx
    push esi
    lea ecx, [esp + 58h + var_10]
    lea eax, [esp + 58h + var_20]
    call func_6
    test eax, eax
    jnz loc_10001E14
    cmp dword[esp + 50h + var_20], 3
    jle short loc_10001C18
    mov ecx, [esp + 50h + var_40]
    mov edx, [esi]
    add edi, 0FFFFFFFDh
    push edi
    add ecx, 3
    push ecx
    add edx, 3
    push edx
    lea eax, [esp + 5Ch + var_10]
    push eax
    call func_2
    push ebx
    push esi
    lea ecx, [esp + 58h + var_10]
    lea eax, [esp + 58h + var_20]
    call func_6
    test eax, eax
    jnz loc_10001E14

loc_10001C18:
    test ebx, ebx
    jz loc_10001D5E
    cmp ebx, 1
    jbe loc_10001D41
    mov edi, [esp + 50h + var_40]
    mov eax, ebx
    sub eax, edi
    add eax, [ebp + length]
    cmp eax, ebx
    jbe short loc_10001C3A
    mov eax, ebx

loc_10001C3A:
    push eax
    mov eax, [esp + 54h + var_3C]
    sub edi, ebx
    push edi
    push eax
    lea ecx, [esp + 5Ch + var_10]
    push ecx
    mov [esp + 60h + var_38], edi
    call func_2
    cmp [esp + 50h + var_10], ebx
    jb short loc_10001C8B
    mov eax, [esp + 50h + var_C]
    mov ecx, ebx
    mov edx, esi
    call func_4
    mov edi, eax
    mov eax, [esp + 50h + var_14]
    mov ecx, ebx
    mov edx, esi
    call func_4
    cmp eax, edi
    mov edi, [esp + 50h + var_38]
    jle short loc_10001C8B
    mov edx, [esp + 50h + var_C]
    mov eax, [esp + 50h + var_10]
    mov [esp + 50h + var_14], edx
    mov [esp + 50h + var_18], eax

loc_10001C8B:
    mov eax, [esp + 50h + var_3C]
    push ebx
    push edi
    call func_5
    mov [esp + 58h + var_28], eax
    mov eax, [esp + 58h + var_14]
    add esp, 8
    mov ecx, ebx
    mov edx, esi
    call func_4
    mov edi, eax
    cmp edi, [esp + 50h + var_28]
    jge short loc_10001D22
    mov ecx, [esp + 50h + var_1C]
    cmp ecx, [esi + 424h]
    jnz short loc_10001CEB
    mov eax, ecx
    mov ecx, [esp + 50h + var_20]
    inc eax
    mov edx, esi
    call func_4
    mov ecx, [esp + 50h + var_20]
    add eax, edi
    mov [esp + 50h + var_34], eax
    mov eax, [esp + 50h + var_1C]
    mov edx, esi
    call func_4
    add eax, [esp + 50h + var_28]
    cmp eax, [esp + 50h + var_34]
    jle short loc_10001D22

loc_10001CEB:
    mov eax, [esp + 50h + var_14]
    cmp eax, [esi + 424h]
    jnz short loc_10001D00
    cmp dword [esi + 428h], 0
    jz short loc_10001D18

loc_10001D00:
    cmp eax, 500h
    jl short loc_10001D0C
    cmp ebx, 2
    jz short loc_10001D22

loc_10001D0C:
    cmp eax, 7D00h
    jl short loc_10001D18
    cmp ebx, 3
    jz short loc_10001D22

loc_10001D18:
    push ebx
    mov ebx, eax
    call func_8
    jmp short loc_10001D52

loc_10001D22:
    mov edx, [esp + 50h + var_40]
    mov edi, [esp + 50h + var_3C]
    sub edx, ebx
    push edx
    mov eax, esi
    call func_7
    inc dword[esp + 50h + var_3C]
    dec ebx
    jnz short loc_10001D22
    mov [esp + 50h + var_38], ebx
    jmp short loc_10001D5E

loc_10001D41:
    mov eax, [esp + 50h + var_40]
    mov edi, [esp + 50h + var_3C]
    dec eax
    push eax
    mov eax, esi
    call func_7

loc_10001D52:
    mov dword[esp + 50h + var_38], 0
    mov ebx, [esp + 50h + var_38]

loc_10001D5E:
    mov eax, [esp + 50h + var_20]
    cmp eax, 3
    jg loc_10001DEE
    mov ecx, [esp + 50h + var_40]
    push eax
    mov eax, [esi]
    push ecx
    call func_5
    mov ecx, [esp + 58h + var_20]
    mov edi, eax
    mov eax, [esp + 58h + var_1C]
    add esp, 8
    mov edx, esi
    call func_4
    cmp eax, edi
    jg short loc_10001DBA
    mov eax, [esp + 50h + var_1C]
    cmp eax, [esi + 424h]
    jnz short loc_10001DA5
    cmp dword [esi + 428h], 0
    jz short loc_10001DEE

loc_10001DA5:
    cmp eax, 500h
    jl short loc_10001DB3
    cmp dword[esp + 50h + var_20], 2
    jz short loc_10001DBA

loc_10001DB3:
    cmp eax, 7D00h
    jl short loc_10001DEE

loc_10001DBA:
    mov eax, [esp + 50h + var_20]
    mov [esp + 50h + var_34], eax
    test eax, eax
    jz short loc_10001DDC

loc_10001DC6:
    mov edx, [esp + 50h + var_40]
    mov edi, [esi]
    push edx
    mov eax, esi
    call func_7
    inc dword [esi]
    dec dword[esp + 50h + var_34]
    jnz short loc_10001DC6

loc_10001DDC:
    mov eax, [esp + 50h + var_40]
    mov ecx, [esp + 50h + var_20]
    lea edx, [eax + ecx-1]
    mov [esp + 50h + var_40], edx
    jmp short loc_10001E50

loc_10001DEE:
    mov eax, [esp + 50h + var_20]
    mov ebx, [esp + 50h + var_1C]
    push eax
    call func_8
    mov eax, [esp + 50h + var_20]
    mov ecx, [esp + 50h + var_40]
    add [esi], eax
    mov ebx, [esp + 50h + var_38]
    lea edx, [ecx + eax-1]
    mov [esp + 50h + var_40], edx
    jmp short loc_10001E50

loc_10001E14:
    test ebx, ebx
    jnz short loc_10001E2E
    mov eax, [esp + 50h + var_20]
    mov ecx, [esp + 50h + var_1C]
    mov edx, [esi]
    mov [esp + 50h + var_18], eax
    mov [esp + 50h + var_14], ecx
    mov [esp + 50h + var_3C], edx

loc_10001E2E:
    inc ebx
    mov [esp + 50h + var_38], ebx
    jmp short loc_10001E4E

loc_10001E35:
    test ebx, ebx
    jz short loc_10001E40
    inc ebx
    mov [esp + 50h + var_38], ebx
    jmp short loc_10001E4E

loc_10001E40:
    mov eax, [esp + 50h + var_40]
    mov edi, [esi]
    push eax
    mov eax, esi
    call func_7

loc_10001E4E:
    inc dword [esi]

loc_10001E50:
    test ebx, ebx
    jz loc_10001F4D
    cmp ebx, [esp + 50h + var_18]
    jnz loc_10001F4D
    mov edi, [esp + 50h + var_40]
    mov eax, ebx
    sub eax, edi
    add eax, [ebp + length]
    cmp eax, ebx
    jbe short loc_10001E73
    mov eax, ebx

loc_10001E73:
    push eax
    mov eax, [esp + 54h + var_3C]
    sub edi, ebx
    push edi
    push eax
    lea ecx, [esp + 5Ch + var_10]
    push ecx
    mov [esp + 60h + var_38], edi
    call func_2
    cmp [esp + 50h + var_10], ebx
    jb short loc_10001EC4
    mov eax, [esp + 50h + var_C]
    mov ecx, ebx
    mov edx, esi
    call func_4
    mov edi, eax
    mov eax, [esp + 50h + var_14]
    mov ecx, ebx
    mov edx, esi
    call func_4
    cmp eax, edi
    mov edi, [esp + 50h + var_38]
    jle short loc_10001EC4
    mov edx, [esp + 50h + var_C]
    mov eax, [esp + 50h + var_10]
    mov [esp + 50h + var_14], edx
    mov [esp + 50h + var_18], eax

loc_10001EC4:
    mov eax, [esp + 50h + var_3C]
    push ebx
    push edi
    call func_5
    mov edi, eax
    mov eax, [esp + 58h + var_14]
    add esp, 8
    mov ecx, ebx
    mov edx, esi
    call func_4
    cmp eax, edi
    jge short loc_10001F30
    mov eax, [esp + 50h + var_14]
    cmp eax, [esi + 424h]
    jnz short loc_10001EFA
    cmp dword [esi + 428h], 0
    jz short loc_10001F12

loc_10001EFA:
    cmp eax, 500h
    jl short loc_10001F06
    cmp ebx, 2
    jz short loc_10001F30

loc_10001F06:
    cmp eax, 7D00h
    jl short loc_10001F12
    cmp ebx, 3
    jz short loc_10001F30

loc_10001F12:
    push ebx
    mov ebx, eax
    call func_8
    mov dword[esp + 50h + var_38], 0
    mov ebx, [esp + 50h + var_38]
    jmp short loc_10001F4D
    jmp short loc_10001F30
    align 10h

loc_10001F30:
    mov ecx, [esp + 50h + var_40]
    mov edi, [esp + 50h + var_3C]
    sub ecx, ebx
    push ecx
    mov eax, esi
    call func_7
    inc dword[esp + 50h + var_3C]
    dec ebx
    jnz short loc_10001F30
    mov [esp + 50h + var_38], ebx

loc_10001F4D:
    mov eax, [esp + 50h + var_40]
    inc eax
    mov [esp + 50h + var_40], eax
    cmp eax, [esp + 50h + var_24]
    jb loc_10001A30
    test ebx, ebx
    jz loc_10001FFC
    cmp ebx, 1
    jbe short loc_10001FEB
    mov edx, eax
    mov eax, [esp + 50h + var_3C]
    sub edx, ebx
    push ebx
    push edx
    call func_5
    mov edi, eax
    mov eax, [esp + 58h + var_14]
    add esp, 8
    mov ecx, ebx
    mov edx, esi
    call func_4
    cmp eax, edi
    jg short loc_10001FD0
    mov eax, [esp + 50h + var_14]
    cmp eax, [esi + 424h]
    jnz short loc_10001FA7
    cmp dword [esi + 428h], 0
    jz short loc_10001FBF

loc_10001FA7:
    cmp eax, 500h
    jl short loc_10001FB3
    cmp ebx, 2
    jz short loc_10001FD0

loc_10001FB3:
    cmp eax, 7D00h
    jl short loc_10001FBF
    cmp ebx, 3
    jz short loc_10001FD0

loc_10001FBF:
    push ebx
    mov ebx, eax
    call func_8
    jmp short loc_10001FFC
    align 10h

loc_10001FD0:
    mov eax, [esp + 50h + var_40]
    mov edi, [esp + 50h + var_3C]
    sub eax, ebx
    push eax
    mov eax, esi
    call func_7
    inc dword[esp + 50h + var_3C]
    dec ebx
    jnz short loc_10001FD0
    jmp short loc_10001FFC

loc_10001FEB:
    mov ecx, [esp + 50h + var_40]
    mov edi, [esp + 50h + var_3C]
    dec ecx
    push ecx
    mov eax, esi
    call func_7

loc_10001FFC:
    mov edx, [ebp + length]
    cmp [esp + 50h + var_40], edx
    jnb short loc_10002022
    mov ebx, [esp + 50h + var_40]
    lea esp, [esp + 0]

loc_10002010:
    mov edi, [esi]
    push ebx
    mov eax, esi
    call func_7
    inc dword [esi]
    inc ebx
    cmp ebx, [ebp + length]
    jb loc_10002010

loc_10002022:
    or edi, -1
    add [esi + 0Ch], edi
    lea ecx, [edi + 9]
    jnz short loc_1000203A
    mov eax, [esi + 4]
    mov [esi + 8], eax
    inc eax
    mov [esi + 0Ch], ecx
    mov [esi + 4], eax

loc_1000203A:
    mov eax, [esi + 8]
    mov dl, [eax]
    add dl, dl
    inc dl
    add [esi + 0Ch], edi
    mov [eax], dl
    jnz short loc_10002057
    mov eax, [esi + 4]
    mov [esi + 8], eax
    inc eax
    mov [esi + 0Ch], ecx
    mov [esi + 4], eax

loc_10002057:
    mov eax, [esi + 8]
    mov dl, [eax]
    add dl, dl
    inc dl
    add [esi + 0Ch], edi
    mov [eax], dl
    jnz short loc_10002074
    mov eax, [esi + 4]
    mov [esi + 8], eax
    inc eax
    mov [esi + 0Ch], ecx
    mov [esi + 4], eax

loc_10002074:
    mov eax, [esi + 8]
    mov ecx, [esi + 4]
    shl byte [eax], 1
    mov byte [ecx], 0
    lea edx, [ecx + 1]
    mov ecx, [esi + 0Ch]
    dec ecx
    shl byte [eax], cl
    mov eax, [ebp + callback]
    mov [esi + 4], edx
    test eax, eax
    jz short loc_100020B5
    sub edx, [ebp + destination]
    mov ecx, [ebp + cbparam]
    push ecx
    mov ecx, [ebp + length]
    push edx
    mov edx, [esi]
    sub edx, [ebp + source]
    push edx
    push ecx
    call eax
    test eax, eax
    jnz short loc_100020B5
    mov eax, edi
    pop edi
    pop esi
    pop ebx
    mov esp, ebp
    pop ebp
    retn 14h

loc_100020B5:
    mov eax, [esi + 4]
    sub eax, [ebp + destination]
    pop edi
    pop esi
    pop ebx
    mov esp, ebp
    pop ebp
    retn 14h
    endp


proc func_2
    var_14 = -14h
    var_10 = -10h
    var_C = -0Ch
    var_8 = -8
    var_4 = -4
    arg_0 = 4
    arg_4 = 8
    arg_8 = 0Ch
    arg_C = 10h

    sub esp, 14h
    xor eax, eax
    push ebx
    mov [esp + 18h + var_14], eax
    mov [esp + 18h + var_10], eax
    mov eax, [esi + 418h]
    push ebp
    push edi
    cmp eax, [esp + 20h + arg_4]
    jnb short loc_10001759
    mov ecx, [esi + 414h]
    mov edi, [esi + 41Ch]
    lea edx, [ecx + 16800h]
    mov [esp + 20h + var_C], edx

loc_100016F2:
    cmp [esp + 20h + var_C], ecx
    jbe short loc_10001708
    mov edx, ecx
    sub edx, edi
    cmp ecx, edi
    ja short loc_1000170A
    add edx, 16800h
    jmp short loc_1000170A

loc_10001708:
    xor edx, edx

loc_1000170A:
    movzx ebx, byte [eax]
    movzx ebp, byte [eax + 1]
    mov ebx, [esi + ebx*4 + 14h]
    mov ebp, [ebx + ebp*4]
    mov ebx, [esi + 10h]
    inc dword[esp + 20h + var_C]
    mov [ebx + edx*4], ebp
    movzx edx, byte [eax]
    mov edx, [esi + edx*4 + 14h]
    movzx ebx, byte [eax + 1]
    mov [edx + ebx*4], ecx
    inc ecx
    mov edx, ecx
    inc eax
    sub edx, edi
    mov [esi + 414h], ecx
    mov [esi + 418h], eax
    cmp edx, 16800h
    jbe short loc_10001753
    lea edi, [ecx-1]
    mov [esi + 41Ch], edi

loc_10001753:
    cmp eax, [esp + 20h + arg_4]
    jb short loc_100016F2

loc_10001759:
    mov eax, [esp + 20h + arg_C]
    mov ebx, 16700h
    cmp eax, ebx
    jbe short loc_1000176C
    mov [esp + 20h + arg_C], ebx
    jmp short loc_10001775

loc_1000176C:
    cmp eax, 1
    jbe loc_10001936

loc_10001775:
    mov ebp, [esp + 20h + arg_4]
    movzx eax, byte [ebp + 0]
    movzx ecx, byte [ebp + 1]
    mov edx, [esi + eax*4 + 14h]
    mov edi, [edx + ecx*4]
    test edi, edi
    jz loc_10001936
    mov edx, [esi + 420h]
    lea ecx, [edx + edi]
    mov dword[esp + 20h + var_8], 800h
    cmp ecx, ebp
    jb short loc_100017DE

loc_100017A5:
    test edi, edi
    jz short loc_100017DE
    lea eax, [edi + 16800h]
    cmp eax, [esi + 414h]
    jbe short loc_100017CF
    mov eax, [esi + 41Ch]
    cmp edi, eax
    jbe short loc_100017C5
    sub edi, eax
    jmp short loc_100017D1

loc_100017C5:
    sub edi, eax
    add edi, 16800h
    jmp short loc_100017D1

loc_100017CF:
    xor edi, edi

loc_100017D1:
    mov ecx, [esi + 10h]
    mov edi, [ecx + edi*4]
    lea ecx, [edx + edi]
    cmp ecx, ebp
    jnb short loc_100017A5

loc_100017DE:
    cmp [esp + 20h + arg_8], ebx
    jbe short loc_100017E8
    mov [esp + 20h + arg_8], ebx

loc_100017E8:
    test edi, edi
    jz loc_10001936
    jmp short loc_100017F6

loc_100017F2:
    mov ebp, [esp + 20h + arg_4]

loc_100017F6:
    mov eax, ebp
    sub eax, ecx
    mov [esp + 20h + var_C], eax
    cmp eax, [esp + 20h + arg_8]
    ja loc_10001936
    mov eax, [esp + 20h + var_14]
    mov dl, [ecx + eax]
    cmp dl, [eax + ebp]
    mov edx, [esp + 20h + var_C]
    mov ebx, 2
    jz short loc_10001829
    cmp edx, [esi + 424h]
    jnz loc_100018E8

loc_10001829:
    mov eax, [esp + 20h + arg_C]
    cmp eax, 2
    jbe short loc_10001851
    lea edx, [ebp + 2]
    mov ebp, ecx
    sub ebp, [esp + 20h + arg_4]
    jmp short loc_10001840
    align 10h

loc_10001840:
    mov cl, [edx + ebp]
    cmp cl, [edx]
    jnz short loc_1000184D
    inc ebx
    inc edx
    cmp ebx, eax
    jb short loc_10001840

loc_1000184D:
    mov edx, [esp + 20h + var_C]

loc_10001851:
    cmp ebx, eax
    jz loc_1000192E
    mov ebp, [esp + 20h + var_14]
    cmp ebx, ebp
    jbe short loc_1000189C
    mov eax, edx
    mov ecx, ebx
    mov edx, esi
    call func_4
    mov ecx, [esp + 20h + var_14]
    mov ebp, eax
    mov eax, [esp + 20h + var_10]
    mov edx, esi
    call func_4
    sub ebp, eax
    add ebp, ebp
    mov eax, 4EC4EC4Fh
    imul ebp
    sar edx, 2
    mov eax, edx
    shr eax, 1Fh
    add eax, edx
    add eax, [esp + 20h + var_14]
    cmp ebx, eax
    jbe short loc_100018E8
    jmp short loc_100018DC

loc_1000189C:
    cmp edx, [esi + 424h]
    jnz short loc_100018E8
    mov eax, edx
    mov ecx, ebx
    mov edx, esi
    call func_4
    mov [esp + 20h + var_4], eax
    mov eax, [esp + 20h + var_10]
    mov ecx, ebp
    mov edx, esi
    call func_4
    mov ecx, eax
    sub ecx, [esp + 20h + var_4]
    mov eax, 2AAAAAABh
    imul ecx
    mov eax, edx
    shr eax, 1Fh
    add eax, edx
    add eax, ebx
    cmp eax, [esp + 20h + var_14]
    jb short loc_100018E8

loc_100018DC:
    mov ecx, [esp + 20h + var_C]
    mov [esp + 20h + var_14], ebx
    mov [esp + 20h + var_10], ecx

loc_100018E8:
    lea edx, [edi + 16800h]
    cmp edx, [esi + 414h]
    jbe short loc_1000190E
    mov eax, [esi + 41Ch]
    cmp edi, eax
    jbe short loc_10001904
    sub edi, eax
    jmp short loc_10001910

loc_10001904:
    sub edi, eax
    add edi, 16800h
    jmp short loc_10001910

loc_1000190E:
    xor edi, edi

loc_10001910:
    mov eax, [esi + 10h]
    mov edi, [eax + edi*4]
    mov ecx, [esi + 420h]
    add ecx, edi
    dec dword[esp + 20h + var_8]
    jz short loc_10001936
    test edi, edi
    jnz loc_100017F2
    jmp short loc_10001936

loc_1000192E:
    mov [esp + 20h + var_10], edx
    mov [esp + 20h + var_14], ebx

loc_10001936:
    mov eax, [esp + 20h + arg_0]
    mov ecx, [esp + 20h + var_14]
    mov edx, [esp + 20h + var_10]
    pop edi
    pop ebp
    mov [eax], ecx
    mov [eax + 4], edx
    pop ebx
    add esp, 14h
    retn 10h
endp


proc func_3
    var_4 = -4
    arg_0 = 4
    arg_4 = 8

    push ecx
    mov edx, [esp + 4 + arg_0]
    push ebx
    mov ebx, [eax]
    push ebp
    push esi
    mov esi, [eax + 4]
    push edi
    mov edi, ecx
    mov ecx, ebx
    mov eax, esi
    call func_4
    mov ebp, [edi]
    mov edi, [edi + 4]
    mov edx, [esp + 14h + arg_0]
    mov [esp + 14h + var_4], eax
    mov ecx, ebp
    mov eax, edi
    call func_4
    mov ecx, eax
    mov dword[esp + 14h + arg_0], 0
    cmp edi, esi
    jl short loc_100021B2
    mov edx, [esp + 14h + var_4]
    sub edx, ecx
    add edx, edx
    mov eax, 38E38E39h
    imul edx
    sar edx, 1
    mov eax, edx
    shr eax, 1Fh
    add eax, edx
    add eax, ebp
    cmp ebx, eax
    jge short loc_100021CF
    mov eax, 1
    jmp short loc_100021D3

loc_100021B2:
    mov eax, [esp + 14h + var_4]
    sub eax, ecx
    cdq
    and edx, 3
    add eax, edx
    sar eax, 2
    add eax, ebp
    cmp ebx, eax
    jge short loc_100021CF
    mov dword[esp + 14h + arg_0], 1

loc_100021CF:
    mov eax, [esp + 14h + arg_0]

loc_100021D3:
    cmp dword[esp + 14h + arg_4], 0
    jbe short loc_100021E9
    cmp ebp, ebx
    jl short loc_100021E9
    cmp ecx, [esp + 14h + var_4]
    jge short loc_100021E9
    mov eax, 1

loc_100021E9:
    pop edi
    pop esi
    pop ebp
    pop ebx
    pop ecx
    retn 8
endp


proc func_4
    cmp eax, 80h
    jnb short loc_1000137F
    cmp ecx, 4
    jnb short loc_1000137F
    cmp eax, [edx + 424h]
    jz short loc_100013EC
    neg eax
    sbb eax, eax
    and eax, 6
    add eax, 5
    retn

loc_1000137F:
    cmp eax, [edx + 424h]
    jz short loc_100013EC
    cmp eax, 80h
    jnb short loc_10001393
    sub ecx, 2
    jmp short loc_100013A3

loc_10001393:
    cmp eax, 500h
    jb short loc_100013A3
    dec ecx
    cmp eax, 7D00h
    jb short loc_100013A3
    dec ecx

loc_100013A3:
    shr eax, 8
    add eax, 3
    cmp eax, 2
    jge short loc_100013B5
    mov edx, 64h
    jmp short loc_100013C7

loc_100013B5:
    xor edx, edx
    shr eax, 1
    jz short loc_100013C7
    jmp short loc_100013C0
    align 10h

loc_100013C0:
    add edx, 2
    shr eax, 1
    jnz short loc_100013C0

loc_100013C7:
    cmp ecx, 2
    jge short loc_100013D6
    mov eax, 64h
    lea eax, [eax + edx + 0Ah]
    retn

loc_100013D6:
    xor eax, eax
    shr ecx, 1
    jz short loc_100013E7
    lea esp, [esp + 0]

loc_100013E0:
    add eax, 2
    shr ecx, 1
    jnz short loc_100013E0

loc_100013E7:
    lea eax, [eax + edx + 0Ah]
    retn

loc_100013EC:
    cmp ecx, 2
    jge short loc_100013FA
    mov eax, 64h
    add eax, 4
    retn

loc_100013FA:
    xor eax, eax
    shr ecx, 1
    jz short loc_10001407

loc_10001400:
    add eax, 2
    shr ecx, 1
    jnz short loc_10001400

loc_10001407:
    add eax, 4
    retn
endp


proc func_5
    arg_0 = 4
    arg_4 = 8

    push ebx
    push ebp
    mov ebp, [esp + 8 + arg_0]
    push esi
    push edi
    mov edi, eax
    xor eax, eax
    cmp ebp, 0Fh
    jbe short loc_100010D6
    mov ebp, 0Fh

loc_100010D6:
    mov esi, edi
    sub esi, ebp
    lea ebx, [ebx + 0]

loc_100010E0:
    mov bl, [edi]
    test bl, bl
    jz short loc_10001105
    mov ecx, ebp
    mov edx, esi
    lea ebx, [ebx + 0]

loc_100010F0:
    cmp [edx], bl
    jz short loc_100010F8
    inc edx
    dec ecx
    jnz short loc_100010F0

loc_100010F8:
    xor edx, edx
    test ecx, ecx
    setz dl
    lea eax, [eax + edx*2 + 7]
    jmp short loc_10001108

loc_10001105:
    add eax, 7

loc_10001108:
    inc edi
    inc esi
    dec dword[esp + 10h + arg_4]
    jnz short loc_100010E0
    pop edi
    pop esi
    pop ebp
    pop ebx
    retn
endp


proc func_6
    var_4 = -4
    arg_0 = 4
    arg_4 = 8

    push ecx
    mov edx, [esp + 4 + arg_0]
    push ebx
    mov ebx, [eax]
    push ebp
    push esi
    mov esi, [eax + 4]
    push edi
    mov edi, ecx
    mov ecx, ebx
    mov eax, esi
    call func_4
    mov ebp, [edi]
    mov edi, [edi + 4]
    mov edx, [esp + 14h + arg_0]
    mov [esp + 14h + var_4], eax
    mov ecx, ebp
    mov eax, edi
    call func_4
    mov ecx, eax
    mov dword[esp + 14h + arg_0], 0
    cmp edi, esi
    jl short loc_10002259
    mov eax, [esp + 14h + var_4]
    sub eax, ecx
    cdq
    and edx, 3
    add eax, edx
    sar eax, 2
    add eax, ebp
    cmp ebx, eax
    jge short loc_1000227F
    mov eax, 1
    jmp short loc_10002283

loc_10002259:
    mov edx, [esp + 14h + var_4]
    sub edx, ecx
    add edx, edx
    mov eax, 2E8BA2E9h
    imul edx
    sar edx, 1
    mov eax, edx
    shr eax, 1Fh
    add eax, edx
    add eax, ebp
    cmp ebx, eax
    jge short loc_1000227F
    mov dword[esp + 14h + arg_0], 1

loc_1000227F:
    mov eax, [esp + 14h + arg_0]

loc_10002283:
    cmp dword[esp + 14h + arg_4], 0
    jbe short loc_10002299
    cmp ebp, ebx
    jl short loc_10002299
    cmp ecx, [esp + 14h + var_4]
    jge short loc_10002299
    mov eax, 1

loc_10002299:
    pop edi
    pop esi
    pop ebp
    pop ebx
    pop ecx
    retn 8
endp


proc func_7
    arg_0 = 4

    mov dl, [edi]
    push ebx
    push esi
    mov esi, [esp + 8 + arg_0]
    mov dword [eax + 428h], 0
    test dl, dl
    jz loc_10001295
    cmp esi, 0Fh
    jbe short loc_10001148
    mov esi, 0Fh
    mov [esp + 8 + arg_0], esi

loc_10001148:
    mov ecx, edi
    sub ecx, esi
    lea esp, [esp + 0]

loc_10001150:
    cmp [ecx], dl
    jz short loc_1000118D
    mov esi, [esp + 8 + arg_0]
    dec esi
    inc ecx
    mov [esp + 8 + arg_0], esi
    test esi, esi
    jnz short loc_10001150

loc_10001162:
    dec dword [eax + 0Ch]
    jnz short loc_10001178
    mov ecx, [eax + 4]
    mov [eax + 8], ecx
    inc ecx
    mov dword [eax + 0Ch], 8
    mov [eax + 4], ecx

loc_10001178:
    mov ecx, [eax + 8]
    shl byte [ecx], 1
    mov ecx, [eax + 4]
    mov dl, [edi]
    mov [ecx], dl
    inc ecx
    pop esi
    mov [eax + 4], ecx
    pop ebx
    retn 4

loc_1000118D:
    cmp dword[esp + 8 + arg_0], 0
    jz short loc_10001162
    or esi, -1
    add [eax + 0Ch], esi
    lea edx, [esi + 9]
    jnz short loc_100011AC
    mov ecx, [eax + 4]
    mov [eax + 8], ecx
    inc ecx
    mov [eax + 0Ch], edx
    mov [eax + 4], ecx

loc_100011AC:
    mov ecx, [eax + 8]
    mov bl, [ecx]
    add bl, bl
    inc bl
    add [eax + 0Ch], esi
    mov [ecx], bl
    jnz short loc_100011C9
    mov ecx, [eax + 4]
    mov [eax + 8], ecx
    inc ecx
    mov [eax + 0Ch], edx
    mov [eax + 4], ecx

loc_100011C9:
    mov ecx, [eax + 8]
    mov bl, [ecx]
    add bl, bl
    inc bl
    add [eax + 0Ch], esi
    mov [ecx], bl
    jnz short loc_100011E6
    mov ecx, [eax + 4]
    mov [eax + 8], ecx
    inc ecx
    mov [eax + 0Ch], edx
    mov [eax + 4], ecx

loc_100011E6:
    mov ecx, [eax + 8]
    mov bl, [ecx]
    add bl, bl
    inc bl
    add [eax + 0Ch], esi
    mov [ecx], bl
    jnz short loc_10001203
    mov ecx, [eax + 4]
    mov [eax + 8], ecx
    inc ecx
    mov [eax + 0Ch], edx
    mov [eax + 4], ecx

loc_10001203:
    mov ecx, [eax + 8]
    test byte [esp + 8 + arg_0], dl
    jz short loc_10001216
    mov bl, [ecx]
    add bl, bl
    inc bl
    mov [ecx], bl
    jmp short loc_10001218

loc_10001216:
    shl byte [ecx], 1

loc_10001218:
    add [eax + 0Ch], esi
    jnz short loc_1000122A
    mov ecx, [eax + 4]
    mov [eax + 8], ecx
    inc ecx
    mov [eax + 0Ch], edx
    mov [eax + 4], ecx

loc_1000122A:
    test byte [esp + 8 + arg_0], 4
    mov ecx, [eax + 8]
    jz short loc_1000123E
    mov bl, [ecx]
    add bl, bl
    inc bl
    mov [ecx], bl
    jmp short loc_10001240

loc_1000123E:
    shl byte [ecx], 1

loc_10001240:
    add [eax + 0Ch], esi
    jnz short loc_10001252
    mov ecx, [eax + 4]
    mov [eax + 8], ecx
    inc ecx
    mov [eax + 0Ch], edx
    mov [eax + 4], ecx

loc_10001252:
    test byte [esp + 8 + arg_0], 2
    mov ecx, [eax + 8]
    jz short loc_10001266
    mov bl, [ecx]
    add bl, bl
    inc bl
    mov [ecx], bl
    jmp short loc_10001268

loc_10001266:
    shl byte [ecx], 1

loc_10001268:
    add [eax + 0Ch], esi
    jnz short loc_1000127A
    mov ecx, [eax + 4]
    mov [eax + 8], ecx
    inc ecx
    mov [eax + 0Ch], edx
    mov [eax + 4], ecx

loc_1000127A:
    test byte [esp + 8 + arg_0], 1
    mov eax, [eax + 8]
    jz loc_1000134C
    mov cl, [eax]
    add cl, cl
    inc cl
    pop esi
    mov [eax], cl
    pop ebx
    retn 4

loc_10001295:
    or esi, -1
    add [eax + 0Ch], esi
    lea edx, [esi + 9]
    jnz short loc_100012AD
    mov ecx, [eax + 4]
    mov [eax + 8], ecx
    inc ecx
    mov [eax + 0Ch], edx
    mov [eax + 4], ecx

loc_100012AD:
    mov ecx, [eax + 8]
    mov bl, [ecx]
    add bl, bl
    inc bl
    add [eax + 0Ch], esi
    mov [ecx], bl
    jnz short loc_100012CA
    mov ecx, [eax + 4]
    mov [eax + 8], ecx
    inc ecx
    mov [eax + 0Ch], edx
    mov [eax + 4], ecx

loc_100012CA:
    mov ecx, [eax + 8]
    mov bl, [ecx]
    add bl, bl
    inc bl
    add [eax + 0Ch], esi
    mov [ecx], bl
    jnz short loc_100012E7
    mov ecx, [eax + 4]
    mov [eax + 8], ecx
    inc ecx
    mov [eax + 0Ch], edx
    mov [eax + 4], ecx

loc_100012E7:
    mov ecx, [eax + 8]
    mov bl, [ecx]
    add bl, bl
    inc bl
    add [eax + 0Ch], esi
    mov [ecx], bl
    jnz short loc_10001304
    mov ecx, [eax + 4]
    mov [eax + 8], ecx
    inc ecx
    mov [eax + 0Ch], edx
    mov [eax + 4], ecx

loc_10001304:
    mov ecx, [eax + 8]
    shl byte [ecx], 1
    add [eax + 0Ch], esi
    jnz short loc_1000131B
    mov ecx, [eax + 4]
    mov [eax + 8], ecx
    inc ecx
    mov [eax + 0Ch], edx
    mov [eax + 4], ecx

loc_1000131B:
    mov ecx, [eax + 8]
    shl byte [ecx], 1
    add [eax + 0Ch], esi
    jnz short loc_10001332
    mov ecx, [eax + 4]
    mov [eax + 8], ecx
    inc ecx
    mov [eax + 0Ch], edx
    mov [eax + 4], ecx

loc_10001332:
    mov ecx, [eax + 8]
    shl byte [ecx], 1
    add [eax + 0Ch], esi
    jnz short loc_10001349
    mov ecx, [eax + 4]
    mov [eax + 8], ecx
    inc ecx
    mov [eax + 0Ch], edx
    mov [eax + 4], ecx

loc_10001349:
    mov eax, [eax + 8]

loc_1000134C:
    shl byte [eax], 1
    pop esi
    pop ebx
    retn 4
endp


proc func_8
    arg_0 = 4

    cmp dword [esi + 428h], 0
    push ebp
    push edi
    jz loc_1000153D
    cmp ebx, 80h
    jnb short loc_100014A4
    mov ecx, [esp + 8 + arg_0]
    cmp ecx, 4
    jnb short loc_100014A4
    or ebp, -1
    add [esi + 0Ch], ebp
    lea edx, [ebp + 9]
    jnz short loc_10001448
    mov eax, [esi + 4]
    mov [esi + 8], eax
    inc eax
    mov [esi + 0Ch], edx
    mov [esi + 4], eax

loc_10001448:
    mov edi, [esi + 8]
    mov al, [edi]
    add al, al
    inc al
    add [esi + 0Ch], ebp
    mov [edi], al
    jnz short loc_10001465
    mov eax, [esi + 4]
    mov [esi + 8], eax
    inc eax
    mov [esi + 0Ch], edx
    mov [esi + 4], eax

loc_10001465:
    mov edi, [esi + 8]
    mov al, [edi]
    add al, al
    inc al
    add [esi + 0Ch], ebp
    mov [edi], al
    jnz short loc_10001482
    mov eax, [esi + 4]
    mov [esi + 8], eax
    inc eax
    mov [esi + 0Ch], edx
    mov [esi + 4], eax

loc_10001482:
    mov edi, [esi + 4]
    mov eax, [esi + 8]
    shl byte [eax], 1
    mov dl, bl
    and cl, 1
    add dl, dl
    or cl, dl
    mov [edi], cl
    inc edi
    mov [esi + 4], edi
    pop edi
    mov [esi + 424h], ebx
    pop ebp
    retn 4

loc_100014A4:
    or ebp, -1
    add [esi + 0Ch], ebp
    lea edx, [ebp + 9]
    jnz short loc_100014BC
    mov eax, [esi + 4]
    mov [esi + 8], eax
    inc eax
    mov [esi + 0Ch], edx
    mov [esi + 4], eax

loc_100014BC:
    mov eax, [esi + 8]
    mov cl, [eax]
    add cl, cl
    inc cl
    add [esi + 0Ch], ebp
    mov [eax], cl
    jnz short loc_100014D9
    mov eax, [esi + 4]
    mov [esi + 8], eax
    inc eax
    mov [esi + 0Ch], edx
    mov [esi + 4], eax

loc_100014D9:
    mov eax, [esi + 8]
    shl byte [eax], 1
    mov ecx, ebx
    shr ecx, 8
    add ecx, 2
    mov eax, esi
    call func_9
    mov eax, [esi + 4]
    mov [eax], bl
    inc eax
    mov [esi + 4], eax
    mov [esi + 424h], ebx
    cmp ebx, 80h
    jb loc_10001642
    cmp ebx, 500h
    jb loc_100016AD
    mov eax, 1
    sub [esp + 8 + arg_0], eax
    cmp ebx, 7D00h
    jb loc_100016AD
    sub [esp + 8 + arg_0], eax
    mov ecx, [esp + 8 + arg_0]
    mov eax, esi
    call func_9
    pop edi
    pop ebp
    retn 4

loc_1000153D:
    mov edi, 1
    mov [esi + 428h], edi
    cmp ebx, 80h
    jnb loc_100015DA
    cmp dword[esp + 8 + arg_0], 4
    jnb short loc_100015DA
    cmp ebx, [esi + 424h]
    jz short loc_100015DA
    or ebp, -1
    add [esi + 0Ch], ebp
    lea edx, [edi + 7]
    jnz short loc_1000157B
    mov eax, [esi + 4]
    mov [esi + 8], eax
    inc eax
    mov [esi + 0Ch], edx
    mov [esi + 4], eax

loc_1000157B:
    mov eax, [esi + 8]
    mov cl, [eax]
    add cl, cl
    inc cl
    add [esi + 0Ch], ebp
    mov [eax], cl
    jnz short loc_10001598
    mov eax, [esi + 4]
    mov [esi + 8], eax
    inc eax
    mov [esi + 0Ch], edx
    mov [esi + 4], eax

loc_10001598:
    mov eax, [esi + 8]
    mov cl, [eax]
    add cl, cl
    inc cl
    add [esi + 0Ch], ebp
    mov [eax], cl
    jnz short loc_100015B5
    mov eax, [esi + 4]
    mov [esi + 8], eax
    inc eax
    mov [esi + 0Ch], edx
    mov [esi + 4], eax

loc_100015B5:
    mov eax, [esi + 8]
    shl byte [eax], 1
    mov al, byte [esp + 8 + arg_0]
    mov edi, [esi + 4]
    mov dl, bl
    and al, 1
    add dl, dl
    or al, dl
    mov [edi], al
    inc edi
    mov [esi + 4], edi
    pop edi
    mov [esi + 424h], ebx
    pop ebp
    retn 4

loc_100015DA:
    or ebp, -1
    add [esi + 0Ch], ebp
    lea edx, [ebp + 9]
    jnz short loc_100015F2
    mov eax, [esi + 4]
    mov [esi + 8], eax
    inc eax
    mov [esi + 0Ch], edx
    mov [esi + 4], eax

loc_100015F2:
    mov eax, [esi + 8]
    mov cl, [eax]
    add cl, cl
    inc cl
    add [esi + 0Ch], ebp
    mov [eax], cl
    jnz short loc_1000160F
    mov eax, [esi + 4]
    mov [esi + 8], eax
    inc eax
    mov [esi + 0Ch], edx
    mov [esi + 4], eax

loc_1000160F:
    mov eax, [esi + 8]
    shl byte [eax], 1
    cmp ebx, [esi + 424h]
    jz short loc_1000167F
    mov ecx, ebx
    shr ecx, 8
    add ecx, 3
    mov eax, esi
    call func_9
    mov eax, [esi + 4]
    mov [eax], bl
    inc eax
    mov [esi + 4], eax
    mov [esi + 424h], ebx
    cmp ebx, 80h
    jnb short loc_10001657

loc_10001642:
    sub dword[esp + 8 + arg_0], 2
    mov ecx, [esp + 8 + arg_0]
    mov eax, esi
    call func_9
    pop edi
    pop ebp
    retn 4

loc_10001657:
    cmp ebx, 500h
    jb short loc_100016AD
    sub [esp + 8 + arg_0], edi
    cmp ebx, 7D00h
    jb short loc_100016AD
    sub [esp + 8 + arg_0], edi
    mov ecx, [esp + 8 + arg_0]
    mov eax, esi
    call func_9
    pop edi
    pop ebp
    retn 4

loc_1000167F:
    add [esi + 0Ch], ebp
    jnz short loc_10001691
    mov eax, [esi + 4]
    mov [esi + 8], eax
    inc eax
    mov [esi + 0Ch], edx
    mov [esi + 4], eax

loc_10001691:
    mov eax, [esi + 8]
    shl byte [eax], 1
    add [esi + 0Ch], ebp
    jnz short loc_100016A8
    mov eax, [esi + 4]
    mov [esi + 8], eax
    inc eax
    mov [esi + 0Ch], edx
    mov [esi + 4], eax

loc_100016A8:
    mov eax, [esi + 8]
    shl byte [eax], 1

loc_100016AD:
    mov ecx, [esp + 8 + arg_0]
    mov eax, esi
    call func_9
    pop edi
    pop ebp
    retn 4
endp


proc func_9
    var_4 = -4

    push ecx
    mov edx, [esp + 4 + var_4]
    push esi
    push edi
    xor edi, edi

loc_10001008:
    mov esi, ecx
    and esi, 1
    shr ecx, 1
    inc edi
    lea edx, [esi + edx*2]
    cmp ecx, 1
    ja short loc_10001008
    dec edi
    jz short loc_10001069
    mov esi, [eax + 0Ch]
    mov ecx, [eax + 8]
    push ebx

loc_10001022:
    dec esi
    jnz short loc_10001033
    mov ecx, [eax + 4]
    lea ebx, [ecx + 1]
    mov esi, 8
    mov [eax + 4], ebx

loc_10001033:
    test dl, 1
    jz short loc_10001042
    mov bl, [ecx]
    add bl, bl
    inc bl
    mov [ecx], bl
    jmp short loc_10001044

loc_10001042:
    shl byte [ecx], 1

loc_10001044:
    dec esi
    jnz short loc_10001055
    mov ecx, [eax + 4]
    lea ebx, [ecx + 1]
    mov esi, 8
    mov [eax + 4], ebx

loc_10001055:
    mov bl, [ecx]
    add bl, bl
    inc bl
    shr edx, 1
    dec edi
    mov [ecx], bl
    jnz short loc_10001022
    mov [eax + 0Ch], esi
    mov [eax + 8], ecx
    pop ebx

loc_10001069:
    or esi, -1
    add [eax + 0Ch], esi
    jnz short loc_10001082
    mov ecx, [eax + 4]
    mov [eax + 8], ecx
    inc ecx
    mov dword [eax + 0Ch], 8
    mov [eax + 4], ecx

loc_10001082:
    mov ecx, [eax + 8]
    test dl, 1
    jz short loc_10001094
    mov dl, [ecx]
    add dl, dl
    inc dl
    mov [ecx], dl
    jmp short loc_10001096

loc_10001094:
    shl byte [ecx], 1

loc_10001096:
    add [eax + 0Ch], esi
    pop edi
    pop esi
    jnz short loc_100010AE
    mov ecx, [eax + 4]
    mov [eax + 8], ecx
    inc ecx
    mov dword [eax + 0Ch], 8
    mov [eax + 4], ecx

loc_100010AE:
    mov eax, [eax + 8]
    shl byte [eax], 1
    pop ecx
    retn
endp


;   =========================================================
;       size_t aP_max_packed_size( size_t input_size );
;   =========================================================
proc aP_max_packed_size, input_size
    mov eax, [input_size]
    mov ecx, eax
    shr ecx, 3
    lea eax, [ecx + eax + 0x40]
    ret
endp


;   =========================================================
;       size_t aPsafe_pack( const void *source,
;                           void *destination,
;                           size_t length,
;                           void *workmem,
;                           int (*callback)(size_t, size_t, size_t, void *),
;                           void *cbparam );
;   =========================================================
proc aPsafe_pack, source, destination, length, workmem, callback, cbparam
    mov esi, [source]
    mov edi, [destination]
    mov ecx, [length]

    or eax, -1
    test esi, esi
    jz .return_eax

    test edi, edi
    jz .return_eax

    test ecx, ecx
    jz .return_eax

    mov ebx, SIGN
    mov [edi], ebx
    mov ebx, 24
    mov [edi + 4], ebx
    add ebx, edi
    mov [edi + 16], ecx

    ;stdcall aP_crc32, esi, ecx
    invoke RtlComputeCrc32, 0, esi, ecx

    mov [edi + 20], eax

    stdcall aP_pack, esi, ebx, ecx, [workmem], [callback], [cbparam]

    cmp eax, -1
    je .return_eax
    
    mov [edi + 8], eax
    mov edx, eax

    ;stdcall aP_crc32, ebx, eax
    push edx
    invoke RtlComputeCrc32, 0, ebx, eax
    pop edx

    mov [edi + 12], eax
    lea eax, [edx + 24]
.return_eax:

    ret
endp


;   =========================================================
;       size_t aPsafe_get_orig_size( const void *source );
;   =========================================================
proc aPsafe_get_orig_size, source
    mov esi, [source]

    mov ebx, [esi]

    or eax, -1

    cmp ebx, SIGN
    jne .return_eax

    mov ebx, [esi + 4]
    cmp ebx, 24
    jb .return_eax
    mov eax, [esi + 16]

.return_eax:
    ret
endp


;   =========================================================
;       size_t aPsafe_depack( const void *source,
;                             size_t srclen,
;                             void *destination,
;                             size_t dstlen );
;   =========================================================
proc aPsafe_depack, source, srclen, destination, dstlen
    mov esi, [source]
    mov ecx, [srclen]
    mov edi, [destination]

    test esi, esi
    jz .return_error

    test edi, edi
    jz .return_error

    cmp ecx, 24
    jb .return_error

    mov ebx, [esi]

    cmp ebx, SIGN
    jne .return_error

    mov ebx, [esi + 4]
    cmp ebx, 24
    jb .return_error

    sub ecx, ebx
    jc .return_error

    cmp [esi + 8], ecx
    ja .return_error

    add ebx, esi

    ;stdcall aP_crc32, ebx, dword[esi + 8]
    invoke RtlComputeCrc32, 0, ebx, dword[esi + 8]

    cmp eax, [esi + 12]
    jne .return_error

    mov ecx, [dstlen]
    cmp [esi + 16], ecx
    ja .return_error

    stdcall aP_depack_asm_safe, ebx, dword[esi + 8], edi, ecx

    cmp eax, [esi + 16]
    jne .return_error

    mov ebx, eax

    ;stdcall aP_crc32, edi, eax
    invoke RtlComputeCrc32, 0, edi, eax

    cmp eax, [esi + 20]

    mov eax, ebx

    je .return_eax

.return_error:
    or eax, -1

.return_eax:

    ret
endp


;   =========================================================
;       size_t aP_depack_asm_safe( const void *source,
;                                  size_t srclen,
;                                  void *destination,
;                                  size_t dstlen );
;   =========================================================

macro getbitM {
    local .stillbitsleft
    add dl, dl
    jnz .stillbitsleft

    sub dword [esp + 4], 1
    jc return_error       ;

    mov dl, [esi]
    inc esi

    add dl, dl
    inc dl
  .stillbitsleft:
}

macro domatchM reg {
    push ecx
    mov ecx, [esp + 12 + _dlen$]
    sub ecx, [esp + 4]
    cmp reg, ecx
    pop ecx
    ja return_error

    sub [esp], ecx
    jc return_error

    push esi
    mov esi, edi
    sub esi, reg
    rep movsb
    pop esi
}

macro getgammaM reg {
    local .getmore
    mov reg, 1
  .getmore:
    getbitM
    adc reg, reg
    jc return_error
    getbitM
    jc .getmore
}

aP_depack_asm_safe:
    _ret$ equ 7*4
    _src$ equ 8*4 + 4
    _slen$ equ 8*4 + 8
    _dst$ equ 8*4 + 12
    _dlen$ equ 8*4 + 16

    pushad

    mov esi, [esp + _src$]
    mov eax, [esp + _slen$]
    mov edi, [esp + _dst$]
    mov ecx, [esp + _dlen$]

    push eax
    push ecx

    test esi, esi
    jz return_error

    test edi, edi
    jz return_error

    or ebp, -1

    cld
    xor edx, edx

literal:
    sub dword [esp + 4], 1
    jc return_error       ;

    mov al, [esi]
    add esi, 1

    sub dword [esp], 1
    jc return_error       ;

    mov [edi], al
    add edi, 1

    mov ebx, 2

nexttag:
    getbitM
    jnc literal

    getbitM
    jnc codepair

    xor eax, eax

    getbitM
    jnc shortmatch

    getbitM
    adc eax, eax
    getbitM
    adc eax, eax
    getbitM
    adc eax, eax
    getbitM
    adc eax, eax
    jz .thewrite

    mov ebx, [esp + 8 + _dlen$]
    sub ebx, [esp]
    cmp eax, ebx
    ja return_error

    mov ebx, edi
    sub ebx, eax
    mov al, [ebx]

  .thewrite:
    sub dword [esp], 1
    jc return_error

    mov [edi], al
    inc edi

    mov ebx, 2

    jmp nexttag

codepair:
    getgammaM eax

    sub eax, ebx

    mov ebx, 1

    jnz normalcodepair

    getgammaM ecx

    domatchM ebp

    jmp nexttag

normalcodepair:
    dec eax

    test eax, 0xff000000
    jnz return_error

    shl eax, 8

    sub dword [esp + 4], 1
    jc return_error       ;

    mov al, [esi]
    inc esi

    mov ebp, eax

    getgammaM ecx
    jmp @f
    x dd 32000
@@: cmp eax, [x]
    sbb ecx, -1

    cmp eax, 1280
    sbb ecx, -1

    cmp eax, 128
    adc ecx, 0

    cmp eax, 128
    adc ecx, 0

    domatchM eax
    jmp nexttag

shortmatch:
    sub dword [esp + 4], 1
    jc return_error       ;

    mov al, [esi]
    inc esi

    xor ecx, ecx
    db 0c0h, 0e8h, 001h
    jz donedepacking

    adc ecx, 2

    mov ebp, eax

    domatchM eax

    mov ebx, 1

    jmp nexttag

return_error:
    add esp, 8

    popad

    or eax, -1

    ret

donedepacking:
    add esp, 8

    sub edi, [esp + _dst$]
    mov [esp + _ret$], edi

    popad

    ret
