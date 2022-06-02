.model small
.stack 100h
.data    
msg3 db 'greater than 5 $'
msg4 db 'equal to 5 $'
msg5 db 'less than 5 $'
.code

main proc        
     mov ax, @data
     mov ds, ax
     
     mov ah, 1
     int 21h  
     mov bl, al
     
     cmp bl, 53
     jg greater:
     je equal:
     jl less:
     
     greater:
     
     mov ah, 2
     mov dl, 10
     int 21h
     mov dl, 13
     int 21h
     
     mov ah, 9
     lea dx, msg3  
     int 21h 
     jmp exit
     
     equal:     
     
       
     mov ah, 2
     mov dl, 10
     int 21h
     mov dl, 13
     int 21h
     
     mov ah, 9
     lea dx, msg4  
     int 21h 
     jmp exit
     
     less:   
     
       
     mov ah, 2
     mov dl, 10
     int 21h
     mov dl, 13
     int 21h
     
     mov ah, 9
     lea dx, msg5  
     int 21h
     jmp exit
     
            
     exit:
     mov ah, 4ch
     int 21h
     main endp
end
     
     
     
      
