%include 'textmode.h'

call draw_border

mov di, 160 * 2 + 8			;where to place cursor
mov si, line01				;fetch the text
mov ah, 0x0A				;color
call slide_line

mov di, 160 * 4 + 16		;where to place cursor
mov si, line02				;fetch the text
call slide_line

call wait_loop
mov di, 160 * 8 + 8		;where to place cursor
mov si, line03				;fetch the text
call slide_line

mov di, 160 * 10 + 16		;where to place cursor
mov si, line04				;fetch the text
call slide_line

call wait_loop
mov di, 160 * 14 + 8		;where to place cursor
mov si, line05				;fetch the text
call slide_line

mov di, 160 * 16 + 16		;where to place cursor
mov si, line06				;fetch the text
call slide_line

call wait_loop
mov di, 160 * 20 + 8		;where to place cursor
mov si, line07				;fetch the text
call slide_line

mov di, 160 * 22 + 16		;where to place cursor
mov si, line08				;fetch the text
call slide_line

jmp endloop

endloop:
jmp endloop

%include 'slide_frame.h'
%include 'pause.h'

line01 db 0x0E, 0x07, ' CX Register:'
line02 db 0x28, 0x07, ' Counter used in conjunction with STOSW'
line03 db 0x14, 0x07, ' STOSW Instruction:'
line04 db 0x34, 0x07, ' Puts AX data into DI (Video Mem) and Decrements CX'
line05 db 0x14, 0x07, ' SCASW Instruction:'
line06 db 0x2A, 0x07, ' Increment DI with the least machine code'
line07 db 0x12, 0x07, ' CBW Instruction:'
line08 db 0x17, 0x07, ' Zero out AH in 1 byte'

titlemessage db 0x27, 'Important Registers and Instructions II'

;BIOS sig and padding
times 510-($-$$) db 0
dw 0xAA55