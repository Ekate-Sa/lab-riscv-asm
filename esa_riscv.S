.data
N:
.word 4
M:
.word 4
matrix:
.word 1, 0, 0, 2
.word 0, 1, 0, 1
.word 0, 0, 1, 0
.word 2, 0, 0, 1
result:
.word 0

.text

main:
la a2, N # load address
la a3, M
la a4, matrix
la a5, result
call process
la a2, M
la a3, result
call print
call exit

# --------------------------------
# PRINT


print:
lw t1, 0(a2)

addi t2, x0, 0
print_cycle:
addi a0, x0, 1 # print_int ecall
lw a1, 0(a3)
ecall

addi a0, x0, 11 # print_char ecall
addi a1, x0, 32
ecall
ret

#------------------
# EXIT

exit:
addi a0, x0, 10
ecall

# ------------------------------------
# PROCESS
# ------------------------------------
process:
lw t1, 0(a2) # N	# t1 = N - const
#lw t2, 0(a3) # M	# t2 = M

addi t2, t1, 1 # t2 = N+1
slli t2, t2, 2 # t2 = 4*(t2) // used as shift
#
addi t3, x0, 0 # i=0
#
addi t4, t1,-1 # t4 = N-1
slli t4, t4, 2 # t4 = 4*(t2) // used as shift
add a6, a4, t4 # init a6

init:
addi t5, x0, 0 # result to save		# res = t5 = 0

cycle:
lw t6, 0(a4) # load value from array		# t6 = matrix[i]
add a4, a4, t2 # goto next diag elem
add t5, t5, t6 # count sum					# res += matrix[i]
#
lw t6, 0(a6) # sub-diag elem				# t6 = matrix[i][n-1-i]
add a6, a6, t4 # goto next diag elem
add t5, t5, t6 # count sum					# res += matrix[i]
addi t3, t3, 1 # i++
sw t5, 0(a5) # save result to resulting array
blt t3, t1, cycle

ret