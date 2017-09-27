wait:
   ;Get keyboard state
   inputloop:
   mov ah, 1
   int 0x16
   jz inputloop   ;if no keypress, jump to persisting move state
ret