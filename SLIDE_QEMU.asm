%include 'textmode.h'

call draw_border

mov di, 160 * 2 + 8			;where to place cursor
mov si, line01				;fetch the text
mov ah, 0x0A				;color
call slide_line

mov di, 160 * 4 + 16		;where to place cursor
mov si, line02				;fetch the text
call slide_line

mov di, 160 * 6 + 24		;where to place cursor
mov si, line03				;fetch the text
mov ah, 0x07				;color
call slide_line

call wait_loop
mov di, 160 * 10 + 8		;where to place cursor
mov si, line04				;fetch the text
mov ah, 0x0A				;color
call slide_line

mov di, 160 * 12 + 16		;where to place cursor
mov si, line05				;fetch the text
mov ah, 0x07
call slide_line

mov di, 160 * 14 + 16		;where to place cursor
mov si, line06				;fetch the text
call slide_line

jmp endloop

endloop:
jmp endloop

%include 'slide_frame.h'
%include 'pause.h'

line01 db 0x21, 0x07, ' Assembling and using with Qemu:'
line02 db 0x12, 0x07, ' Assemble source:'
line03 db 0x2A, 0x07, ' nasm yourboot.asm -f bin -o yourboot.bin'
line04 db 0x10, 0x07, ' Run with qemu:'
line05 db 0x17, 0x07, ' qemu tronsolitare.bin'
line06 db 0x24, 0x07, ' qemu-system-i386 -hda yourboot.bin'

titlemessage db 0x15, 'Assembling with Qemu'

;BIOS sig and padding
times 510-($-$$) db 0
dw 0xAA55   