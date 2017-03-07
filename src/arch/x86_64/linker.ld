ENTRY(start)

SECTIONS {
  . = 1M;

  .boot :
  {
    /*multiboot_header must be at the beginning*/
    *(.multiboot_header)
  }

  .text :
  {
    *(.text)
  }
}
