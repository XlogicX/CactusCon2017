%include 'textmode.h'

call draw_border

mov di, 160 * 2 + 8			;where to place cursor
mov si, line01				;fetch the text
mov ah, 0x0A				;color
call slide_line

mov di, 160 * 4 + 8			;where to place cursor
mov si, line02				;fetch the text
call slide_line

mov di, 160 * 6 + 8			;where to place cursor
mov si, line03				;fetch the text
call slide_line

mov di, 160 * 8 + 16		;where to place cursor
mov si, line04				;fetch the text
call slide_line

mov di, 160 * 10 + 16		;where to place cursor
mov si, line05				;fetch the text
call slide_line

mov di, 160 * 12 + 16		;where to place cursor
mov si, line06				;fetch the text
call slide_line

mov di, 160 * 12 + 60		;where to place cursor
mov si, line0C				;fetch the text
call slide_line

mov di, 160 * 14 + 16		;where to place cursor
mov si, line07				;fetch the text
call slide_line

mov di, 160 * 2 + 38		;where to place cursor
mov si, line08				;fetch the text
mov ah, 0x07
call slide_line

mov di, 160 * 4 + 40		;where to place cursor
mov si, line09				;fetch the text
call slide_line

mov di, 160 * 12 + 38		;where to place cursor
mov si, line0A				;fetch the text
mov ah, 0x0C
call slide_line

mov di, 160 * 14 + 30		;where to place cursor
mov si, line0B				;fetch the text
call slide_line

jmp endloop

endloop:
jmp endloop

%include 'slide_frame.h'
%include 'pause.h'

line01 db 0x0E, 0x07, ' Single Step:'
line02 db 0x0F, 0x07, ' Step n times:'
line03 db 0x16, 0x07, ' "Step Over" INT 0x10'
line04 db 0x1E, 0x07, ' Note address of the INT 0x10'
line05 db 0x16, 0x07, ' Add 2 to this number'
line06 db 0x0A, 0x07, ' Set your'  
line0C db 0x0F, 'to that address'
line07 db 0x06, 0x07, ' Then'
line08 db 0x04, 'step'
line09 db 0x06, 'step 7'
line0A db 0x0A, 'breakpoint'
line0B db 0x08, 'continue'

titlemessage db 0x0F, 'Stepping in GDB'

;BIOS sig and padding
times 510-($-$$) db 0
dw 0xAA55