getListNumber macro bufferContent, bufferListNumber, number

    LOCAL IGNORE_LINE, NOT_NUMBER, IS_NUMBER, NOT_BIGGER, OUT_LIST

    xor di, di
    xor si, si
    mov countList, 0000h

    IGNORE_LINE:

        cmp bufferContent[di], 0dh
        je NOT_NUMBER
        cmp bufferContent[di], 0ah
        je NOT_NUMBER

        inc di
        jmp IGNORE_LINE

    NOT_NUMBER:
        
        inc di

        cmp bufferContent[di], 3eh
        je IS_NUMBER
        cmp bufferContent[di], 24h
        je OUT_LIST

        jmp NOT_NUMBER

    IS_NUMBER:

        inc di

        cmp bufferContent[di], 3ch
        je VALIDATION_NUMBER
        cmp bufferContent[di], 30h
        jb NOT_NUMBER
        cmp bufferContent[di], 39h
        ja NOT_NUMBER

        mov bx, index
        mov cl, bufferContent[di]
        mov number[bx], cl

        inc index

        jmp IS_NUMBER

    VALIDATION_NUMBER:

        cmp index, 0000h
        je NOT_NUMBER

        mov bx, index
        mov number[bx], 24h

        mov siB, si
        getNumber number
        mov si, siB
        mov bufferListNumber[si], al
        inc si
        inc countList

        mov index, 0000h

        cmp maxNumber, ax 
        jae NOT_BIGGER

        mov maxNumber, ax

        jmp NOT_NUMBER

    NOT_BIGGER: 
        jmp NOT_NUMBER

    OUT_LIST:
        mov bufferListNumber[si], 24h



ENDM
