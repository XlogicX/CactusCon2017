;Colors
[ORG 0x7c00] ;add to offsets

;Init the environment
;  init data segment
;  init E/video segment and allocate area of mem
;  Set to 0x03/80x25 text mode
;  Hide the cursor
   xor ax, ax     ;make it zero
   mov ds, ax     ;DS=0
 
   mov ah, 0xb8   ;text video memory
   mov es, ax     ;ES=0xB800

   mov al, 0x03   ;Get Cursor position and shape
   int 0x10       ;For some reason it has to be done

   mov ah, 1      ;Set cursor shape
   mov ch, 0x26   ;To hidden
   int 0x10       

;Draw Border
   ;Fill in all black
   mov cx, 0x07d0    ;whole screens worth
   mov ax, 0x0020    ;empty black background
   xor di, di        ;start at first pixel
   rep stosw         ;push it to video memory

   ;colums
      mov bx, 0   ;hex character index, initialize to the first

      init:
      mov di, [startoffset]   ;initialize the start pixel
      mov al, [hexes + bx]    ;current hex character
      mov ah, [color]         ;current color
      stosw                   ;display it

      mov cx, 15              ;for the next 15 characters
      bg:
         add di, 158          ;Go to next row
         add ah, 1            ;cycle to next background color
         stosw                ;display it
         dec cx               ;dec loop counter
         cmp cx, 0            ;is it done?
         jne bg               ;keep going if not

      ;next background
      add word [startoffset], 6  ;Go to the next column (3 columns to the right)
      mov di, [startoffset]      ;set the column in the video buffer
      inc bx                     ;next hex character
      add byte [color], 0x10     ;next foreground color
      cmp bx, 0x10               ;is it the last hex character?
      jne init                   ;keep looping if not

   ;rows
      mov bx, 0                  ;init the hex index
      mov byte [color], 0x00     ;init the colors
      mov byte [startoffset], 4  ;display this character at 2nd column (starting at 0 with 2 byte pixels)

      init2:
      mov di, [startoffset]      ;commit pixel location to video buffer
      mov al, [hexes + bx]       ;load current hex character
      mov ah, [color]            ;load current color
      stosw                      ;draw pixel

      mov cx, 15                 ;for the next 15 characters
      fg:
         add di, 4               ;move 2 pixels to the right (and 1 extra for a total of 3 becuase of stosw instruction)
         add ah, 16              ;next background color
         stosw                   ;draw the pixel
         dec cx                  ;dec the loop counter
         cmp cx, 0               ;is it done?
         jne fg                  ;keep going if not

         ;next foreground
         add word [startoffset], 160   ;Go to the next row
         mov di, [startoffset]         ;commit it to video memory
         inc bx                        ;next hex character
         add byte [color], 0x01        ;next foreground color
         cmp bx, 0x10                  ;is it the last hex character
         jne init2                     ;if not, keep going

   end:                                ;infinite loop to end program
      jmp end

   startoffset:
      dw 0x0002   ;Column 1 (starting at column 0), becuase each pixel is 2 bytes
   color:
      db 0x00     ;black on black
   hexes:         ;hex character set
      db 0x30, 0x31, 0x32, 0x33, 0x34, 0x35, 0x36, 0x37, 0x38, 0x39, 0x41, 0x42, 0x43, 0x44, 0x45, 0x46

   ;BIOS sig and padding
   times 510-($-$$) db 0
   dw 0xAA55
