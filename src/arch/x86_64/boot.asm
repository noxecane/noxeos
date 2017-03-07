global start


; our stack for function return addresses
section .bss
stack_bottom:
  resb 64
stack_top:


section .text
bits 32

; Prints 'ERR: $(al)'.
error:
  mov dword [0xb8000], 0x4f524f45
  mov dword [0xb8004], 0x4f3a4f52
  mov dword [0xb8008], 0x4f204f20
  mov byte  [0xb800a], al
  hlt

start:
  ; hi
  mov esp, stack_top
  mov dword [0xb8000], 0x2f4b2f4f
  hlt

; making sure multiboot is supported
check_multiboot:
  cmp eax, 0x36d76289 ; compare eax to magic multiboot number and set flags register
  jne .no_multiboot   ; jump to multiboot error message if no flag is set
  ret                 ; return otherwise

.no_multiboot:
  mov al, "0" ; write 0 to al
  jmp error   ; call error code(no need to call since error has no "ret")
