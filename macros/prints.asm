print macro string

    push ax
    push dx

    mov ah, 09h
    lea dx, string
    int 21h

    pop dx
    pop ax

ENDM

printc macro character
    mov ah, 02h
    mov dl, character
    int 21h
ENDM