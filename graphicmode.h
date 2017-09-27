;SETUP STACK
xor ax, ax
mov ss, ax
mov sp, 0x9C00  ;data can go directly to stack pointer, instead of to ax first

;ES SEGMENT POINT TO VIDEO MEM
mov ah, 0xA0    ;ax needs to be 0xa000, but al is already 0x00 from mov ax, 0x9000
mov es, ax

;SET VIDEO MODE 0x13 GRAPHCIS MODE
mov ax, 0x0013  ;moving data into ah and al
int 0x10

;HIDE TEXT CURSOR
mov ah, 1
mov cx, 0x2000  ;moving data into ch and cl
int 0x10