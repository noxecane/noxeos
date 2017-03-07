section .multiboot_header
header_start:
  dd 0xe85250d6                                                  ; magic number (using multiboot 2)
  dd 0                                                           ; architecture we support (protected mode i386)
  dd header_end - header_start                                   ; header length
  dd 0x100000000 - (0xe85250d6 + 0 + (header_end - header_start)) ; subtracting 2^32 from checksum to make compiler happy

  ;; end tag
  dw 0 ; type
  dw 0 ; flags
  dd 8 ; size
header_end:
