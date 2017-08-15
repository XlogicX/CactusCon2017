%include 'textmode.h'

call draw_border

mov di, 160 * 3 + 8			;where to place cursor
mov si, line01				;fetch the text
mov ah, 0x0E				;color
call slide_line

mov di, 160 * 4 + 8			;where to place cursor
mov si, line02				;fetch the text
call slide_line

mov di, 160 * 5 + 8			;where to place cursor
mov si, line03				;fetch the text
call slide_line

mov di, 160 * 6 + 8			;where to place cursor
mov si, line04				;fetch the text
call slide_line

mov di, 160 * 9 + 8			;where to place cursor
mov si, line05				;fetch the text
call slide_line

mov di, 160 * 10 + 8		;where to place cursor
mov si, line06				;fetch the text
call slide_line

mov di, 160 * 13 + 8		;where to place cursor
mov si, line07				;fetch the text
call slide_line

mov di, 160 * 14 + 12		;where to place cursor
mov si, line08				;fetch the text
call slide_line

mov di, 160 * 2 + 8			;where to place cursor
mov si, line09				;fetch the text
mov ah, 0x07				;color
call slide_line

mov di, 160 * 6 + 34		;where to place cursor
mov si, line0A				;fetch the text
call slide_line

mov di, 160 * 8 + 8			;where to place cursor
mov si, line0B				;fetch the text
call slide_line

mov di, 160 * 12 + 8		;where to place cursor
mov si, line0C				;fetch the text
call slide_line

jmp endloop

endloop:
jmp endloop

%include 'slide_frame.h'
%include 'pause.h'

line01 db 0x09, 'mov ah, 1'
line02 db 0x08, 'int 0x16'
line03 db 0x06, 'pop ax'
line04 db 0x0C, 'jz persisted'
line05 db 0x0A, 'xor ah, ah'
line06 db 0x08, 'int 0x16'
line07 db 0x0A, 'persisted:'
line08 db 0x07, 'push ax'
line09 db 0x13, ';Get keyboard state'
line0A db 0x2D, ';if no keypress, jmp to persisting move state'
line0B db 0x16, ';Clear Keyboard buffer'
line0C db 0x28, ';Otherwise, move in direction last chosen'

titlemessage db 0x11, 'Keyboard Input II'

;BIOS sig and padding
times 510-($-$$) db 0
dw 0xAA55


;    ;Get keyboard state
;    mov ah, 1
;    int 0x16
;    pop ax
;    jz persisted ;if no keypress, jump to persisting move state
    
;    ;Clear Keyboard buffer
;    xor ah, ah
;    int 0x16
    
;    ;Otherwise, move in direction last chosen
;    persisted:
;    push ax