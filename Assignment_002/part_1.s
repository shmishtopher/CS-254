# @author   Christopher K. Schmitt
# @version  1.0.0 - June 10, 2019
#
# Suppose register $8 holds value x and register $9 holds value y, write a program
# that evaluates the rational function:
# ```
# (3xy + 7y)/(2x^2 - y)
# ```
# Leave the quotient in register $10 and remainder in register $11.
# The initial two instruction for initializing x and y are given:
# ```
# addiu   $8, $0, 32
# addiu   $9, $0, -45
# ```
# To do the computation, do not use 32 or -45 in any of the following instructions. Use $8 if you
# need x and use $9 if you need y so the instructions you write can be applied to any x or y. The
# multiplications and division should be two's complement multiplication and division.


  .text
  .globl main

main:
  addiu   $8, $0, 32    # x
  addiu   $9, $0, -45   # y

  addiu   $31, $0, 0x03   # 3
  mult	  $31, $8         # 3 * x
  mflo	  $31
  mult    $31, $9         # 3 * x * y
  mflo    $31

  addiu   $30, $0, 0x07   # 7
  mult    $30, $9         # 7 * y
  mflo    $30

  addu    $31, $31, $30   # 3xy + 7y

  mult    $8, $8          # x * x
  mflo    $30
  sll     $30, $30, 0x02  # 2x^2

  sub		  $30, $30, $9    # 2x^2 - y

  div     $31, $30        # (3xy + 7y)/(2x^2 - y)
  mflo    $10
  mfhi    $11