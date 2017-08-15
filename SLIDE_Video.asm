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

mov di, 160 * 12 + 16		;where to place cursor
mov si, line06				;fetch the text
call slide_line

mov di, 160 * 14 + 16		;where to place cursor
mov si, line07				;fetch the text
call slide_line

mov di, 160 * 16 + 16		;where to place cursor
mov si, line05				;fetch the text
call slide_line

mov di, 160 * 4 + 48		;where to place cursor
mov si, line08				;fetch the text
mov ah, 0x07
call slide_line

mov di, 160 * 6 + 48		;where to place cursor
mov si, line09				;fetch the text
call slide_line

mov di, 160 * 8 + 48		;where to place cursor
mov si, line0A				;fetch the text
call slide_line

mov di, 160 * 10 + 48		;where to place cursor
mov si, line0B				;fetch the text
call slide_line

mov di, 160 * 12 + 48		;where to place cursor
mov si, line0C				;fetch the text
call slide_line

mov di, 160 * 14 + 48		;where to place cursor
mov si, line0D				;fetch the text
call slide_line

mov di, 160 * 16 + 48		;where to place cursor
mov si, line0E				;fetch the text
call slide_line

jmp endloop

endloop:
jmp endloop

%include 'slide_frame.h'
%include 'pause.h'

line01 db 0x14, 0x07, ' Basic Video Setup:'
line02 db 0x0C, 'mov ah, 0xb8'
line03 db 0x0A, 'mov es, ax'
line04 db 0x0C, 'mov al, 0x03'
line05 db 0x08, 'int 0x10'
line06 db 0x09, 'mov ah, 1'
line07 db 0x0C, 'mov ch, 0x26'
line08 db 0x12, ';text video memory'
line09 db 0x0A, ';ES=0xB800'
line0A db 0x0A, ';Text Mode'
line0B db 0x0A, ';BIOS Call'
line0C db 0x10, '; I hear this is'
line0D db 0x0C, '; good to do'
line0E db 0x0A, ';BIOS Call'


titlemessage db 0x05, 'Video'

;BIOS sig and padding
times 510-($-$$) db 0
dw 0xAA55