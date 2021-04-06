createFile macro name

    LOCAL ERROR, OUT_CREATE

    mov ah, 3ch
    mov cx, 00h
    lea dx, name

    int 21h

    mov handle, ax                          ;handle is a global variable
    jc ERROR
    jmp OUT_CREATE

    ERROR:
        print errorCreate                   ;errorCreate is a global variable

    OUT_CREATE: 

ENDM

writeFile macro content

    LOCAL ERROR, OUT_WRITE

    mov ah, 40h
    mov bx, handle                          ;handle is a global variable
    mov cx, LENGTHOF content
    lea dx, content
    int 21h

    jc ERROR
    jmp OUT_WRITE

    ERROR: 
        print errorWrite                   ;errorWrite is a global variable

    OUT_WRITE: 

ENDM

openFile macro name

    mov handle, 0000h

    mov ah, 3dh
    mov al, 000b
    lea dx, name
    int 21h

    mov handle, ax                      ;handle is a global variable

ENDM

readFile macro

    mov ah, 3fh
    mov bx, handle                      ;handle is a global variable
    mov cx, LENGTHOF bufferFile
    lea dx, bufferFile                  ;bufferFile is a global variable
    int 21h

ENDM

closeFile macro

    LOCAL ERROR, OUT_CLOSE

    mov ah, 3eh
    mov bx, handle                      ;handle is a global variable
    int 21h

    jc ERROR
    jmp OUT_CLOSE

    ERROR: 
        print errorClose                ;errorClose is a global varible

    OUT_CLOSE: 

ENDM