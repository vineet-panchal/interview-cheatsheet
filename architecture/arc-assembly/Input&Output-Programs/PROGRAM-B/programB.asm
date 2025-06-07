          .begin
BASE      .equ 0x3fffc0           ! starting point of the memory mapped region
COUT      .equ 0x0                ! 0xffff0000 console data port
COSTAT    .equ 0x4                ! 0xffff0004 console status port
CIN       .equ 0x8                ! 0xffff0008 keyboard data port
CICTL     .equ 0xc                ! 0xffff000c keyboard content port
          .org 2048               ! start addresses from this point at 2048
          addcc %r0, %r0, %r4     ! (%r0 + %r0) -> %r4
          sethi BASE, %r4         ! set high 22 bits of BASE -> %r4
InWait:   halt                    ! the starting point of the main loop that waits for input
          ld [%r4 + CICTL], %r1   ! load from memory location [%r4 + CICIL] -> %r1
          andcc %r1, 0x80, %r1    ! bitwise AND (%r1 && 0x80) -> %r1
          be InWait               ! branch if zero to the InWait subroutine
          ld [%r4 + CIN], %r3     ! load from memory location [%r4 + CIN] -> %r3
          subcc %r3, 27, %r5      ! (%r3 - 27) -> %r5
          be End                  ! branch if zero to the End subroutine
Wait:     ld [%r4 + COSTAT], %r1  ! load from memory location [%r4 + COSTAT] -> %r1
          andcc %r1, 0x80, %r1    ! (%r1 && 0x80) -> %r1
          be Wait                 ! branch if zero to the Wait subroutine
          st %r3, [%r4 + COUT]    ! store %r3 to memory location [%r4 + COUT]
          ba InWait               ! branch unconditionally to the InWait subroutine
End:      halt                    ! non-standard instruction to end the assembler
          .end
