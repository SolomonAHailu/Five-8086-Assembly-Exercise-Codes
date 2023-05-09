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
 
    mov bh,0
    mov bl,10d  
    lea si,message1
    mov ah,2
    mov cx,20
    num:
        mov dl,[si]
        int 21h 
        inc si
    loop num  
    
    input:
      lea di,userinput
      mov ah,1
      mov [di],al
      int 21h  
  
    cmp al,39h
    jae  error_section
    cmp al,31h
    je display 
    cmp al,30h
    je  display
     
    sub al,30h
    mov cl,al
    mov al,bh
    mul bl
    add al,cl
    mov bh,al
    
    and cx,0
    mov cl,bh
    dec cx 
    and ax,0      
    mov al,bh
        
    factorial_section:     
      mul cx
      loop factorial_section       
      and dx,0
      mov cx,10
      mov bx,0h
       
    store_section:         
      div cx
      mov [bx],dx
      add bx,2h
      mov dx,0
      cmp ax,0
      jne store_section
           
      lea si,message4
      mov ah,2
      mov cx,4
    nu:
      mov dl,[si]
      int 21h 
      inc si
    loop nu  
          
    print:
      sub bx,2h
      mov dl,[bx]
      add dl,30h
      int 21h              
      cmp bx,0
      jne print
      jmp return
       
    display:
      lea di,message2
      mov ah,2 
      mov cx,5
      ddd:
        mov dl,[di]
        int 21h
        inc di
      loop ddd 
       
      mov ah,86h
      mov cx,002eh
      int 15h 
    
      jmp return
      error_section:
          lea si,message3
          mov ah,2
          mov cx,25
      loopy:
          mov dl,[si]
          int 21h
          inc si
      loop loopy
       
      mov ah,86h
      mov cx,002eh
      int 15h
            
    return:
      ret       
message1 db  0ah,0dh,"Enter the number: "
message2 db  "! = 1"
message3 db 0ah,0dh,"Factorial out of bound"
message4 db "! = "
userinput db ?