%include 'textmode.h'

call draw_border

mov di, 160 * 2 + 8			;where to place cursor
mov si, line01				;fetch the text
mov ah, 0x07				;color
call slide_line

mov di, 160 * 3 + 8			;where to place cursor
mov si, line02				;fetch the text
mov ah, 0x0E				;color
call slide_line

mov di, 160 * 4 + 8			;where to place cursor
mov si, line03				;fetch the text
call slide_line

mov di, 160 * 5 + 8			;where to place cursor
mov si, line04				;fetch the text
call slide_line

mov di, 160 * 6 + 8			;where to place cursor
mov si, line05				;fetch the text
call slide_line

mov di, 160 * 7 + 8			;where to place cursor
mov si, line06				;fetch the text
call slide_line

mov di, 160 * 8 + 8			;where to place cursor
mov si, line07				;fetch the text
call slide_line

mov di, 160 * 9 + 8			;where to place cursor
mov si, line08				;fetch the text
call slide_line

mov di, 160 * 10 + 8			;where to place cursor
mov si, line09				;fetch the text
call slide_line

jmp endloop

endloop:
jmp endloop

%include 'slide_frame.h'
%include 'pause.h'

line01 db 0x2D, ';Check for directional pushes and take action'
line02 db 0x0C, 'cmp ah, LEFT'
line03 db 0x07, 'je left'
line04 db 0x0D, 'cmp ah, RIGHT'
line05 db 0x08, 'je right'
line06 db 0x0A, 'cmp ah, UP'
line07 db 0x05, 'je up'
line08 db 0x0C, 'cmp ah, DOWN'
line09 db 0x0C, 'jne mainloop'

titlemessage db 0x12, 'Keyboard Input III'

;BIOS sig and padding
times 510-($-$$) db 0
dw 0xAA55