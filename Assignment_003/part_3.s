# @author   Christopher K. Schmitt
# @version  1.0.0 - June 17, 2019
#
# There are two two's complement integers in the data section with symbolic 
# addresses x and y. Compare the two integers and, if x >= y, store x - y in 
# the location with symbolic address "answer", otherwise store y - 2x at
# "answer".

  .data
x: .word 3
y: .word -2
answer: .word 0

  .text
  .globl main
main:
  lui   $31, 0x1000
  lw    $30, 0x00($31)  # x
  lw    $29, 0x04($31)  # y
  sll   $0, $0, 0x00

  slt   $28, $30, $29
  bne   $28, $0, branch
  j     end
  sub		$28, $30, $29

branch:
  sll   $30, $30, 0x01
  sub   $28, $29, $30

end:
  sw    $28, 0x08($31)