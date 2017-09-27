%include 'textmode.h'

call draw_border

mov di, 160 * 2 + 8			;where to place cursor
mov si, line01				;fetch the text
mov ah, 0x0A				;color
call slide_line

mov di, 160 * 4 + 16		;where to place cursor
mov si, line02				;fetch the text
call slide_line

; The Playing Board of Tetranglix
mov ah, 0x77
mov di, 160 * 6 + 32
mov cx, 4
rep stosw
add di, 20
mov cx, 4
rep stosw
board:
add di, 124
mov cx, 4
rep stosw
add di, 20
mov cx, 4
rep stosw
dec byte [counter]
cmp byte [counter], 0
jne board

; A Peice on bottom
mov di, 3730
mov cx, 3
rep stosw
mov di, 3574
stosw

; Horizontal Peice
mov di, 2126
stosw
add di, 158
stosw
add di, 158
stosw
add di, 158
stosw

jmp endloop

endloop:
jmp endloop

%include 'slide_frame.h'

line01 db 0x0B, 0x07, 'Tetranglix'
line02 db 0x26, 0x07, 'https://github.com/Shikhin/tetranglix'

titlemessage db 0x0A, 'Tetranglix'
counter db 0x11

;BIOS sig and padding
times 510-($-$$) db 0
dw 0xAA55