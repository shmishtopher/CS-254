# @author   Christopher K. Schmitt
# @version  1.0.0 - June 24, 2019
#
# Euclid's Elements (300 B.C.) shows that the greatest common divisor of two integers does not
# change if the smaller is subtracted from the larger. Write a program that implements this
# algorithm to find the GCD of two integers. Assume that both integers are positive. Follow this
# algorithm:
# ```
# 1. Call the two integers large and small.
# 2. If large and small are equal: stop: small is the GCD.
# 3. If needed, swap the two integers so that small < large
# 4. Subtract small from large. Call the result large.
# 5. Repeat steps 2 thru 5
# ```
# In your program, prompt the user for two integers large and small. After the GCD has been
# computed, write it out to the monitor.

  .data
large:  .asciiz "Enter larger integer: "
small:  .asciiz "Enter smaller integer: "
result: .asciiz "GCD: "

  .text
  .globl main
main:
  li    $v0, 0x04       # Syscall 0x04 - Print string
  la    $a0, large      # Point to "large"
  syscall

  li    $v0, 0x05       # Syscall 0x05 - Read integer
  syscall

  move  $s0, $v0        # Move $v0 -> $s0

  li    $v0, 0x04       # Syscall 0x04 - Print string
  la    $a0, small      # Point to "small"
  syscall

  li    $v0, 0x05       # Syscall 0x05 - Read integer
  syscall

  move  $s1, $v0        # Move $v0 -> $s1
loop:
  bgt   $s0, $s1, calc  # If large > small, calc
  nop
  move  $t0, $s0        # Move $s0 -> $t0
  move  $s0, $s1        # Move $s1 -> $s0
  move  $s1, $t0        # Move $t0 -> $s1
calc:
  sub   $s0, $s0, $s1   # Subtract small from large
  bne   $s0, $s1, loop  # While large != small, loop
  nop
  li    $v0, 0x04       # Syscall 0x04 - Print string
  la    $a0, result     # Point to "result"
  syscall

  li    $v0, 0x01       # Syscall 0x01 - Print integer
  move  $a0, $s1        # Print smaller integer
  syscall

  li    $v0, 0x0A       # Return control
  syscall