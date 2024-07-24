







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
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;                                                            ;

org 100h

lea si,prompt
mov ah,2
mov cx,18
prompt_disp:      ;displaying the message input (C)
    mov dl,[si]
    int 21h
    inc si
loop prompt_disp

lea si,input      ;taking input from user
mov ah,1
mov cx,2
input_disp: 
    int 21h 
    mov [si],al
    inc si
loop input_disp

lea si,input
mov al,[si] 
sub al,30h
inc si     
mov ah, [si]
sub ah,30h  
mov dl,ah
mov ah,0
mov bl,10
mul bl
add al,dl 

mov bl,9
mul bl
mov bl,5
div bl
add al,32

mov ch,ah    ; ch have remainder
mov ah,0 
mov bl,100
cmp al,bl
jae greaterHundred;      ;if al is above or equal 100 jump
mov bl,10
div bl
add al,30h
add ah,30h
lea si,result
inc si
mov [si],al
inc si
mov [si],ah 
inc si
jmp ending

greaterHundred:         ;this done when result is above 100
    mov bl,100
    div bl
    add al,30h
    lea si,result
    mov [si],al
    mov al,ah
    mov ah,0
    mov bl,10
    div bl
    add ah,30h
    add al,30h
    inc si
    mov [si],al
    inc si
    mov [si],ah  
    inc si
ending: 
    inc si       ; doing the decimal part
    mov al,ch
    mov bl,10 
    mul bl
    mov bl,5
    div bl
    add al,30h
    mov [si],al 
   
    mov dl,0Ah   ;enter and tab for displaying the result 
    mov ah,2
    int 21h
    mov dl,0Dh
    int 21h
              
    mov dl,0Ah
    mov ah,2
    int 21h
    mov dl,0Dh
    int 21h
    
    mov dl,09h
    int 21h
    
    lea si,input
    mov dl,[si]
    int 21h
    inc si
    mov dl,[si]
    int 21h
    mov dl,43h
    int 21h
    
    mov dl,3Dh
    int 21h

    lea si,result
    mov al,[si]
    mov ah,0
    mov bl,30h
    cmp al,bl
    jg isNotZero:
    inc si
    mov dl,[si]
    mov ah,2
    int 21h
    inc si
    mov dl,[si]
    int 21h
    jmp finish 
isNotZero:
    mov dl,[si]
    mov ah,2
    int 21h
    inc si
    mov dl,[si]
    int 21h
    inc si
    mov dl,[si]
    int 21h
finish: 
    inc si
    mov dl,[si]
    int 21h
    inc si
    mov dl,[si]
    int 21h
    mov dl,46h
    int 21h
ret

input db '0','0'    
result db '0','0','0','.','0','0'  
prompt db   "Enter Temp in 0C: "
