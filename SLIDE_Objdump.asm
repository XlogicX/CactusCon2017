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
mov ah, 0x07
call slide_line

jmp endloop

endloop:
jmp endloop

%include 'slide_frame.h'
%include 'pause.h'

line01 db 0x1B, 0x07, ' These programs are 16-bit'
line02 db 0x1D, 0x07, ' There are no ELF/PE headers'
line03 db 0x16, 0x07, ' Recommended Command:'
line04 db 0x35, 'objdump -D -b binary -mi386 -Maddr16,data16 YourImage'

titlemessage db 0x0D, 'Using Objdump'

;BIOS sig and padding
times 510-($-$$) db 0
dw 0xAA55