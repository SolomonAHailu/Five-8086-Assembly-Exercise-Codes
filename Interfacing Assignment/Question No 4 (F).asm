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
jmp start_section

password db '1','2','3','4','5'
input db '0','0','0','0','0'
message_grant db " Access granted! $ " 
message_deny db " Access denied! $ "
display1 db " Enter your password: $ "
display2 db " Please enter your password again to retry: $ " 
    
print_new_line macro   ;for new line 
   mov dl, 13
   mov ah, 2
   int 21h   
   mov dl, 10
   mov ah, 2
   int 21h      
endm  
start_section:
   lea bx,input 
   mov cx,5
    print_new_line
    print_new_line
   mov dx,offset display1
   mov ah,9
   int 21h   
inp:
   mov ah,1    ;waiting for input
   int 21h
   mov [bx],al
   inc bx 
   dec cx      ; decrement CX
   jnz inp     ; jump to inp if CX is not zero   
comp:
   lea si,password
   lea di,input 
   mov cx,5
   rep cmpsb
   jz success
    print_new_line
    print_new_line
   mov dx,offset message_deny
   mov ah,9
   int 21h         
trial2:     ;asking for second time for retrial     
   mov dx,offset display2
   mov ah,9
   int 21h
   lea bx,input  ; reset input buffer pointer
   mov cx,5      ; reseting CX
   jmp inp            
success:
    print_new_line   ;if correct confirm & jump for next trial
    print_new_line
   mov dx,offset message_grant
   mov ah,9
   int 21h  
done:
   ret