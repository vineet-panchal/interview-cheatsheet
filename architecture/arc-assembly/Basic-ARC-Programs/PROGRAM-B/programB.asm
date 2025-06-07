          .begin
          .org 2048           ! start addresses at 2048
m_start:  ld [x], %r1         ! load x into register one
          ld [y], %r2         ! load y into register two
          subcc %r1, %r2, %r0 ! subtract register one and two, and load it into register zero
          bneg else           ! branch if the condition is negative and jump to the else statement
          andcc %r1, %r2, %r3 ! and register one and two, and load it into register three
          ba done             ! branch unconditionally to the done statement
else:     orcc %r1, %r2, %r3  ! or register one and two, and load it into register three
done:     st %r3, [a]         ! store contents of register three to a
          jmpl %r15+4, %r0    ! jump to the address of register 15 + 4 bits
x:        30                  ! assign 30 to variable x
y:        48                  ! assign 48 to variable y
a:        0                   ! assign 0 to variable a
          .end
