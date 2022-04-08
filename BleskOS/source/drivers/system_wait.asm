;BleskOS

ticks dd 0

timer_irq:
 push eax
 push edx
 inc dword [ticks]
 EOI_MASTER_PIC
 pop edx
 pop eax
 iret

wait_pit:
 mov dword [ticks], 0
 .wait:
  hlt
  cmp dword [ticks], eax
  je .done
 jmp .wait

 .done:
 ret
