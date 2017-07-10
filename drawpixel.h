draw_pixel:
	mov di, 320
	imul di, ax
	add di, bx
	mov [es:di], dl
	ret
