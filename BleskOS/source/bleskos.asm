;BleskOS

org 0x10000

bits 32

start:
 jmp start_bleskos

 %include "source/macros.asm"

 %include "source/drivers/graphic_vesa.asm"
 %include "source/drivers/graphic_font.asm"

 %include "source/drivers/system_interrupts.asm"
 %include "source/drivers/system_wait.asm"

 %include "source/drivers/hardware_ps2_keyboard.asm"

 %include "source/gui/main.asm"
 %include "source/gui/developer_zone.asm"

 %include "source/programs/dp_hardware_info.asm"

start_bleskos:
 call init_graphic
 CLEAR_SCREEN 0x0600
 call redraw_screen

 PSTR 'Enabling interrupts...', bootstr_interrupts
 call init_idt
 PSTR 'Scanning PCI...', bootstr_pci
 call init_keyboard

 call main_window

 HALT
