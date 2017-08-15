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

mov di, 160 * 6 + 16		;where to place cursor
mov si, line03				;fetch the text
call slide_line

mov di, 160 * 8 + 16		;where to place cursor
mov si, line04				;fetch the text
call slide_line

mov di, 160 * 10 + 16		;where to place cursor
mov si, line05				;fetch the text
call slide_line

mov di, 160 * 4 + 48		;where to place cursor
mov si, line06				;fetch the text
mov ah, 0x07
call slide_line

mov di, 160 * 6 + 48		;where to place cursor
mov si, line07				;fetch the text
call slide_line

mov di, 160 * 8 + 48		;where to place cursor
mov si, line08				;fetch the text
call slide_line

mov di, 160 * 10 + 48		;where to place cursor
mov si, line09				;fetch the text
call slide_line

jmp endloop

endloop:
jmp endloop

%include 'slide_frame.h'
%include 'pause.h'

line01 db 0x14, 0x07, ' Basic Stack Setup:'
line02 db 0x0A, 'xor ax, ax'
line03 db 0x0A, 'mov ds, ax'
line04 db 0x0A, 'mov ss, ax'
line05 db 0x0E, 'mov sp, 0x9c00'
line06 db 0x0D, ';make it zero'
line07 db 0x05, ';DS=0'
line08 db 0x12, ';stack starts at 0'
line09 db 0x15, ';200h past code start'

titlemessage db 0x05, 'Stack'

;BIOS sig and padding
times 510-($-$$) db 0
dw 0xAA55