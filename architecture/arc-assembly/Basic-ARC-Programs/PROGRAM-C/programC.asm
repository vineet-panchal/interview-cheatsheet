      .begin
      .org 2048         ! start addresses at 2048
main: ld [x], %r2       ! load x into register two
top:  subcc %r1, 4, %r0 ! subtract register one and 4, and load it into register zero
      be done           ! branch if condition is zero, to the done statement
      srl %r2, 1, %r2   ! shift right register two by 1 bit, and load it into register two
      addcc %r1, 1, %r1 ! add register one and 1, and load it into register one
      ba top            ! branch unconditionally to the top statement
done: st %r3, [y]       ! store contents of register three to y
      jmpl %r15+4, %r0  ! jump register 15 + 4 bytes
      .org 3000         ! set the addresses after this point to 3000
x:    800               ! assign 800 to variable x
y:    0                 ! assign 0 to variable y
      .end
