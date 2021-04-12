include macros/prints.asm
include macros/file.asm
include macros/general.asm
include macros/analize.asm
include macros/array.asm
include macros/sorts.asm
include macros/graph.asm

; arraySort struct

;     type db 0ah, 15 Dup(0), 0
;     inputArray db 0ah, 45 Dup(0), 0
;     sortArray db 0ah, 45 dup(0), 0
;     status db 30h, '$'

; arraySort ends

.model small

.stack 100h


.data 

headerMsg db 0ah, 'UNIVERSIDAD DE SAN CARLOS DE GUATEMALA', 0ah,'FACULTAD DE INGENIERIA', 0ah, 'ESCUELA DE CIENCIAS Y SISTEMAS', 0ah, 'ARQUITECTURA DE COMPUTADORAS Y ENSAMBLADORES 1', 0ah, 'SECCION A', 0ah, 'NOMBRE: ELIAN SAUL ESTRADA URBINA', 0ah, 'CARNE: 201806838', 0ah, 'PRACTICA 4', '$'
menuMsg db 0ah, 0ah, '---------------PRINCIPAL MENU---------------', 0ah, '1. File Upload', 0ah, '2. Sort', 0ah, '3. Generate Report', 0ah, '4. Exit', 0ah, 0ah, 'Choose an Option please: ', '$'
fileUploadMsg db 0ah, 0ah, '---------------FILE UPLOAD---------------', '$'
pathFileMsg db 0ah, 0ah, 'Enter path file: ', '$'
velocityMenu db 0ah, 0ah, 'Ingrese una velocidad (0-9): ', '$'
errorClose db 0ah, 0ah, 'Error Closing', '$'
errorWrite db 0ah, 0ah, 'Error Writing', '$'
errorCreate db 0ah, 0ah, 'Error Creating', '$'
sortMsg db 0ah, 0ah, '---------------SORT MENU---------------', 0ah, '1. BubbleSort', 0ah, '2. QuickSort', 0ah, '3. ShellSort', 0ah, 0ah, 'Choose an Option please: ', '$'
orMenuMsg db 0ah, 0ah, '---------------MODE SORT---------------', 0ah, '1. Falling', 0ah, '2. Upward', 0ah, 0ah, 'Choose an Option please: ', '$'
reportMsg db 0ah, 0ah, 'Rerport Generated Successfully', '$'
menuErrorMsg db 0ah, 'Please Choose a Valid Option.', '$'
goodbyeMsg db 0ah, 0ah, 'Good Bye...', '$'
keyPress db 0ah, 0ah, 'Press any key to continue...','$'
lblBubbleSort db 'BUBBLESORT', '$'
lblShellSort db 'SHELLSORT', '$'
lblVelocity db 'Velocity: ', '$'
lblTime db 'Time: ', '$'


reportFile db 'Report.xml ', 0
reportHeader db '<Arqui>', 0ah, 09h, '<Encabezado>', 0ah, 09h, 09h, '<Universidad> Universidad de San Carlos de Guatemala </Universiadad>', 0ah, 09h, 09h, '<Facultad> Facultad de Ingenieria </Facultad>', 0ah, 09h, 09h, '$'
reportHeader2 db '<Escuela> Ciencias y Sistemas </Escuela>', 0ah, 09h, 09h, '<Curso>', 0ah, 09h, 09h,09h, '<Nombre> Arquitectura de computadoras y ensambladores 1 </Nombre>', 0ah, 09h, 09h, 09h, '<Seccion> Seccion A </Seccion>', 0ah, 09h, 09h, '</Curso>', '$'
reportHeader3 db 0ah, 09h, 09h, '<Ciclo> Prier Semestre 2021 </Ciclo>', 0ah, 09h, 09h, '<Fecha>', 0ah, 09h, 09h, 09h, '$'
lblDayO db '<Dia>', '$'
lblDayC db '</Dia>', 0ah, 09h, 09h, 09h, '$'
lblMonthO db '<Mes>', '$'
lblMonthC db '</Mes>', 0ah, 09h, 09h, 09h, '$'
lblYearO db '<Anio>', '$'
lblYearC db '</Anio>', 0ah, 09h, 09h, '</Fecha>', 0ah, 09h, 09h, '$'
lblHourO db '<Hora>', '$'
lblHourC db '</Hora>', 0ah, 09h, 09h, 09h, '$'
lblMinuteO db '<Minutos>', '$'
lblMinuteC db '</Minutos>', 0ah, 09h, 09h, 09h, '$'
lblSecondO db '<Segundos>', '$'
lblSecondC db '</Segundos>', 0ah, 09h, 09h, '</Hora>', 0ah, 09h, 09h, '$'
lblStuden db '<Alumno>', 0ah, 09h, 09h, 09h, '<Nombre> Elian Saul Estrada Urbina </Nombre>', 0ah, 09h, 09h, 09h, '<Carne> 201806838 </Carne>', 0ah, 09h, 09h, '</Alumno>', 0ah, 09h, '</Encabezado>', 0ah, 09h, '$'
lblResult db '<Resultados>', 0ah, 09h, 09h, '<Tipo>', '$'
lblTypeC db '</Tipo>', 0ah, 09h, 09h, '$'
lblInputListO db '<Lista_Entrada>', '$'
lblInputListC db '</Lista_Entrada>', 0ah, 09h, 09h, '$'
lblSortListO db '<Lista_Ordenada>', '$'
lblSortListC db '</Lista_Ordenada>', 0ah, 09h, 09h, '$'
typeSort db 'Ascendente', '$'
typeSortb db 'Descendente', '$'
comma db ', ', '$'
lblBubbleSortO db '<Ordenamiento_BubbleSort>', 0ah, 09h, 09h, 09h, '$'
lblBubbleSortC db '</Ordenamiento_BubbleSort>', 0ah, 09h, '$'
lblVelocityO db '<Velocidad>', '$'
lblVelocityC db '</Velocidad>', 0ah, 09h, 09h, '$'
lblResultC db '</Resultado>', 0ah, '$'
lblHeaderC db '</Arqui>', '$'
lblEnter db 0ah,09h, 09h, 09h, '$'


flagTrue db 31h, '$'
flagFalse db 30h, '$'
flagMenu db 30h, '$'
flagTypeSort db ?, '$'
isNegative db ?, '$'


velocity dw ? , 0
lblVelocityV db ?, '$'
handle dw ?, 0
index dw ?, 0
countList dw ?, 0
countList2 dw ?, 0
maxNumber dw ?, 0
numberR dw ?, 0
aux dw ?, 0
aux2 dw ?, 0
maxWidth dw ?, 0
maxHeight dw ?, 0
currentValue dw ?, 0

year dw ?, 0
month db ?, 0
day db ?, 0
hour db ?, 0
minute db ?, 0
second db ?, 0


st0 db 'st0', '$'
st1 db 'st1', '$'
st2 db 'st2', '$'
st3 db 'st3', '$'
st4 db 'st4', '$'


bufferFileName db 15 dup('$'), 0
bufferFile db 10000 dup('$'), 0
bufferNumber db 4 dup('$'), 0
bufferList db 20 dup('$'), 0
bufferListB db 20 dup('$'), 0
bufferOrderList db 20 dup('$'), 0
bufferVelocity db 4 dup('$'), 0
bufferDate db 4 dup('$'), '$'


axB dw ?, 0
bxB dw ?, 0
cxB dw ?, 0
dxB dw ?, 0
siB dw ?, 0
diB dw ?, 0

.code 

    main proc

        mov dx, @DATA
        mov ds, dx
        mov es, dx

        MENU: 
            clear

            mov flagMenu, 30h

            print headerMsg
            print menuMsg

            inputOptions flagTrue

            cmp al, 31h
            je FILE_UPLOAD
            cmp al, 32h
            je VELOCITYOP
            cmp al, 33h
            je GENERA_REPORT
            cmp al, 34h
            je EXIT
            jne MENU_ERROR

        MENU_ERROR:
            clear

            print menuErrorMsg
            print keyPress
            inputOptions flagTrue

            chooseMenu flagMenu


        FILE_UPLOAD:
            print fileUploadMsg
            print pathFileMsg

            getInput bufferFileName

            openFile bufferFileName
            readFile 
            closeFile


            getListNumber bufferFile, bufferList, bufferNumber

            copy bufferList, bufferListB

            jmp MENU
        

        VELOCITYOP:

            print velocityMenu

            inputOptions flagTrue

            xor dx, dx
            mov dl, al 
            mov lblVelocityV, al

            sub dl, 48d

            xor ax, ax
            mov ax, dx
            mov dx, 300d

            ;mov bx, 200d
            mul dx
            mov bx, 3000d
            sub bx, ax

            mov velocity, bx
            mov ax, bx


        ORMENU: 

            clear 

            mov flagMenu, 32h

            print headerMsg
            print orMenuMsg

            inputOptions flagTrue

            cmp al, 31h
            jb MENU_ERROR
            cmp al, 32h
            ja MENU_ERROR

            mov flagTypeSort, al

        SORT:

            clear

            mov flagMenu, 31h

            print headerMsg
            print sortMsg

            inputOptions flagTrue

            cmp al, 31h
            je BUBBLESORT
            cmp al, 32h
            je QUICKSORT
            cmp al, 33h
            je SHELLSORT
            jne MENU_ERROR

        BUBBLESORT:

            call mode_video

            paintBorder 20d, 195d, 2d, 317d, 15d
            ;paintBar 25d, 180d, 10d, 20d, 15d

            call seg_text

                posCursor 1d, 1d
                print lblBubbleSort

                posCursor 1d, 13d
                print lblTime

                posCursor 1d, 25d
                print lblVelocity

                posCursor 1d, 35d
                print lblVelocityV

                call calcWidth

                ;mov currentValue, 25d


                ;call calcHeight

                call drawGraph
                delay velocity
                bubbleSortL bufferList
                
            call seg_video


            delay 3000

            call mode_text

            jmp MENU

        QUICKSORT:

        SHELLSORT:        

        GENERA_REPORT:

            createFile reportFile
            writeFile reportHeader
            writeFile reportHeader2
            writeFile reportHeader3
            call getDate
            mov al, day
            getBuffer bufferDate
            writeFile lblDayO
            writeFile bufferDate
            writeFile lblDayC
            mov al, month
            getBuffer bufferDate
            writeFile lblMonthO
            writeFile bufferDate
            writeFile lblMonthC
            mov ax, year
            getBuffer bufferDate
            writeFile lblYearO
            writeFile bufferDate
            writeFile lblYearC
            writeFile lblHourO
            writeFile lblEnter
            clearBuffer bufferDate
            call getTime
            mov al, hour
            getBuffer bufferDate
            writeFile lblHourO
            writeFile bufferDate
            writeFile lblHourC
            mov al, minute
            getBuffer bufferDate
            writeFile lblMinuteO
            writeFile bufferDate
            writeFile lblMinuteC
            mov al, second
            getBuffer bufferDate
            writeFile lblSecondO
            writeFile bufferDate
            writeFile lblSecondC
            writeFile lblStuden
            writeFile lblResult
            call getTypeSort
            writeFile lblTypeC
            writeFile lblInputListO
            showArray bufferListB
            writeFile lblInputListC
            writeFile lblSortListO
            showArray bufferList
            writeFile lblSortListC
            writeFile lblBubbleSortO
            writeFile lblVelocityO
            writeFile lblVelocityV
            writeFile lblVelocityC
            writeFile lblBubbleSortC
            writeFile lblResultC
            writeFile lblHeaderC

            closeFile

            print keyPress
            inputOptions flagFalse

            jmp MENU

        EXIT:
            print goodbyeMsg

            mov ah, 4ch
            int 21h
        
    
    main endp

    mode_video proc

        mov ax, 13h
        int 10h

        mov dx, 0A000h
        mov ds, dx
        ret

    mode_video endp

    mode_text proc

        mov ax, 03h
        int 10h

        mov dx, @DATA
        mov ds, dx
        mov es, dx

        ret

    mode_text endp

    seg_video proc

        push dx

        mov dx, 0A000h
        mov ds, dx

        pop dx

        ret

    seg_video endp

    ;description
    seg_text PROC

        push dx

        mov dx, @DATA
        mov ds, dx

        pop dx

        ret
        
    seg_text ENDP

    clearGraph PROC

        push ax
        push cx
        push dx

        mov ax, 0600h
        mov ch, 3d
        mov cl, 1d
        mov dh, 23d
        mov dl, 38d
        int 10h


        pop dx
        pop cx
        pop ax

        ret

    clearGraph ENDP

    ;description
    calcWidth PROC

        push ax
        push bx
        push cx
        push dx

        ; xor ax, ax
        ; xor bx, bx
        ; xor cx, cx

        mov cx, countList
        sub cx, 0001h

        mov ax, cx
        mov dx, 5d

        mul dx
        mov cx, ax

        xor ax, ax

        mov ax, 310d
        sub ax, cx

        mov bx, countList

        div bx

        mov maxWidth, ax

        pop dx
        pop cx
        pop bx
        pop ax
        
        ret

    calcWidth ENDP

    ;description
    calcHeight PROC

        push ax
        push cx
        push bx

        xor ax, ax
        xor bx, bx
        xor cx, cx

        mov ax, 140d
        mov bx, currentValue

        mul bx

        mov bx, maxNumber
        div bx

        xor bx, bx

        mov bx, 165d

        sub bx, ax

        mov maxHeight, bx
        
        pop bx
        pop cx
        pop ax

        ret

    calcHeight ENDP

    ;description
    drawGraph PROC

        push si
        push dx
        push ax 
        push bx
        push cx

        xor si, si
        xor dx, dx
        xor cx, cx

        mov cx, 8d
        

        LOOPPRINT: 

            cmp si, countList
            je OUT_DRAW

            xor dx, dx

            mov dl, bufferList[si]
            mov currentValue, dx

            call calcHeight

            xor bx, bx
            xor ax, ax
            mov bx, maxHeight
            mov ax, maxWidth
            add ax, cx

            cmp currentValue, 20d
            jbe RED

            cmp currentValue, 40d
            jbe BLUE

            cmp currentValue, 60d
            jbe YELLOW

            cmp currentValue, 80d
            jbe GREEN

            cmp currentValue, 99d
            jbe WHITE

            RED: 
                call seg_video
                paintBar bx, 165d, cx, ax, 4d
                jmp INCPOSLEFT

            BLUE: 
                call seg_video
                paintBar bx, 165d, cx, ax, 1d
                jmp INCPOSLEFT

            YELLOW:
                call seg_video
                paintBar bx, 165d, cx, ax, 14d
                jmp INCPOSLEFT

            GREEN: 
                call seg_video
                paintBar bx, 165d, cx, ax, 2d
                jmp INCPOSLEFT

            WHITE:
                call seg_video
                paintBar bx, 165d, cx, ax, 15d
                jmp INCPOSLEFT

            INCPOSLEFT: 
                call seg_text
                mov cx, ax
                add cx, 5d

                call showNumber

                inc si

                jmp LOOPPRINT

        OUT_DRAW: 

            pop cx
            pop bx
            pop ax 
            pop dx
            pop si
        
        ret
        
    drawGraph ENDP

    ;description
    showNumber PROC
        
        push ax
        push bx
        push dx

        ;xor dx, dx
        xor bx, bx

        mov al, cl
        mov bx, 8d

        div bx
        sub ax, 2d
        mov dx, ax

        ;call seg_video
        posCursor 22d, dl
        ;call seg_text

        ;getBuffer bufferNumber
        ;print bufferNumber

        mov al, bufferList[si]

        getBuffer bufferNumber
        print bufferNumber

        ;inputOptions flagFalse

        pop dx
        pop bx
        pop ax

        ret

    showNumber ENDP

    ;description
    getDate PROC
        
        push ax
        push dx
        push cx

        mov ah, 2ah
        int 21h

        mov year, cx
        mov month, dh
        mov day, dl

        pop cx
        pop cx
        pop ax

        ret
    getDate ENDP

    ;description
    getTime PROC
        
        push ax
        push cx
        push dx

        mov ah, 2ch
        int 21h

        mov hour, ch
        mov minute, cl
        mov second, dh

        pop dx
        pop cx
        pop ax

    getTime ENDP


    ;description
    getTypeSort PROC
        
        cmp flagTypeSort, 32h
        je SORTASC
        cmp flagTypeSort, 31h
        je SORTDESC

        SORTASC:
            writeFile typeSort
            ret

        SORTDESC: 
            writeFile typeSortb

        ret

    getTypeSort ENDP

end