%include 'textmode.h'

call draw_border

mov di, 160 * 2 + 8			;where to place cursor
mov si, line01				;fetch the text
mov ah, 0x0A				;color
call slide_line

mov di, 160 * 4 + 16		;where to place cursor
mov si, line02				;fetch the text
call slide_line

;Draw Border
mov ah, 0x11
mov di, 160 * 6 + 32
mov cx, 40
rep stosw
mov di, 160 * 21 + 32
mov cx, 40
rep stosw

mov di, 160 * 7 + 32
vert1:
stosw
dec byte [counter]
add di, 158
cmp byte [counter], 0
jne vert1
mov byte [counter], 0x0E

mov di, 160 * 7 + 110
vert2:
stosw
dec byte [counter]
add di, 158
cmp byte [counter], 0
jne vert2


;Draw player
mov ah, 0x22
mov di, 160 * 9 + 48
mov cx, 24
rep stosw
mov di, 160 * 10 + 62
mov cx, 17
rep stosw
mov di, 160 * 11 + 62
stosw
mov di, 160 * 12 + 62
stosw
mov di, 160 * 13 + 62
stosw

;Draw some bonuses
mov ah, 0xAF
mov al, 0x32
mov di, 160 * 15 + 80
stosw
mov al, 0x36
mov di, 160 * 8 + 40
stosw
mov al, 0x35
mov di, 160 * 17 + 44
stosw

;Draw some bad apples
mov ah, 0xCF
mov al, 0x33
mov di, 160 * 16 + 34
stosw
mov al, 0x37
mov di, 160 * 9 + 100
stosw
mov al, 0x34
mov di, 160 * 20 + 70
stosw

jmp endloop

endloop:
jmp endloop

%include 'slide_frame.h'
%include 'pause.h'

line01 db 0x0E, 'Tron Solitaire'
line02 db 0x27, 'https://github.com/XlogicX/tronsolitare'

titlemessage db 0x0E, 'Tron Solitaire'

counter db 0xE

;BIOS sig and padding
times 510-($-$$) db 0
dw 0xAA55