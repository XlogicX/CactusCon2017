;Draws an 8x8 4-color sprite
;The datastructure is 2 bytes for colors (each nibble is a color)
;	then pixel data, each byte contains 4 pixels, 2-bits per 4 color pixel

drawsprite:
	add bl, 2
	draw_loop:
		mov byte[pixel_counter], 0			; Init first pixel
		call colors							; Print a pixel

		pixels:
			shr byte [polyand + 2], 2		; Shift our bitmask
			add byte [polyrol + 2], 2		; Increase the bit rotate
			call colors						; Do another pixel
			inc byte [pixel_counter]		; increase pixel counter
			cmp byte [pixel_counter], 3		; see if we have done 4 pixels alread
		jne pixels							; if not, do next pixel

		mov byte [polyand + 2], 0xC0		; Reset the AND Mask
		mov byte [polyrol + 2], 0			; Reset the rotate mask

		inc bl								; Increment data counter

		cmp bl, byte 0x12				; See if we are done with data
		je return							; If so finish

		mov al, 0x02
		inc byte [screen_counter]			; increment line counter
		cmp byte [screen_counter], al		; if at end of line
		je nextline							; do some math for the next line

		end_draw_loop:
		jmp draw_loop	

	nextline:
		mov byte [screen_counter], 0
		add di, 144
	jmp end_draw_loop						

	colors:
		;This routine gets the byte, masks each color and requests to display it
		mov al, 0x20			; Space Char
		mov dl, [si + bx]	; Get the byte (just wants bl, could be cause of future bugs)
		polyand:				
		and dl, 0xC0			; AND mask our color byte for 1st color
		polyrol:
		rol dl, 0				; Rotate over our next color (starts at 0)
		cmp dl, 0x00			; compare with color mask
		je color2				; Gos to color 2
		cmp dl, 0x40
		je color3				; color 3
		cmp dl, 0x80
		je color4				; color 4

	color1:						; otherwise color 1 (like an else)
		mov ah, [si]		; Get the Color
		stosw					; Display the pixel
		ret						; We are done
	color2:						; repeat
		mov ah, [si]
		shl ah, 4
		stosw
		ret
	color3:
		mov ah, [si + 1]
		stosw
		ret
	color4:
		mov ah, [si + 1]
		shl ah, 4
		stosw
		ret

	return:
		mov byte [screen_counter], 0
		mov byte [pixel_counter], 0
		xor bx, bx
		ret

screen_counter:
	db 0x00
pixel_counter:
	db 0x00
