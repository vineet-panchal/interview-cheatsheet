      .begin 
      .org 2048           ! start addresses at 2048
      dstart .equ 4000    ! equates dstart to 4000
      ld [a], %r1         ! load a into register 1
      ld [b], %r2         ! load b into register 2
      ld [c], %r3         ! load c into register 3
      addcc %r2, %r3, %r0 ! add register 2 and register 3 (b + c), and load it into register 0
      addcc %r1, %r0, %r4 ! add register 1 and register 0 (a + (b + c)), and load it into register 4
      subcc %r2, %r4, %r2 ! subtract register 2 and register 4 (b + (a + (b + c)), and load it into register 2
      st %r0, [a]         ! store contents of register 0 to memory location of a
      st %r2, [y]         ! store contents of register 2 to memory location of y
      jmpl %r15 + 4, %r0  ! jump to the address of register 15 + 4
      .org dstart         ! sets the addresses after this point to dstart (3000)
a:    15                  ! assign 15 to variable a
b:    54                  ! assign 52 to variable b
c:    -29                 ! assign -29 to variable c
y:    0                   ! assign 0 to variable y
      .end 
