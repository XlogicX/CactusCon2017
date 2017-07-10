;Library for drawing colored lines in 45 degree angle granularity
;requires %draw_pixel
;Recommended way to call the function:
;pusha								;save your registers if you don't want them mangled
;mov dx, 0000_0_1_1_0_00000111b	 	;nullnibble, down_bit, up_bit, right_bit, left_bit, color byte
;mov ax, 0x50						;vertical pixel coord
;mov bx, 0x50						;horizontal pixel coord
;mov cx, 0x40						;length of line (pixels)
;call draw_line						;draw the line
;popa								;restore your registers if you so choose

draw_line:
line_loop:
        push dx
                shr dx, 11
                add ax, dx
        pop dx
        push dx
                and dx, 0x0700
                shr dx, 10
                sub ax, dx
        pop dx
        push dx
                and dx, 0x0300
                shr dx, 9
                add bx, dx
        pop dx
        push dx
                and dx, 0x0100
                shr dx, 8
                sub bx, dx
        pop dx  
        call draw_pixel
loop line_loop
ret

%include 'drawpixel.h'
