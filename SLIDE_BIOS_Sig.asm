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

call wait_loop
mov di, 160 * 10 + 8		;where to place cursor
mov si, line04				;fetch the text
mov ah, 0x0A				;color
call slide_line

mov di, 160 * 12 + 16		;where to place cursor
mov si, line05				;fetch the text
mov ah, 0x0E
call slide_line

jmp endloop

endloop:
jmp endloop

%include 'slide_frame.h'
%include 'pause.h'

line01 db 0x1D, 0x07, ' BIOS Signature and Padding:'
line02 db 0x11, 0x07, ' 510-($-$$) db 0'
line03 db 0x0B, 0x07, ' dw 0xAA55'
line04 db 0x15, 0x07, ' Nasm ORG directive:'
line05 db 0x0E, 0x07, ' [ORG 0x7c00]'

titlemessage db 0x1C, 'Padding, Signature, and ORG'

;BIOS sig and padding
times 510-($-$$) db 0
dw 0xAA55   