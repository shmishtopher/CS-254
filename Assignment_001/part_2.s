# @author   Christopher K. Schmitt
# @version  1.0.0 - June 6, 2019
#
# Start out a program with the instruction that puts a single one-bit into register $1:
# ori $1, $0, 0x01
# Now by using only shift and register-to-register OR instructions, put the pattern 0xFFFFFFFF
# into register $1. DO NOT use any other ori instructions after the first one. DO NOT use
# any nor or not instructions. You can use as many registers as you want.


  .text
  .globl main

main:
  ori   $1, $0, 0x01

  sll   $2, $1, 0x01
  or    $1, $1, $2

  sll   $2, $1, 0x02
  or    $1, $1, $2

  sll   $2, $1, 0x04
  or    $1, $1, $2

  sll   $2, $1, 0x08
  or    $1, $1, $2

  sll   $2, $1, 0x10
  or    $1, $1, $2