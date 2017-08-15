%include 'textmode.h'

call draw_border

mov di, 160 * 2 + 8			;where to place cursor
mov si, line01				;fetch the text
mov ah, 0x0A				;color
call slide_line

mov di, 160 * 4 + 16		;where to place cursor
mov si, line02				;fetch the text
call slide_line

mov di, 160 * 6 + 16		;where to place cursor
mov si, line03				;fetch the text
call slide_line

mov di, 160 * 8 + 16		;where to place cursor
mov si, line04				;fetch the text
call slide_line

mov di, 160 * 10 + 16		;where to place cursor
mov si, line05				;fetch the text
call slide_line

jmp endloop

endloop:
jmp endloop

%include 'slide_frame.h'
%include 'pause.h'

line01 db 0x21, 0x07, ' Best way to get a random value:'
line02 db 0x13, 0x07, ' RDTSC Instruction'
line03 db 0x19, 0x07, ' Read Time-Stamp Counter'
line04 db 0x22, 0x07, ' Value is returned to AX Register'
line05 db 0x1E, 0x07, ' LSBs more "random" than MSBs'

titlemessage db 0x06, 'Random'

;BIOS sig and padding
times 510-($-$$) db 0
dw 0xAA55