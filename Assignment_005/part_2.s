# @author   Christopher K. Schmitt
# @version  1.0.0 - June 24, 2019
#
# Write a subroutine that takes two arguments, X and Y (they are in $a0 and $a1). It then
# computes X * X * Y and returns it. Use the subroutine to evaluate the following 
# expression for various values of u and v:
# ```
# (u^2)v + (v^2)u
# ```
# The main method, prompts the user for values of u and v and prints out the result.

  .data
prompt_u: .asciiz "Enter u: "
prompt_v: .asciiz "Enter v: "
result:   .asciiz "(u^2)v + (v^2)u = "

  .text
  .globl calc
calc:
  mult  $a0, $a0    # Compute X * X
  mflo  $v0
  mult  $v0, $a1    # Compute X * X * Y
  mflo  $v0
  jr		$ra         # Return control
  nop

  .text
  .globl main
main:
  li    $v0, 0x04       # Syscall 0x04 - Print string
  la    $a0, prompt_u   # Point to "prompt_u"
  syscall

  li    $v0, 0x05       # Syscall 0x05 - Read integer
  syscall

  move  $s0, $v0        # Move $v0 -> $s0

  li    $v0, 0x04       # Syscall 0x04 - Print string
  la    $a0, prompt_v   # Point to "prompt_v"
  syscall

  li    $v0, 0x05       # Syscall 0x05 - Read integer
  syscall

  move  $s1, $v0        # Move $v0 -> $s1

  move  $a0, $s0        # Move U -> $a0
  move  $a1, $s1        # Move V -> $a1
  jal   calc            # Compute (u^2)v
  nop

  move  $t0, $v0        # Move $v0 -> $t0

  move  $a0, $s1        # Move V -> $a0
  move  $a1, $s0        # Move U -> $a1
  jal   calc            # Compute (v^2)u
  nop

  move  $t1, $v0        # Move $v0 -> $t0

  add   $t0, $t0, $t1   # Compute (u^2)v + (v^2)u

  li    $v0, 0x04       # Syscall 0x04 - Print string
  la    $a0, result     # Point to "result"
  syscall

  li    $v0, 0x01       # Syscall 0x01 - Print integer
  move  $a0, $t0        # Move $t0 -> $a0
  syscall

  li    $v0, 0x0A       # Return control
  syscall