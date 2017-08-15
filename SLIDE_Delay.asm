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

mov di, 160 * 10 + 20		;where to place cursor
mov si, line05				;fetch the text
call slide_line

mov di, 160 * 12 + 20		;where to place cursor
mov si, line06				;fetch the text
call slide_line

mov di, 160 * 4 + 54		;where to place cursor
mov si, line07				;fetch the text
mov ah, 0x07
call slide_line

mov di, 160 * 6 + 54		;where to place cursor
mov si, line08				;fetch the text
call slide_line

jmp endloop

endloop:
jmp endloop

%include 'slide_frame.h'
%include 'pause.h'

line01 db 0x22, 0x07, ' Code for simple time delay loop:'
line02 db 0x10, 'mov bx, [0x046C]'
line03 db 0x09, 'add bx, 2'
line04 db 0x06, 'delay:'
line05 db 0x10, 'cmp [0x046C], bx'
line06 db 0x08, 'jb delay'
line07 db 0x10, ';Get timer state'
line08 db 0x16, ';2 ticks (can be more)'

titlemessage db 0x0F, 'Time Delay Loop'

;BIOS sig and padding
times 510-($-$$) db 0
dw 0xAA55