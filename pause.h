;Pause.h - 13 bytes
;This is a routine that pauses execution until a key is pressed. It clears the
;keyboard buffer when done. As the AX register is likely used before this is
;used, it is kept on the stack for safekeeping until done.

wait_loop:
   push ax					;Keep this register in stack for safekeeping
   stay:
   mov ah, 1
   int 0x16					;Get keyboard state
   jz stay  				;if no keypress, jump to persisting move state

   xor ah, ah
   int 0x16   				;Clear Keyboard buffer
   pop ax					;Get our original AX value back
ret
