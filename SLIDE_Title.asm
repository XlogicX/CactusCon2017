%include 'textmode.h'

; Make the whole screen purple
xor di, di
mov cx, 0x07d0
mov ah, 0x99
rep stosw

mov si, brick

mov di, 272
call drawsprite

mov di, 1536
call drawsprite
mov di, 1552
call drawsprite
mov di, 1566
call drawsprite

floor:
	mov di, 2720
	add word [floor + 1], 16
	call drawsprite
	cmp word [floor + 1], 2880
	jne floor

mov si, c_cactus
mov di, 0
call drawsprite
mov di, 32
call drawsprite
mov di, 1312
call drawsprite
mov si, a_cactus
mov di, 16
call drawsprite
mov si, t_cactus
mov di, 48
call drawsprite
mov si, u_cactus
mov di, 64
call drawsprite
mov si, s_cactus
mov di, 78
call drawsprite
mov si, o_cactus
mov di, 1328
call drawsprite
mov si, n_cactus
mov di, 1344
call drawsprite

mov si, cactus
mov di, 1446
call drawsprite

jmp end

%include 'drawsprite_8x8_4c.h'

end:
	jmp end

;first 2 bytes is the color scheme (each nibble picks a color)
;imagedata
cactus:
	db 0x49, 0xA0, 0x01, 0x40, 0x05, 0x50, 0x46, 0x91, 0x57, 0xD5, 0x05, 0x50, 0x05, 0x54, 0x05, 0x45, 0x54, 0x01
brick:
	db 0x06, 0x70, 0x15, 0xD4, 0x40, 0xD3, 0x40, 0xCC, 0x40, 0xD7, 0x40, 0xD3, 0xF0, 0xC3, 0x5F, 0x43, 0x33, 0x7C
c_cactus:
	db 0x0E, 0x28, 0x00, 0x00, 0x01, 0x54, 0x05, 0x54, 0x05, 0x00, 0x05, 0x00, 0x09, 0x54, 0x09, 0x54, 0x02, 0xA8	
a_cactus:
	db 0x0E, 0xF8, 0x01, 0x00, 0x05, 0x40, 0x15, 0x50, 0x16, 0x58, 0x15, 0x58, 0x16, 0x58, 0x16, 0x58, 0x0A, 0x28
t_cactus:
	db 0x0E, 0x58, 0x00, 0x00, 0x15, 0x54, 0x09, 0x68, 0x01, 0x60, 0x01, 0x60, 0x01, 0x60, 0x01, 0x60, 0x00, 0xA0	
u_cactus:
	db 0x0E, 0xB8, 0x00, 0x00, 0x05, 0x14, 0x05, 0x14, 0x05, 0x14, 0x05, 0x14, 0x05, 0x14, 0x01, 0x58, 0x00, 0xA0
s_cactus:
	db 0x0E, 0xC8, 0x00, 0x00, 0x01, 0x40, 0x06, 0x90, 0x05, 0xA0, 0x02, 0x40, 0x05, 0x50, 0x01, 0x60, 0x02, 0x80	
o_cactus:
	db 0x0E, 0xD8, 0x00, 0x00, 0x01, 0x50, 0x05, 0x54, 0x05, 0x94, 0x05, 0x14, 0x05, 0x54, 0x09, 0x58, 0x02, 0xA0	
n_cactus:
	db 0x0E, 0x38, 0x00, 0x00, 0x10, 0x10, 0x15, 0x18, 0x15, 0x58, 0x16, 0x58, 0x16, 0x58, 0x26, 0x98, 0x0A, 0x20

;BIOS sig and padding
times 510-($-$$) db 0
dw 0xAA55

