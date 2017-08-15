%include 'textmode.h'

call draw_border

mov di, 160 * 2 + 8			;where to place cursor
mov si, line01				;fetch the text
mov ah, 0x0A				;color
call slide_line

mov di, 160 * 4 + 16		;where to place cursor
mov si, line02				;fetch the text
mov ah, 0x0E
call slide_line

call wait_loop
mov di, 160 * 8 + 8		;where to place cursor
mov si, line03				;fetch the text
mov ah, 0x0A
call slide_line

call wait_loop
mov di, 160 * 10 + 8		;where to place cursor
mov si, line04				;fetch the text
call slide_line

jmp endloop

endloop:
jmp endloop

%include 'slide_frame.h'
%include 'pause.h'

line01 db 0x14, 0x07, ' Different Padding:'
line02 db 0x19, 0x07, ' (1440*1024)', 0x2D, '($', 0x2D, '$$) db 0'
line03 db 0x18, 0x07, ' File extension is .img'
line04 db 0x27, 0x07, ' Create low spec VM and boot from it ', 0x01

titlemessage db 0x1B, 'Assembling with VirtualBox'

;BIOS sig and padding
times 510-($-$$) db 0
dw 0xAA55   