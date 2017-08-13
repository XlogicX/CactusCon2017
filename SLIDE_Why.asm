%include 'textmode.h'

call draw_border

mov di, 160 * 2 + 8			;where to place cursor
mov si, line01				;fetch the text
mov ah, 0x0A				;color
call slide_line

call wait_loop
mov di, 160 * 4 + 8			;where to place cursor
mov si, line02				;fetch the text
call slide_line

call wait_loop
mov di, 160 * 6 + 8			;where to place cursor
mov si, line03				;fetch the text
call slide_line

jmp endloop

endloop:
jmp endloop

%include 'slide_frame.h'
%include 'pause.h'

line01 db 0x11, 0x07, ' Because its fun'
line02 db 0x22, 0x07, ' Limitations encourage creativity'
line03 db 0x14, 0x07, ' Ring-0 programming'

titlemessage db 0x03, 'Why'

;BIOS sig and padding
times 510-($-$$) db 0
dw 0xAA55   
