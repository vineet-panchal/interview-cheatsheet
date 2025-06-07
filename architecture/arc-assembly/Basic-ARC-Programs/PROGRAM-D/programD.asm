        .begin
        .org 2048           ! start addresses at 2048 from this point
main:   ld [a], %r1         ! main function starts: load a into register 1
        ld [b], %r2         ! load b into register 2
        ld [c], %r3         ! load c into register 3
top:    subcc %r4, 3, %r0   ! top function starts: subtract register 4 with 3 and load it into register 0
        be done             ! branch if zero to the done subroutine
        subcc %r5, %r6, %r0 ! subtract register 5 and register 6, and load it into register 0
        bneg else           ! branch if negative to the else statement
        orcc %r1, %r2, %r1  ! bitwise or on register 1 and register 2, and load it into register 1
        addcc %r6, 1, %r6   ! add register 6 with 1, and load it into register 6
        ba bottom           ! branch unconditionally to the bottom subroutine
else:   andcc %r1, %r3, %r1 ! else function starts: bitwise and on register 1 and register 3, and load it into register 1
        addcc %r5, 1, %r5   ! add register 5 with 1, and load it into register 5
bottom: addcc %r4, 1, %r4   ! bottom function starts: add register 4 with 1, and load it into register 4
        ba top              ! branch unconditionally to the top subroutine
done:   st %r3, [y]         ! store contents of register 3 to the memory location of y
        jmpl %r15+4, %r0    ! jump to the address register 15 + 4, and store the address in register 0
        .org 3000           ! start addresses at 3000 from this point on
a:      0xa0                ! assign 0xa0 to variable a
b:      0x33                ! assign 0x33 to variable b
c:      0x52                ! assign 0x52 to variable c
y:      2                   ! assign 2 to variable y
        .end
