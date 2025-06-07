            .begin
BASE        .equ 0x3fffc0           ! starting point of the memory mapped region
COUT        .equ 0x0                ! 0xffff0000 console data port
COSTAT      .equ 0x4                ! 0xffff0004 console status port
            .org 2048               ! start addresses from this point at 2048
            addcc %r0, %r0, %r2     ! (%r0 + %r0) -> %r2
            addcc %r0, %r0, %r4     ! (%r0 + %r0) -> %r4
            sethi BASE, %r4         ! set high 22 bits for BASE -> %r4
Loop:       ld [%r2 + String], %r3  ! load from address %r2 + String -> %r3
            addcc %r3, %r0, %r3     ! (%r3 + %r0) -> %r3
            be End                  ! branch if zero to End subroutine
Wait:       ld [%r4+COSTAT], %r1    ! load from address %r4 + COSTAT -> %r1
            andcc %r1, 0x80, %r1    ! bitwise AND (%r1 && 0x80) -> %r1
            be Wait                 ! branch if zero to Wait subroutine
            st %r3, [%r4 + COUT]    ! store %r3 to address %r4 + COUT
            addcc %r2, 4, %r2       ! (%r2 + 4) -> %r2
            ba Loop                 ! branch unconditionally to Loop subroutine
End:        halt                    ! non-standard instruction to end the simulator
            .org 3000               ! start addresses from this point at 3000
String: 0x48, 0x65, 0x6c, 0x6c, 0x6f, 0x2c, 0x20, 0x77, 0x6f, 0x72, 0x6c, 0x64, 0x21, 0x0a, 0 ! the "Hello World" string
            .end
