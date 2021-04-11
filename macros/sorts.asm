bubbleSortL macro listNumber

    LOCAL FOR1, FOR2, INCFO1, ASC, DESC, IF, OUT_BUBBLE

    xor si, si
    xor di, di
    xor bx, bx
    xor ax, ax
    xor cx, cx

    mov ax, countList
    mov countList2, ax
    sub countList2, 0001h

    FOR1: 

        cmp si, countList2
        je OUT_BUBBLE

        mov di, si
        add di, 0001h

    FOR2: 

        cmp di, countList
        je INCFO1

        xor ax, ax

        mov al, listNumber[di]
        mov aux, ax

        cmp flagTypeSort, 31h
        je DESC
        cmp flagTypeSort, 32h
        je ASC

    ASC:


        cmp al, listNumber[si]
        jb IF

        inc di
        jmp FOR2

    DESC:

        cmp al, listNumber[si]
        ja IF

        inc di
        jmp FOR2


    INCFO1:
        
        inc si

        jmp FOR1

    IF: 

        xor cl, cl

        mov cl, listNumber[si]
        mov listNumber[di], cl
        mov listNumber[si], al

        inc di
        jmp FOR2

    OUT_BUBBLE: 

        xor si, si
        xor di, di
        xor bx, bx
        xor ax, ax
        xor cx, cx


ENDM