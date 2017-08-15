%include 'textmode.h'

call draw_border

mov di, 160 * 2 + 8			;where to place cursor
mov si, line01				;fetch the text
mov ah, 0x0A				;color
call slide_line

call wait_loop
mov di, 160 * 4 + 16		;where to place cursor
mov si, line02				;fetch the text
mov ah, 0xF0
call slide_line

mov di, 160 * 5 + 16		;where to place cursor
mov si, line03				;fetch the text
xor ah, ah
call color_bullet

mov di, 160 * 6 + 16		;where to place cursor
mov si, line04				;fetch the text
call color_bullet

mov di, 160 * 7 + 16		;where to place cursor
mov si, line05				;fetch the text
call color_bullet

mov di, 160 * 8 + 16		;where to place cursor
mov si, line06				;fetch the text
call color_bullet

mov di, 160 * 9 + 16		;where to place cursor
mov si, line07				;fetch the text
call color_bullet

mov di, 160 * 10 + 16		;where to place cursor
mov si, line08				;fetch the text
call color_bullet

mov di, 160 * 11 + 16		;where to place cursor
mov si, line09				;fetch the text
call color_bullet

mov di, 160 * 12 + 16		;where to place cursor
mov si, line0A				;fetch the text
call color_bullet

mov di, 160 * 13 + 16		;where to place cursor
mov si, line0B				;fetch the text
call color_bullet

mov di, 160 * 14 + 16		;where to place cursor
mov si, line0C				;fetch the text
call color_bullet

mov di, 160 * 15 + 16		;where to place cursor
mov si, line0D				;fetch the text
call color_bullet

mov di, 160 * 16 + 16		;where to place cursor
mov si, line0E				;fetch the text
call color_bullet

mov di, 160 * 17 + 16		;where to place cursor
mov si, line0F				;fetch the text
call color_bullet

mov di, 160 * 18 + 16		;where to place cursor
mov si, line10				;fetch the text
call color_bullet

mov di, 160 * 19 + 16		;where to place cursor
mov si, line11				;fetch the text
call color_bullet

jmp endloop

endloop:
jmp endloop

color_bullet:
	inc ah
	call slide_line
ret

%include 'slide_frame.h'
%include 'pause.h'

line01 db 0x1B, 0x07, ' In order, the colors are:'
line02 db 0x07, 0x07, ' Black'
line03 db 0x06, 0x07, ' Blue'
line04 db 0x07, 0x07, ' Green'
line05 db 0x06, 0x07, ' Cyan'
line06 db 0x05, 0x07, ' Red'
line07 db 0x09, 0x07, ' Magenta'
line08 db 0x08, 0x07, ' Orange'
line09 db 0x0C, 0x07, ' Light Grey'
line0A db 0x0B, 0x07, ' Dark Grey'
line0B db 0x08, 0x07, ' Purple'
line0C db 0x0D, 0x07, ' Light Green'
line0D db 0x0C, 0x07, ' Light Cyan'
line0E db 0x0B, 0x07, ' Light Red'
line0F db 0x0F, 0x07, ' Light Magenta'
line10 db 0x08, 0x07, ' Yellow'
line11 db 0x07, 0x07, ' White'


titlemessage db 0x06, 'Colors'

;BIOS sig and padding
times 510-($-$$) db 0
dw 0xAA55   