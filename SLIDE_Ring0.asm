%include 'textmode.h'

call draw_border

mov di, 160 * 2 + 8			;where to place cursor
mov si, line01				;fetch the text
mov ah, 0x0A				;color
call slide_line

mov di, 160 * 4 + 8		;where to place cursor
mov si, line02				;fetch the text
call slide_line

mov di, 160 * 6 + 8		;where to place cursor
mov si, line03				;fetch the text
call slide_line

mov di, 160 * 8 + 8		;where to place cursor
mov si, line04				;fetch the text
call slide_line

mov di, 160 * 10 + 8		;where to place cursor
mov si, line05				;fetch the text
call slide_line

mov di, 160 * 14 + 8		;where to place cursor
mov si, line06				;fetch the text
call slide_line
mov di, 160 * 16 + 16		;where to place cursor
mov si, line07				;fetch the text
call slide_line

jmp endloop

endloop:
jmp endloop

%include 'slide_frame.h'
%include 'pause.h'

line01 db 0x09, 0x07, 'HLT-Halt'
line02 db 0x20, 0x07, 'INVD-Invalidate Internal Caches'
line03 db 0x25, 0x07, 'LLDT-Load Local Descriptor Table Reg'
line04 db 0x1F, 0x07, 'MONITOR-Set Up Monitor Address'
line05 db 0x22, 0x07, 'WRMSR-Write to Model Specific Reg'
line06 db 0x45, 'Others: INVLPG,INVPCID,LGDT/LIDT,LTR,MWAIT,RDMSR,RDPMC,WBINVD,XSETBV,'
line07 db 0x3E, 'INVEPT,INVVPID,VMCLEAR,VMRESUME,VMPTRLD,VMPTRST,VMREAD,VMWRITE'

titlemessage db 0x13, 'Ring-0 Instructions'

;BIOS sig and padding
times 510-($-$$) db 0
dw 0xAA55