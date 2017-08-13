;slide_line.h - 14 bytes
;This routine will print a line of text on the screen. Before calling this
;routine, you must provide starting coordinates, the address to the actual text
;being printed, and optionally the color scheme (otherwise the most recent
;color will be used). Below is what calling the routine may look like:

;mov di, 160 * 5 + 8		;where to place cursor
;mov si, line01				;fetch the text
;mov ah, 0x0A				;color

;di is the cursor position. Since each line is 160 in length, it is convenient
;to place 160, multiplied by the row amount (5th row), followed by adding how
;many columns into the row you want to start. This is assemble-time math, not
;run-time; so it will not affect performance.

slide_line:
   mov bx, 0                 ;counter
   line:
   mov al, [si + bx + 1]     ;Get current char into memory
   stosw                     ;place into video memory
   inc bl                    ;inc to next char
   cmp bl, [si]        		 ;see if done
   jne line                  ;repeat if not
ret


