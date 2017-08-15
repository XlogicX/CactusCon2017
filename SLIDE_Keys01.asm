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

jmp endloop

endloop:
jmp endloop

%include 'slide_frame.h'
%include 'pause.h'

line01 db 0x24, 0x07, ' Alias the keyboard keycodes first:'
line02 db 0x0B, 'LEFT EQU 75'
line03 db 0x0C, 'RIGHT EQU 77'
line04 db 0x09, 'UP EQU 72'
line05 db 0x0B, 'DOWN EQU 80'

titlemessage db 0x10, 'Keyboard Input I'

;BIOS sig and padding
times 510-($-$$) db 0
dw 0xAA55