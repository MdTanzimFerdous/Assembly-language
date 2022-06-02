.model small
.stack 100h
.data  
msg1 db 0dh,0ah, "Press A for palindrome check $",0dh, 0ah
msg2 db 0dh,0ah, "Press B for greater number of two $", 0dh, 0ah   
msg3 db 0dh,0ah, "Press C for exit $", 0dh, 0ah 
a_msg1 db 0dh,0ah, "Enter a string: $", 0dh, 0ah 
b_msg1 db 0dh,0ah, "Greater number is : $", 0dh, 0ah
b_msg2 db 0dh,0ah, "Both the numbers are equal : $", 0dh, 0ah   
b_msg3 db 0dh,0ah, "Enter the first number: $", 0dh, 0ah  
b_msg4 db 0dh,0ah, "Enter the second number: $", 0dh, 0ah
choose db 0dh,0ah, "Whose which operation to perform: $"  
thanks db 0dh,0ah, "THANK YOU!$", 0dh, 0ah   

yes db "palindrome$"
no db "not palindrome$"
str1 db 10,? 
.code    

main proc   
    mov ax, @data
    mov ds, ax   
    
    mov ah, 9
    lea dx, msg1
    int 21h
    
    mov ah, 9
    lea dx, msg2
    int 21h
    
    mov ah, 9
    lea dx, msg3
    int 21h    
    
    mov ah, 2
    mov dl, 10
    int 21h
    mov dl, 13
    int 21h 
    
    mov ah, 9
    lea dx, choose
    int 21h
          
    mov ah, 1
    int 21h
    mov bh, al 
    
    cmp bh, 'A'
    je if  
    cmp bh, 'B'
    je elseif 
    cmp bh, 'C'
    jmp exit
    
    if:   
        mov ah, 2
        mov dl, 10
        int 21h
        mov dl, 13
        int 21h
        
        mov ah, 9
        lea dx, a_msg1
        int 21h   
    
        lea dx,str1
        mov ah,0ah
        int 21h
        mov ax,0
        mov al,str1[1]
        add ax,1   
        
        mov si,ax
        mov bh,2h
        div bh
        mov cx,0
        mov cl,al
        mov di,2         
        
        mov ah, 2
        mov dl, 10
        int 21h
        mov dl, 13
        int 21h       
        
        loop1:
            mov bh, str1[si]
            cmp bh, str1[di]
                jnz exit1
                dec si
                inc di   
    
                loop loop1
                lea dx,yes
                mov ah,9
                int 21h
            jmp end1  
            
    elseif:  
        mov ah, 2
        mov dl, 10
        int 21h
        mov dl, 13
        int 21h  
        
        mov ah, 9
        lea dx, b_msg3
        int 21h     
          
        mov ah, 1
        int 21h
        mov bl, al 
        
        mov ah, 2
        mov dl, 10
        int 21h
        mov dl, 13
        int 21h 
        
        mov ah, 9
        lea dx, b_msg4
        int 21h 
        
        mov ah, 1
        int 21h
        mov bh, al  
        
        mov ah, 2
        mov dl, 10
        int 21h
        mov dl, 13
        int 21h
                    
        cmp bl, bh
        jg if1
        jne elseif1  
        je else1
        
        if1:
            mov ah, 9
            lea dx, b_msg1
            int 21h
          
            mov ah, 2
            mov dl, bl
            int 21h  
            jmp exit2:   
            
        elseif1:  
            mov ah, 9
            lea dx, b_msg1
            int 21h
            
            mov ah, 2
            mov dl, bh
            int 21h  
            jmp exit2:     
              
        else1:
            mov ah, 9
            lea dx, b_msg2
            int 21h    
           
            mov ah, 2
            mov dl, bh
            int 21h
            jmp exit2:     
    
    exit:
    lea dx,thanks
    mov ah,9
    int 21h  
    jmp exit2
    
    exit1:
    lea dx,no
    mov ah,9
    int 21h
      
    end1:  
    
    exit2:
    mov ah, 4ch
    int 21h
    main endp
end