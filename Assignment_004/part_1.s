# @author   Christopher K. Schmitt
# @version  1.0.0 - June 19, 2019
#
# Write a program that computes the sum:
# ```
# 1^3 + 2^3 + 3^3 + 4^3 + 5^3 + ... + 98^3 + 99^3 + 100^3
# ```
# Do this as above, by using branch instruction and jump instruction to implement a counting
# loop. Put the sum in register $10.

  .text
  .globl main
main:
  li		$t0, 0x01         # Counter
  li    $t1, 0x00         # Exponentiation
  li    $t2, 0x00         # Sum
loop:
  mult  $t0, $t0          # Compute n^2
  mflo  $t1
  mult  $t0, $t1          # Compute n^3
  mflo  $t1
  add   $t2, $t2, $t1     # Compute partial sum
  bne   $t0, 0x64, loop   # While Counter != 100, loop
  addi  $t0, $t0, 0x01    # Increment Counter
end:
  move  $10, $t2          # Move Sum -> $10
  li    $v0, 0x0A         # Return control
  syscall
  