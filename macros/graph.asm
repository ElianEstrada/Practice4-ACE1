pixelPaint macro i, j, color

    push ax
    push bx
    push di

    xor ax, ax
    xor bx, bx
    xor di, di

    mov ax, 320d
    mov bx, i
    mul bx

    add ax, j

    mov di, ax
    mov [di], color

    xor ax, ax
    xor bx, bx
    xor di, di

    pop ax
    pop bx
    pop di


ENDM

paintBorder MACRO up, down, left, right, color

    LOCAL FOR1, FOR2, OUT_BORDER

    push si

    xor si, si
    mov si, left

    FOR1: 

        pixelPaint up, si, color
        pixelPaint down, si, color
        inc si

        cmp si, right
        jne FOR1

    xor si, si
    mov si, up

    FOR2: 

        pixelPaint si, left, color
        pixelPaint si, right, color

        inc si

        cmp si, down
        jne FOR2

    OUT_DELAY: 

        pop si

    
ENDM

paintBar MACRO up, down, left, right, color
    
ENDM


delay macro retard

    LOCAL FOR1, FOR2, OUT_DELAY

    push ax
    push bx

    xor ax, ax
    xor bx, bx

    mov ax, retard

    FOR1:

        dec ax
        jz OUT_DELAY

        mov bx, retard

        FOR2: 
            dec bx
            jnz FOR2

        jmp FOR1

    OUT_DELAY:
        xor ax, ax
        xor bx, bx 

        pop ax
        pop bx


ENDM