;BleskOS

;This macros make other code more readable

%define MEMORY_RAM_SCREEN 0x00100000

%macro INB 1
 %if %1!=dx
 mov dx, %1
 %endif
 in al, dx
%endmacro

%macro OUTB 2
 %if %1!=dx
 mov dx, %1
 %endif
 %if %2!=al
 mov al, %2
 %endif
 out dx, al
%endmacro

%macro HALT 0
 .halt:
  hlt
 jmp .halt
%endmacro

%macro FOR 2
 mov ecx, %1
 .%2:
 push ecx
%endmacro

%macro ENDFOR 1
 pop ecx
 dec ecx
 cmp ecx, 0
 je .for_end_%1
 jmp .%1 ;long jump for any lenght of for code
 .for_end_%1:
%endmacro

%macro IF_E 3
 cmp %1, %2
 jne .%3
%endmacro

%macro IF_H 3
 cmp %1, %2
 jl .%3
 je .%3
%endmacro

%macro ENDIF 1
 .%1:
%endmacro

%macro MOV_0xF_SHIFT 3
 mov %1, %2
 shr %1, %3
 and %1, 0xF
%endmacro