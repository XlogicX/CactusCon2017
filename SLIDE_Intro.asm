%include 'textmode.h'

call draw_border

mov di, 160 * 2 + 8			;where to place cursor
mov si, line01				;fetch the text
mov ah, 0x0A				;color
call slide_line

mov di, 160 * 11 + 8		;where to place cursor
mov si, line02				;fetch the text
call slide_line

mov di, 160 * 16 + 8	    ;where to place cursor
mov si, line03				;fetch the text
call slide_line

call wait_loop
mov di, 160 * 3 + 16	    ;where to place cursor
mov si, line04				;fetch the text
call slide_line

call wait_loop
mov di, 160 * 4 + 16	    ;where to place cursor
mov si, line05				;fetch the text
call slide_line

call wait_loop
mov di, 160 * 5 + 16	    ;where to place cursor
mov si, line06				;fetch the text
call slide_line

call wait_loop
mov di, 160 * 6 + 16	    ;where to place cursor
mov si, line07				;fetch the text
call slide_line

call wait_loop
mov di, 160 * 7 + 16	    ;where to place cursor
mov si, line08				;fetch the text
call slide_line

call wait_loop
mov di, 160 * 8 + 16	    ;where to place cursor
mov si, line09				;fetch the text
call slide_line

call wait_loop
mov di, 160 * 9 + 16	    ;where to place cursor
mov si, line10				;fetch the text
call slide_line

jmp endloop

endloop:
jmp endloop

%include 'slide_frame.h'
%include 'pause.h'

line01 db 0x21, 0x07, ' Educational (Programming) topics:'
	line04 db 0x1c, 0x07, ' BIOS signature and padding'
	line05 db 0x0c, 0x07, ' Assembling'
	line06 db 0x2a, 0x07, ' Text/Graphics Mode, Video, & Stack setup'
	line07 db 0x15, 0x07, ' Important Registers'
	line08 db 0x11, 0x07, ' Time Delay Loop'
	line09 db 0x18, 0x07, ' Keyboard Input Methods'
	line10 db 0x14, 0x07, ' Randomness & Colors'	
line02 db 0x0c, 0x07, ' Debugging:'
line03 db 0x12, 0x07, ' Showcases/Demos:'

titlemessage db 0x0c, 'Introduction'

;BIOS sig and padding
times 510-($-$$) db 0
dw 0xAA55   