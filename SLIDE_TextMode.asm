%include 'textmode.h'

call draw_border

mov di, 160 * 2 + 8			;where to place cursor
mov si, line01				;fetch the text
mov ah, 0x0A				;color
call slide_line

mov di, 160 * 4 + 16		;where to place cursor
mov si, line02				;fetch the text
call slide_line

call wait_loop
mov di, 160 * 8 + 8			;where to place cursor
mov si, line03				;fetch the text
call slide_line

call wait_loop
mov di, 160 * 10 + 16		;where to place cursor
mov si, line04				;fetch the text
call slide_line

mov di, 160 * 11 + 16		;where to place cursor
mov si, line05				;fetch the text
call slide_line

jmp endloop

endloop:
jmp endloop

%include 'slide_frame.h'
%include 'pause.h'

line01 db 0x15, 0x07, ' Graphics Mode 0x03:'
line02 db 0x20, 0x07, ' "Text Mode" - 80x25 characters'
line03 db 0x1B, 0x07, ' Each caracter is 2 bytes:'
line04 db 0x34, 0x07, ' Background Color - Text Color - Code 437 character'
line05 db 0x2D, '       4 bits      -   4 bits   -       8 bits'

titlemessage db 0x13, 'Text Mode Graphics'

;BIOS sig and padding
times 510-($-$$) db 0
dw 0xAA55   

;the 'screen' state is stored in memory and the 'di' register points to
;a memory location of one of the 'pixels' or colored characters