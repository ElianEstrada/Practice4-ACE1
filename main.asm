include macros/prints.asm
include macros/general.asm

.model small

.stack 100h

.data 

headerMsg db 0ah, 'UNIVERSIDAD DE SAN CARLOS DE GUATEMALA', 0ah,'FACULTAD DE INGENIERIA', 0ah, 'ESCUELA DE CIENCIAS Y SISTEMAS', 0ah, 'ARQUITECTURA DE COMPUTADORAS Y ENSAMBLADORES 1', 0ah, 'SECCION A', 0ah, 'NOMBRE: ELIAN SAUL ESTRADA URBINA', 0ah, 'CARNE: 201806838', 0ah, 'PRACTICA 4', '$'
menuMsg db 0ah, 0ah, '---------------PRINCIPAL MENU---------------', 0ah, '1. File Upload', 0ah, '2. Sort', 0ah, '3. Generate Report', 0ah, '4. Exit', 0ah, 0ah, 'Choose an Option please: ', '$'
fileUploadMsg db 0ah, 0ah, '---------------FILE UPLOAD---------------', '$'
velocityMenu db 0ah, 0ah, 'Ingrese una velocidad (0-9): ', '$'
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


velocity db ? , 0

.code 

    main proc

        mov dx, @DATA
        mov ds, dx

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

        QUICKSORT:

        SHELLSORT:        

        GENERA_REPORT:


        EXIT:
            print goodbyeMsg

            mov ah, 4ch
            int 21h
        
    
    main endp

end