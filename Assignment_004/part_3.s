# @author   Christopher K. Schmitt
# @version  1.0.0 - June 19, 2019
#
# Declare an array of integers, something like:
# ```
#   .data
# size: .word 8
# array: .word 23, -12, 45, -32, 52, -72, 8, 13
# ```
# Write a program that computes the sum of all the odd integers in the array.
# Put the sum in register $10

  .data
size:   .word 8
array:  .word 23, -12, 45, -32, 52, -72, 8, 13

  .text
  .globl main
main:
  lw    $t0, size         # Array size
  la    $t1, array        # Array base
  li    $t2, 0x00         # Counter
  li    $t3, 0x00         # Sum
loop:
  lw    $t4, 0x00($t1)    # Load cell
  add   $t1, $t1, 0x04    # Increment array base
  add   $t2, $t2, 0x01    # Increment counter
  and   $t5, $t4, 0x01    # Bitmask $t4 with 0x01
  beq   $t5, 0x00, loop   # If $t4 is even, loop
  nop
  add   $t3, $t3, $t4     # Add $t4 to Sum
  blt   $t2, $t0, loop    # While Counter < Array size, loop
  nop
  move  $10, $t3          # Move Sum -> $10
  li    $v0, 0x0A         # Return control
  syscall