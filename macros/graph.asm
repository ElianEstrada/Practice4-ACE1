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

    pop di
    pop bx
    pop ax


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


    ;call seg_video
    LOCAL FOR1, FOR2, OUT_BAR

    push si
    push cx

    xor si, si
    mov si, left                                ;5
    xor cx, cx
    mov cx, up                                  ;25

    FOR1: 
        ;xor di, di
        mov cx, up

        FOR2: 

            pixelPaint cx, si, color            ;25, 5; 26, 5; 27, 5; 28, 5
            ;pixelPaint di, si, color

            inc cx                              ;26, 27, 28, 29

            cmp cx, down                        ;29 != 30
            jne FOR2
        
        inc si                                  
        cmp si, right
        jne FOR1

    OUT_BAR: 
        ;delay 2000

        pop cx
        pop si

    
ENDM

paintGraph MACRO count

    LOCAL FOR1;, FOR2

    push cx
    push ax
    push bx
    push dx

    xor ax, ax
    xor bx, bx
    mov cx, count
    mov ax, 8d
    mov bx, ax

    FOR1: 

        add bx, maxWidth

        call seg_video
        
        paintBar 25d, 165d, ax, bx, 15d

        call seg_text

        mov ax, bx
        add ax, 5d
        mov bx, ax
        LOOP FOR1

    pop dx
    pop bx
    pop ax
    pop cx

    
ENDM

posCursor MACRO row, column

    push ax 
    push bx
    push dx

    xor ax, ax

    mov ah, 02h
    mov bh, 00h
    mov dh, row
    mov dl, column
    int 10h

    xor ax, ax

    pop dx
    pop bx
    pop ax
    
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