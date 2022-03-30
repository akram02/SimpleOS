print:
    pusha
start:
    mov al, [bx]
    cmp al, 0
    je done

    mov ah, 0x0e
    int 16

    inc bx
    jmp start
done:
    popa
    ret

print_nl:
    pusha

    mov ah, 14
    mov al, 10
    int 16
    mov al, 13

    popa
    ret