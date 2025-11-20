.data
msgA: .asciiz "Digite a TENSÃO (A): "
msgB: .asciiz "Digite a CORRENTE (B): "
msgC: .asciiz "Digite o TEMPO de uso (C): "
msgD: .asciiz "Digite o FATOR de eficiencia (D): "

msgLidas: .asciiz "\n== Medições Lidas ==\n"
msgCalc:  .asciiz "\n== Medições Calculadas ==\n"

txtA: .asciiz "Tensao (A) = "
txtB: .asciiz "Corrente (B) = "
txtC: .asciiz "Tempo de uso (C) = "
txtD: .asciiz "Fator de eficiencia (D) = "

txtP: .asciiz "Potencia = "
txtE: .asciiz "Energia Total = "
txtU: .asciiz "Energia Util = "

newline: .asciiz "\n"

.text
main:

    # A
    li $v0, 4
    la $a0, msgA
    syscall
    
    li $v0, 5
    syscall
    move $s0, $v0      

    # B
    li $v0, 4
    la $a0, msgB
    syscall
    
    li $v0, 5
    syscall
    move $s1, $v0       

    # C
    li $v0, 4
    la $a0, msgC
    syscall
    
    li $v0, 5
    syscall
    move $s2, $v0      

    # D
    li $v0, 4
    la $a0, msgD
    syscall
    
    li $v0, 5
    syscall
    move $s3, $v0       

    # Valores
    li $v0, 4
    la $a0, msgLidas
    syscall

    # A
    li $v0, 4
    la $a0, txtA
    syscall

    li $v0, 1
    move $a0, $s0
    syscall

    li $v0, 4
    la $a0, newline
    syscall

    # B
    li $v0, 4
    la $a0, txtB
    syscall

    li $v0, 1
    move $a0, $s1
    syscall

    li $v0, 4
    la $a0, newline
    syscall

    # C
    li $v0, 4
    la $a0, txtC
    syscall

    li $v0, 1
    move $a0, $s2
    syscall

    li $v0, 4
    la $a0, newline
    syscall

    # D
    li $v0, 4
    la $a0, txtD
    syscall

    li $v0, 1
    move $a0, $s3
    syscall

    li $v0, 4
    la $a0, newline
    syscall

    #Cálculos
    mul $t0, $s0, $s1      # P = A * B
    mul $t1, $t0, $s2      # E = P * C
    div $t1, $s3
    mflo $t2               # U = E / D

    # Resultados
    li $v0, 4
    la $a0, msgCalc
    syscall

    # Potência
    li $v0, 4
    la $a0, txtP
    syscall

    li $v0, 1
    move $a0, $t0
    syscall

    li $v0, 4
    la $a0, newline
    syscall

    # Energia total
    li $v0, 4
    la $a0, txtE
    syscall

    li $v0, 1
    move $a0, $t1
    syscall

    li $v0, 4
    la $a0, newline
    syscall

    # Energia útil
    li $v0, 4
    la $a0, txtU
    syscall

    li $v0, 1
    move $a0, $t2
    syscall

    li $v0, 4
    la $a0, newline
    syscall


    li $v0, 10
    syscall
