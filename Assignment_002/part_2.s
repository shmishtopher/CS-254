# @author   Christopher K. Schmitt
# @version  1.0.0 - June 10, 2019
#
# Suppose $8 holds value x, evaluate the polynomial:
# ```
# 16x^3 - 3x^2 + 7x + 52
# ```
# by using Horner's Method. This is a way of building up values until the final value is reached.
# Pick a register, say $7, to act as an accumulator. The accumulator will hold the value at each
# step.


  .text
  .globl main

main:
  addiu   $8, $0, 0x01    # x = 1
  
  addiu   $7, $0, 0x10    # 16
  mult    $7, $8          # 16x
  mflo    $7
  
  addiu   $7, $7, -3      # 16x - 3
  mult    $7, $8          # 16x^2 - 3x
  mflo    $7

  addiu   $7, $7, 0x07    # 16x^2 - 3x + 7
  mult    $7, $8          # 16x^3 - 3x^2 + 7x
  mflo    $7

  addiu   $7, $7, 52      # 16x^3 - 3x^2 + 7x + 52