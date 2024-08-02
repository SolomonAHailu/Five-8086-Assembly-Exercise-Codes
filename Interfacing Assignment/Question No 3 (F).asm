




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

read proc
   mov bh,0dh 
   looper: 
       lea si, input
       mov ah, 1h
       int 21h
       add dl, 1   ; dl is used for counting purpose (numbers entered)
       cmp dl, 05h ; comparing count of numbers entered with 5 
       je ending
       cmp bh, al
       je ending 
   loop looper
   ending:
   hlt   
ret 
read endp

input db '0' 
