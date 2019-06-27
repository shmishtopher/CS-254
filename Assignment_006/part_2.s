# @author   Christopher K. Schmitt
# @version  1.0.0 - June 27, 2019
#
# Write a program that prompts the user for two floating point numbers x and y,
# computes `(x-y)/2.0`, and then prints out the computed value and exits. Here is a sample of
# your data section:
# ```
#   .data
# promptX: .asciiz "Please enter x: "
# promptY: .asciiz "Please enter y: "
# output: .asciiz "The result is: "
# ```

  .data
prompt_x: .asciiz "Please enter X: "
prompt_y: .asciiz "Please enter Y: "
output:   .asciiz "The result is: "

  .text
  .globl main
main:
  li    $v0, 0x04       # Syscall 0x04 - Print string
  la    $a0, prompt_x   # Point to "prompt_x"
  syscall

  li    $v0, 0x06       # Syscall 0x06 - Read float
  syscall

  mov.s $f1, $f0        # Move $f0 -> $f1

  li    $v0, 0x04       # Syscall 0x04 - Print string
  la    $a0, prompt_y   # Point to "prompt_y"
  syscall

  li    $v0, 0x06       # Syscall 0x06 - Read float
  syscall

  li.s  $f2, 2.0        # Load "2.0" into $f2
  sub.s $f0, $f1, $f0   # Compute X - Y
  div.s $f12, $f0, $f2  # Compute (X - Y) /  2.0

  li    $v0, 0x02       # Syscall 0x02 - Print float
  syscall

  li    $v0, 0x0A       # Syscall 0x0A - Return control
  syscall