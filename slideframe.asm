;Border Drawer

%include 'textmode.h'


;Draw Border
   ;Part of top border before title
   mov cx, 78              ;init cx to 78, screen lenth minus some graphic chars
   sub cl, [titlemessage]  ;subtract title length
   shr cx, 1               ;divide by 2
   mov ax, 0x2fcd          ;green background with ═ character
   xor di, di              ;init coordinate
   rep stosw               ;push it to video memory
   mov al, 0xb9            ;╣ character
   stosw                   ;push the above char to video memory

   ;The title
   mov bx, 0               ;counter
   ;Print Title
   title:
   mov al, [titlemessage + bx + 1]   ;Get current char into memory
   stosw                         ;place into video memory
   inc bl                        ;inc to next char
   cmp bl, [titlemessage]        ;see if done
   jne title                     ;repeat if not
   mov al, 0xcc                  ;finish with ╠ character
   stosw                         ;put it in video memory

   mov cx, 78              ;init cx to 78, screen lenth minus some graphic chars
   sub cl, [titlemessage]  ;subtract title length
   shr cx, 1               ;divide by 2
   mov al, 0xcd          ;green background with ═ character
   rep stosw               ;push it to video memory 

   ;Upper Right Corner
   mov al, 0xb8            ;╕ symbol
   stosw

   ;The Sides with the | symbol
   mov cl, 23     ;23 rows worth
   sides:
   mov al, 0xb3   ;the | symbol
   stosw          ;display it
   add di, 156    ;move all the way to the right side
   stosw          ;display it again
   dec cl         ;next row
   jne sides      ;go again if not to the end


   ;Bottom row
   mov al, 0xd4            ;Bottom Left Corner
   stosw                   ;Display it
   mov cx, 78              ;init cx to 80, bottom row length
   mov al, 0xcd            ;green background with ═ character
   rep stosw               ;push it to video memory
   mov al, 0xbe            ;Bottom Right Corner
   stosw                   ;push the above char to video memory
   xor di, di              ;Re init video coords
   mov al, 0xd5            ;Upper Left Corner
   stosw                   ;push the above char to video memory     

   mov cx, 142              ;init cx to 78, screen lenth minus some graphic chars
   sub cl, [titlemessage]  ;subtract title length
   shr cl, 1               ;divide by 2
   add cl, 160
   mov di, cx
   mov al, 0xb0
   mov cl, [titlemessage]
   add cl, 2
   rep stosw

gameover: 
   jmp gameover

   
   titlemessage: 
   ;String where first byte determins how many bytes rest of string is
   db 0x0d, 0x20
   dq 0x214e495720554f59   ;YOU WIN!
   db 0x21, 0x21, 0x20, 0x02

   ;BIOS sig and padding
   times 510-($-$$) db 0
   dw 0xAA55

   ; Pad to floppy disk.
   ;times (1440 * 1024) - ($ - $$)  db 0
