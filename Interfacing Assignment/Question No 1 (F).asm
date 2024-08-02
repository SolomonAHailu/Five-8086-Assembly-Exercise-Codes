



s



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                                                           ;;
;;                  ADDIS ABABA UNIVERSITY                   ;;
;;           ADDIS ABABA INSTITUTE OF TECHNOLOGY             ;;
;;       SCHOOL OF ELECTRICAL AND COMPUTER ENGINEERING       ;;
;;                                                           ;;
;;                                                           ;;
;;                  Name: Solomon Asregdew                   ;;
;;                  ID: UGR/4372/12                          ;;
;;                                                           ;;
;;                                                           ;;
;;                  Wednsday, May 9, 2023                    ;;
;;                                                           ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;     

org 100h 
.code
    lea si, labelx
    mov dl, [si]
    mov ah, 2h   
    mov cx,9
    prompt_disp1:
        mov dl, [si]
        int 21h
        inc si
    loop prompt_disp1 
    
    mov ah, 1h      
    int 21h 
    sub al, 30h
    mov bl, al ; x is in bl
    
    ; for new line
    mov dl, 0ah
    mov ah, 2h
    int 21h
    mov dl, 0dh
    int 21h
    
    lea si, labely
    mov dl, [si]
    mov ah, 2h   
    mov cx,9
    prompt_disp2:
        mov dl, [si]
        int 21h
        inc si
    loop prompt_disp2 
     
    mov ah, 1h
    int 21h
    sub al, 30h
    mov cl, al ; y is in cl
    
    cmp bl, cl 
    jg x_is_larger_than_y
        add bl, 1 
            
        ; for new line
        mov dl, 0ah
        mov ah, 2h
        int 21h
        mov dl, 0dh
        int 21h
    
        lea si, outputx
        mov dl, [si]
        mov ah, 2h   
        mov cx,16
        prompt_dispx:
            mov dl, [si]
            int 21h
            inc si
        loop prompt_dispx
        add bl, 30h
        mov ah, 2h
        mov dl, bl
        int 21h    
        hlt
    x_is_larger_than_y:
        sub cl, 1 
        mov bl, cl
        ; for new line
        mov dl, 0ah
        mov ah, 2h
        int 21h
        mov dl, 0dh
        int 21h
    
        lea si, outputy
        mov dl, [si]
        mov ah, 2h   
        mov cx,16
        prompt_dispy:
            mov dl, [si]
            int 21h
            inc si
        loop prompt_dispy
        add bl, 30h
        mov ah, 2h         
        mov dl, bl
        int 21h
        hlt 

inputx db '0'
inputy db '0'
labelx db 'Enter x: '
labely db 'Enter y: '
outputx db 'New x (x+1) is: '
outputy db 'New y (y-1) is: ' 
