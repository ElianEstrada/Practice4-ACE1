clear macro

    mov ax, 0600h
    mov cx, 0000h
    mov dx, 184Fh
    int 10h

ENDM

backup macro

    mov axB, ax                     ;axB is a global variable
    mov bxB, bx                     ;bxB is a global variable
    mov cxB, cx                     ;cxB is a global variable
    mov dxB, dx                     ;dxB is a global variable
    mov siB, si                     ;siB is a global variable

ENDM

restarR macro

    mov ax, axB
    mov bx, bxB
    mov cx, cxB
    mov dx, dxB
    mov si, siB

    xor axB, 0000h
    xor bxB, 0000h
    xor cxB, 0000h
    xor dxB, 0000h
    xor siB, 0000h

ENDM

clearR macro

    xor ax, ax
    xor bx, bx
    xor cx, cx
    xor dx, dx

ENDM

inputOptions macro option

    LOCAL SHOW_ENTER
    LOCAL HIDDE_ENTER
    LOCAL OUT_MACRO

    cmp option, 31h
    je SHOW_ENTER
    jne HIDDE_ENTER

    SHOW_ENTER:
        mov ah, 01h 
        int 21h
        
        jmp OUT_MACRO

    HIDDE_ENTER:
        mov ah, 08h
        int 21h

    OUT_MACRO:

ENDM

chooseMenu macro flag

    cmp flag, 30h
    je MENU
    cmp flag, 31h
    je SORT
    cmp flag, 32h
    je ORMENU

ENDM