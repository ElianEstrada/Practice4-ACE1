showArray macro listNumber

    LOCAL ITERATE, EXIT

    xor di, di
            
    ITERATE:

        clearBuffer bufferNumber
        xor ax, ax
        
        mov al, listNumber[di]

        cmp di, countList
        je EXIT

        getBuffer bufferNumber
        print bufferNumber
        printc 32d

        inc di 
        jmp ITERATE

    EXIT: 
        


ENDM