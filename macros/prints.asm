print macro string

    mov ah, 09h
    lea dx, string
    int 21h

ENDM

printc macro character
    mov ah, 02h
    mov dl, character
    int 21h
ENDM