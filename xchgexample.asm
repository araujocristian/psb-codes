%include "io.inc"

Section .data
 val1 DW 1000h
 val2 DW 2000h
 
Section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
 mov ax, [val1] ; AX = 1000h
 xchg ax, [val2] ; AX= 2000h , val2 = 1000h
 mov [val1], ax ; val1 = 2000h
 
ret