;Nessesary code to get bare minimum for video textmode, data segment, and stack
;Machine Code Ammount: 28 bytes
;Machine Code Ammount to CALL once: N/A

[ORG 0x7c00]      ;add to offsets

;Init the environment
;  init data segment
;  init stack segment allocate area of mem
;  init E/video segment and allocate area of mem
;  Set to 0x03/80x25 text mode
;  Hide the cursor
   xor ax, ax     ;make it zero
   mov ds, ax     ;DS=0

   mov ss, ax     ;stack starts at 0
   mov sp, 0x9c00 ;200h past code start
 
   mov ax, 0xb800 ;text video memory
   mov es, ax     ;ES=0xB800

   mov al, 0x03
   xor ah, ah
   int 0x10

   mov al, 0x03   ;Some BIOS crash without this.                 
   mov ch, 0x26
   inc ah
   int 0x10    
