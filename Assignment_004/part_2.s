# @author   Christopher K. Schmitt
# @version  1.0.0 - June 19, 2019
#
# Declare a null-terminated string in the data section:
# ```
#   .data
# string: .asciiz "ABCDEFG"
# ```
# Write a program that converts the string to all lower case characters. Do this by adding 0x20
# to each character in the string. (See the ASCII chart to figure out why this works.)
# Assume that the data consists only of uppercase alphabetical characters, with no spaces or
# punctuation.

  .data
string: .asciiz "ABCDEFG"

  .text
  .globl main
main:
  la    $t0, string           # Base register
loop:
  lb    $t1, 0x00($t0)        # Load character
  add   $t0, $t0, 0x01        # Increment base register
  add   $t1, $t1, 0x20        # Add 0x20 to character
  bne   $t1, 0x20, loop       # While character != NULL, loop
  sb    $t1, -0x01($t0)       # Store character
  sb    $0, -0x01($t0)        # Replace NULL byte
  li    $v0, 0x0A             # Return control
  syscall