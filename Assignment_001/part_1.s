# Write a program to calculate using this boolean formula: 
# `(A and (not B)) or (not (B xor C))`
#
# A, B and C are the bit strings in $5, $6 and $7. Put the final result bit string in register $8.
# The initial three instructions are given:
#
# ```
# ori $5, $0, 0x9
# ori $6, $0, 0x5
# ori $7, $0, 0x8
# ```


  .text
  .globl main

main:
  ori   $5, $0, 0x09
  ori   $6, $0, 0x05
  ori   $7, $0, 0x08

  