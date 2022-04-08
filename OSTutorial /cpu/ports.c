#include "ports.h"

/**
 * Read a byte from the specified port
 */
uint8_t port_byte_in (uint16_t port) {
    uint8_t ret;
       asm volatile("inb %1, %0" : "=a" (ret) : "dN" (port));
       return ret;
}

void port_byte_out (uint16_t port, uint8_t data) {
    asm volatile ("outb %1, %0" : : "dN" (port), "a" (data));
}