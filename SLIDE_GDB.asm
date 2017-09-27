%include 'textmode.h'

call draw_border

mov di, 160 * 2 + 8			;where to place cursor
mov si, line01				;fetch the text
mov ah, 0x0A				;color
call slide_line

mov di, 160 * 4 + 16		;where to place cursor
mov si, line02				;fetch the text
mov ah, 0x07
call slide_line

mov di, 160 * 6 + 16		;where to place cursor
mov si, line03				;fetch the text
call slide_line

mov di, 160 * 8 + 16		;where to place cursor
mov si, line04				;fetch the text
call slide_line

;rdpmc

mov di, 160 * 10 + 16		;where to place cursor
mov si, line05				;fetch the text
call slide_line

mov di, 160 * 12 + 16		;where to place cursor
mov si, line06				;fetch the text
call slide_line

mov di, 160 * 14 + 16		;where to place cursor
mov si, line07				;fetch the text
call slide_line

jmp endloop

endloop:
jmp endloop

%include 'slide_frame.h'
%include 'pause.h'

line01 db 0x15, 0x07, ' Start GDB and type:'
line02 db 0x3F, 'target remote | qemu -S -gdb stdio -m 16 -boot c -hda YourImage'
line03 db 0x16, 'set architecture i8086'
line04 db 0x17, 'display /i ($cs*16)+$pc'
line05 db 0x08, 'stepi 11'
line06 db 0x0A, 'br *0x7c00'
line07 db 0x04, 'cont'

titlemessage db 0x15, 'Attaching Qemu to GDB'

;BIOS sig and padding
times 510-($-$$) db 0
dw 0xAA55