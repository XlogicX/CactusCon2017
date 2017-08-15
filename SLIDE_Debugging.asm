%include 'textmode.h'

call draw_border

mov di, 160 * 2 + 8			;where to place cursor
mov si, line01				;fetch the text
mov ah, 0x0A				;color
call slide_line

mov di, 160 * 4 + 16		;where to place cursor
mov si, line02				;fetch the text
call slide_line

mov di, 160 * 6 + 16		;where to place cursor
mov si, line03				;fetch the text
call slide_line

mov di, 160 * 8 + 16		;where to place cursor
mov si, line04				;fetch the text
call slide_line

mov di, 160 * 10 + 24		;where to place cursor
mov si, line05				;fetch the text
call slide_line

mov di, 160 * 12 + 24		;where to place cursor
mov si, line06				;fetch the text
call slide_line

mov di, 160 * 14 + 24		;where to place cursor
mov si, line07				;fetch the text
call slide_line

mov di, 160 * 16 + 24		;where to place cursor
mov si, line08				;fetch the text
call slide_line

jmp endloop

endloop:
jmp endloop

%include 'slide_frame.h'
%include 'pause.h'

line01 db 0x1F, 0x07, ' Debugging Boot Sector Images:'
line02 db 0x0F, 0x07, ' Using objdump'
line03 db 0x17, 0x07, ' Attaching qemu to gdb'
line04 db 0x15, 0x07, ' Actually using gdb:'
line05 db 0x0A, 0x07, ' Stepping'
line06 db 0x0D, 0x07, ' Breakpoints'
line07 db 0x19, 0x07, ' Show Registers & Memory'
line08 db 0x0D, 0x07, ' Disassemble'

titlemessage db 0x09, 'Debugging'

;BIOS sig and padding
times 510-($-$$) db 0
dw 0xAA55