%include 'textmode.h'

call draw_border

mov di, 160 * 2 + 8			;where to place cursor
mov si, line01				;fetch the text
mov ah, 0x0A				;color
call slide_line

mov di, 160 * 2 + 58		;where to place cursor
mov si, line03				;fetch the text
call slide_line

mov di, 160 * 4 + 8			;where to place cursor
mov si, line04				;fetch the text
call slide_line

mov di, 160 * 6 + 8			;where to place cursor
mov si, line06				;fetch the text
call slide_line

mov di, 160 * 8 + 8			;where to place cursor
mov si, line08				;fetch the text
call slide_line

mov di, 160 * 8 + 68		;where to place cursor
mov si, line0A				;fetch the text
call slide_line

mov di, 160 * 10 + 8		;where to place cursor
mov si, line0B				;fetch the text
call slide_line

mov di, 160 * 10 + 82		;where to place cursor
mov si, line0D				;fetch the text
call slide_line



mov di, 160 * 2 + 36		;where to place cursor
mov si, line02				;fetch the text
mov ah, 0x07				;color
call slide_line

mov di, 160 * 4 + 32		;where to place cursor
mov si, line05				;fetch the text
call slide_line

mov di, 160 * 6 + 44		;where to place cursor
mov si, line07				;fetch the text
call slide_line

mov di, 160 * 8 + 44		;where to place cursor
mov si, line09				;fetch the text
call slide_line

mov di, 160 * 10 + 40		;where to place cursor
mov si, line0C				;fetch the text
call slide_line

jmp endloop

endloop:
jmp endloop

%include 'slide_frame.h'
%include 'pause.h'

line01 db 0x0D, 0x07, ' Breakpoint:'
line02 db 0x0A, 'br *0x7c12'
line03 db 0x11, '(break at 0x7c12)'
line04 db 0x0B, 0x07, ' Continue:'
line05 db 0x04, 'cont'
line06 db 0x11, 0x07, ' Show Registers:'  
line07 db 0x0E, 'info registers'
line08 db 0x11, 0x07, ' Mem/Stack Dump:'
line09 db 0x0B, 'x /b 0x7c12'
line0A db 0x1A, '(dumps starting at 0x7c12)'
line0B db 0x0F, 0x07, ' Dissassemble:'
line0C db 0x14, 'disas 0x7c12, 0x7c1f'
line0D db 0x20, '(dissasemble from 0x7c12-0x7c1f)'

titlemessage db 0x0F, 'Break and Dump'

;BIOS sig and padding
times 510-($-$$) db 0
dw 0xAA55