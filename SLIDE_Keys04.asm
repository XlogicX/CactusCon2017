%include 'textmode.h'

call draw_border

mov di, 160 * 2 + 8			;where to place cursor
mov si, line01				;fetch the text
mov ah, 0x0A				;color
call slide_line

mov di, 160 * 4 + 16		;where to place cursor
mov si, line02				;fetch the text
mov ah, 0x0E				;color
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

mov di, 160 * 5 + 24		;where to place cursor
mov si, line06				;fetch the text
mov ah, 0x07
call slide_line

mov di, 160 * 7 + 24		;where to place cursor
mov si, line07				;fetch the text
call slide_line

mov di, 160 * 9 + 24		;where to place cursor
mov si, line08				;fetch the text
call slide_line

mov di, 160 * 11 + 24		;where to place cursor
mov si, line09				;fetch the text
call slide_line

mov di, 160 * 12 + 16		;where to place cursor
mov si, line0A				;fetch the text
call slide_line

jmp endloop

endloop:
jmp endloop

%include 'slide_frame.h'
%include 'pause.h'

line01 db 0x0F, 0x07, ' Do The Stuff:'
line02 db 0x05, 'down:'
line03 db 0x05, 'left:'
line04 db 0x03, 'up:'
line05 db 0x06, 'right:'
line06 db 0x0E, ';do down stuff'
line07 db 0x0E, ';do left stuff'
line08 db 0x0C, ';do up stuff'
line09 db 0x0F, ';do right stuff'
line0A db 0x11, ';do defualt stuff'

titlemessage db 0x11, 'Keyboard Input IV'

;BIOS sig and padding
times 510-($-$$) db 0
dw 0xAA55