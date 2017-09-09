;This slide isn't the patched one that contains the magic bytes to make the checksum match
%include 'textmode.h'

call draw_border

mov di, 160 * 2 + 8			;where to place cursor
mov si, line01				;fetch the text
mov ah, 0x0A				;color
call slide_line

mov di, 160 * 4 + 16		;where to place cursor
mov si, line02				;fetch the text
call slide_line

mov di, 160 * 6 + 16			;where to place cursor
mov si, line03				;fetch the text
call slide_line

mov di, 160 * 8 + 8			;where to place cursor
mov si, line04				;fetch the text
call slide_line

mov di, 160 * 10 + 16			;where to place cursor
mov si, line05				;fetch the text
call slide_line

mov di, 160 * 12 + 8		;where to place cursor
mov si, line06				;fetch the text
call slide_line

mov di, 160 * 14 + 16		;where to place cursor
mov si, line07				;fetch the text
call slide_line

mov di, 160 * 16 + 16		;where to place cursor
mov si, line08				;fetch the text
call slide_line


jmp endloop

endloop:
jmp endloop

%include 'slide_frame.h'
%include 'pause.h'

line01 db 0x09, 0x07, ' XlogicX'
line02 db 0x08, '@XlogicX'
line03 db 0x12, 'github.com/XlogicX'
line04 db 0x0E, 0x07, ' Bryan Geesey'
line05 db 0x15, 'github.com/darkvoxels'  
line06 db 0x0D, 0x07, ' BIOS Slides'
line07 db 0x21, 'github.com/XlogicX/CactusCon2017/'
line08 db 0x15, 'CRC16: 0x7A69 (31337)'

titlemessage db 0x08, 'About Us'

;BIOS sig and padding
times 510-($-$$) db 0
dw 0xAA55
