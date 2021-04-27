
; set data segment to code segment:
org 100h

mov ah,9
lea dx,msg
int 21h
        
        
        
mov ah,1
int 21h
        
sub al,'0'

mov bl, 10
mul bl
mov bl, al
mov ah, 1
int 21h
sub al, '0'
add al, bl        

mov min,al



mov ah,9
lea dx,msg2
int 21h

mov ah,1
int 21h
        
sub al,'0'

mov bl, 10
mul bl
mov bl, al
mov ah, 1
int 21h
sub al, '0'
add al, bl        

mov max,al  



start:


in al, 125

cmp al, min
jl  lowTemp

cmp al, max
jle  ok
jg   highTemp

lowTemp:
mov al, 1
out 127, al   ; turn heater "on".
jmp ok

highTemp:
mov al, 0
out 127, al   ; turn heater "off". 

ok:
jmp start   ; rerun loop.


msg db "Enter Min Value",0dh,0ah,"$"
msg2 db 0dh,0ah,"Enter Max Value",0dh,0ah,"$"
min db 0
max db 0                                              
                                              
ret        


