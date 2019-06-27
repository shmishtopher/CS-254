# @author   Christopher K. Schmitt
# @version  1.0.0 - June 27, 2019
#
# Write a program that computes `(A+B)*3.7` for values A and B defined in the data
# section. The program should then print out the computed value and exit. Here is a sample of
# your data section:
# ```
#   .data
# A: .float -2.34
# B: .float 6.03
# ```

  .data
A:  .float  -2.34
B:  .float  6.03

  .text
  .globl main
main:
  l.s   $f0, A            # Load "A" into $f0
  l.s   $f1, B            # Load "B" into $f1
  li.s  $f3, 3.7          # Load "3.7" into $f3
  
  add.s $f12, $f0, $f1    # Compute A + B
  mul.s $f12, $f12, $f3   # Compute (A + B) * 3.7
  
  li    $v0, 0x02         # Syscall 0x02 - Print float
  syscall
  
  li    $v0, 0x0A         # Syscall 0x0A - Return control
  syscall