include macros/prints.asm
include macros/file.asm
include macros/general.asm
include macros/analize.asm
include macros/array.asm
include macros/sorts.asm
include macros/graph.asm

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


flagTrue db 31h, '$'
flagFalse db 30h, '$'
flagMenu db 30h, '$'
flagTypeSort db ?, '$'
isNegative db ?, '$'


velocity db ? , 0
handle dw ?, 0
index dw ?, 0
countList dw ?, 0
countList2 dw ?, 0
numberR dw ?, 0
aux dw ?, 0
aux2 dw ?, 0


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

            mov velocity, al

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

            ; pixelPaint 15d, 120h, 160
            ; pixelPaint 15d, 121h, 160
            ; pixelPaint 15d, 0, 0
            ; pixelPaint 15d, 0, 1

            paintBorder 20d, 195d, 5d, 315d, 15d



            delay 5000

            call mode_text

            ; showArray bufferList

            ; bubbleSortL bufferList

            ; printc 0ah

            ; showArray bufferList
            ; printc 0ah
            ; showArray bufferListB


        QUICKSORT:

        SHELLSORT:        

        GENERA_REPORT:


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


end