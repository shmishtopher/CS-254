# @author   Christopher K. Schmitt
# @version  1.0.0 - June 17, 2019
#
# Evaluate the following polynomial using Horner's method that was introduced in
# the previous homework:
# ```
# ax^3 + bx^2 + cx + d
# ```
# Now the values for the coefficients a, b, c, d as well as for x come from the .data section of
# memory:
# ```
# .data
# x: .word 1
# a: .word -6
# b: .word 9
# c: .word -20
# d: .word 18
# poly: .word 0
# ```
# Load a base register with the address of the first byte of the .data section. Calculate (by hand)
# the displacement needed for each of the values in memory and use it with a lw instruction to
# get values from memory. You also should store the result of the evaluation at symbolic address
# poly.

  .data
x: .word 1
a: .word -6
b: .word 9
c: .word -20
d: .word 18
poly: .word 0

  .text
  .globl main
main:
  lui   $31, 0x1000     # Set base address
  lw		$30, 0x00($31)  # x
  
  lw    $29, 0x04($31)  # a
  sll   $0, $0, 0x00
  mult	$29, $30        # ax
  mflo	$28
  
  lw    $29, 0x08($31)  # b
  sll   $0, $0, 0x00
  add   $28, $28, $29   # ax + b
  mult  $28, $30        # ax^2 + bx
  mflo  $28

  lw    $29, 0x0C($31)  # c
  sll   $0, $0, 0x00
  add   $28, $28, $29   # ax^2 + bx + c
  mult  $28, $30        # ax^3 + bx^2 + cx

  lw    $29, 0x10($31)  # d
  sll   $0, $0, 0x00
  add   $28, $28, $29   # ax^3 + bx^2 + cx + d

  sw    $28, 0x14($31)  # Store 