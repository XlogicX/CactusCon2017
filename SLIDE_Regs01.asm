%include 'textmode.h'

call draw_border

mov di, 160 * 2 + 8			;where to place cursor
mov si, line01				;fetch the text
mov ah, 0x0A				;color
call slide_line

call wait_loop
mov di, 160 * 4 + 16		;where to place cursor
mov si, line02				;fetch the text
call slide_line

call wait_loop
mov di, 160 * 6 + 16		;where to place cursor
mov si, line03				;fetch the text
call slide_line

call wait_loop
mov di, 160 * 10 + 8		;where to place cursor
mov si, line04				;fetch the text
call slide_line

call wait_loop
mov di, 160 * 12 + 16		;where to place cursor
mov si, line05				;fetch the text
call slide_line

mov di, 160 * 14 + 24		;where to place cursor
mov si, line06				;fetch the text
call slide_line

mov di, 160 * 16 + 24		;where to place cursor
mov si, line07				;fetch the text
call slide_line

mov di, 160 * 18 + 24		;where to place cursor
mov si, line08				;fetch the text
call slide_line

jmp endloop

endloop:
jmp endloop

%include 'slide_frame.h'
%include 'pause.h'

line01 db 0x0E, 0x07, ' DI Register:'
line02 db 0x28, 0x07, ' The "Screen" state is stored in memory'
line03 db 0x32, 0x07, ' 16-bit pointer to a "pixel" of the screen buffer'
line04 db 0x0E, 0x07, ' AX Register:'
line05 db 0x13, 0x07, ' Pixel Data (BFCC)'
line06 db 0x14, 0x07, ' B: 4-bit Backgound'
line07 db 0x15, 0x07, ' F: 4-bit Foreground'
line08 db 0x17, 0x07, ' CC: Code437 Character'

titlemessage db 0x26, 'Important Registers and Instructions I'

;BIOS sig and padding
times 510-($-$$) db 0
dw 0xAA55