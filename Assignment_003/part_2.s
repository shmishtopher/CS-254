# @author   Christopher K. Schmitt
# @version  1.0.0 - June 17, 2019
#
# There is one two's complement integer in the data section with symbolic addresses
# x. If x >= 0, replace x with x^2, otherwise replace x with -4x. A sample of the 
# data section in your program is shown as below.
# ```
#   .data
# x: .word 3
# ```

  .data
x: .word 3

  .text
  .globl main
main:
  lui   $31, 0x1000
  lw		$30, 0x00($31)  # x
  sll   $0, $0, 0x00

  slt   $29, $30, $0
  bne		$29, $0, mod    # Jump iff x < 0
  
  # x >= 0
  mult	$30, $30
  j     end
  mflo	$30

mod:  # x < 0
  addi  $29, $0, -4
  mult  $29, $30
  mflo  $30

end:
  sw    $30, 0x00($31)