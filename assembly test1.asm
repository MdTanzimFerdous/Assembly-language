.model small
.stack 100h
.data
ms db 'Enter your CGPA:$' 
ms2 db 'Excellent$'
a db 52
.code 

main proc
    mov ax, @data
    mov ds, ax
    
    mov ah, 9
    lea dx, ms
    int 21h   
    
    mov ah, 1
    int 21h
    mov bl, al
    
    mov ah, 2
    mov dl, 10
    int 21h
    mov dl, 13
    int 21h
    
    cmp a, bl  
    jne exit
    je print
    print:
    mov ah, 9
    lea dx, ms2
    int 21h  
    
    
    
    exit:
    mov ah, 4ch
    int 21h
    main endp
end
