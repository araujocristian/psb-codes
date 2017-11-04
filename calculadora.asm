%include "io.inc"

section .data

    msg     db      'CALCULADORA'
    msg1    db "92-", 0
    len     equ $-msg1
    
section .bss 
    string1: resb 100
    
section .text
global CMAIN
CMAIN:
    mov ebp, esp
    xor eax, eax
    xor ebx, ebx
    xor ecx, ecx
    xor edx, edx
    xor esi, esi
    xor edi, edi
    
    ;Pega a string
    pegaString: 
        GET_CHAR bl
        cmp bl, '+'
        jne comparaMenos
        je soma
        
    comparaMenos:
        cmp bl, '-'
        jne comparaDiv
        je subtracao
        
    comparaDiv: 
        cmp bl, '/'
        jne comparaMul
        je divisao
    
    comparaMul:
        cmp bl, '*'
        jne comparaEsp
        je multiplicacao
        
    comparaEsp:
        cmp bl, ' '
        jne verfim
        jmp pegaString
        
     verfim:
        cmp bl, '$'
        je fim
        jne empilha
        
      empilha:
        sub bx, 48
;       PRINT_DEC 4, bx         
        push bx
        PRINT_DEC 2,[ESP]
        NEWLINE
        
        jmp pegaString
        
        
       soma: 
            mov dx, [esp]
            add esp,2
            mov ax, [esp]
            add ax, dx
            PRINT_DEC 4,ax
            NEWLINE
            jmp desempilha
            
        subtracao:
            mov dx, [esp]
            add esp,2
            mov ax, [esp]
            sub ax, dx
            PRINT_DEC 4,ax
            NEWLINE
            jmp desempilha
            
        multiplicacao:
            mov dx, [esp]
            add esp,2
            mov ax, [esp]
            mul dx
            PRINT_DEC 4,ax
            NEWLINE
            jmp desempilha
            
         divisao:
            mov cx, [esp]
            add esp,2
            mov ax, [esp]
            div cx
            PRINT_DEC 4,ax
            NEWLINE
            jmp desempilha
            
          desempilha:
            pop bx
            add esp,2
            pop bx
            push ax
            jmp pegaString
            
           fim:
               ret
          