#MATHIEU STEINBACH Hugo & MOSELLE Marie-Luc

.data

AffichageVrai: .asciiz "vrai"
AffichageFaux: .asciiz "faux"
saut_ligne: .asciiz "\n"

.text

main: 
   #Initialisation de la base des variables :
	move $s7, $sp
	addi $sp, $sp, -32

   #Debut du programme :

   #ecrire fonc5
	   #Sauvegarde des registres
	sw $ra,0($sp)
	sw $s1,-4($sp)
	addi $sp,$sp,-8
   #Empilage des paramètres
	li $v0, 3
	sw $v0, -8($sp)
	li $v0, 2
	sw $v0, -4($sp)
	li $v0, 1
	sw $v0, 0($sp)
	addi $sp, $sp, -12
   #Appel de la fonction
	jal fonc53
   #Restauration des registres
	lw $s1,4($sp)
	lw $ra,8($sp)
	addi $sp,$sp,8

	move $a0, $v0
	li $v0, 1
	syscall
	la $a0, saut_ligne
	li $v0, 4
	syscall

   #ecrire fonc4
	   #Sauvegarde des registres
	sw $ra,0($sp)
	sw $s1,-4($sp)
	addi $sp,$sp,-8
   #Empilage des paramètres
	li $v0, 5
	sw $v0, -4($sp)
	li $v0, 4
	sw $v0, 0($sp)
	addi $sp, $sp, -8
   #Appel de la fonction
	jal fonc42
   #Restauration des registres
	lw $s1,4($sp)
	lw $ra,8($sp)
	addi $sp,$sp,8

	move $a0, $v0
	li $v0, 1
	syscall
	la $a0, saut_ligne
	li $v0, 4
	syscall

   #ecrire fonc5
	   #Sauvegarde des registres
	sw $ra,0($sp)
	sw $s1,-4($sp)
	addi $sp,$sp,-8
   #Empilage des paramètres
	li $v0, 8
	sw $v0, -8($sp)
	li $v0, 7
	sw $v0, -4($sp)
	li $v0, 6
	sw $v0, 0($sp)
	addi $sp, $sp, -12
   #Appel de la fonction
	jal fonc53
   #Restauration des registres
	lw $s1,4($sp)
	lw $ra,8($sp)
	addi $sp,$sp,8

	move $a0, $v0
	li $v0, 1
	syscall
	la $a0, saut_ligne
	li $v0, 4
	syscall

   #ecrire fonc4
	   #Sauvegarde des registres
	sw $ra,0($sp)
	sw $s1,-4($sp)
	addi $sp,$sp,-8
   #Empilage des paramètres
	addi $sp, $sp, 0
   #Appel de la fonction
	jal fonc40
   #Restauration des registres
	lw $s1,4($sp)
	lw $ra,8($sp)
	addi $sp,$sp,8

	move $a0, $v0
	beq $zero, $a0, Sinon28
	la $a0, AffichageVrai
	li $v0, 4
	syscall
	b FinSi28
	Sinon28:
	la $a0, AffichageFaux
	li $v0, 4
	syscall
	FinSi28:
	la $a0, saut_ligne
	li $v0, 4
	syscall

	b end

	fonc42:
	lw $v0, 4($sp)
	addi $sp,$sp, 4
	sw $v0, -4($s7)
	lw $v0, 4($sp)
	addi $sp,$sp, 4
	sw $v0, 0($s7)
   #ecrire x
	lw $v0, 0($s7)

	move $a0, $v0
	li $v0, 1
	syscall
	la $a0, saut_ligne
	li $v0, 4
	syscall

   #ecrire y
	lw $v0, -4($s7)

	move $a0, $v0
	li $v0, 1
	syscall
	la $a0, saut_ligne
	li $v0, 4
	syscall

	li $v0, 0
	jr $ra

	fonc40:
	li $v0, 1
	jr $ra

	fonc53:
	lw $v0, 4($sp)
	addi $sp,$sp, 4
	sw $v0, -24($s7)
	lw $v0, 4($sp)
	addi $sp,$sp, 4
	sw $v0, -20($s7)
	lw $v0, 4($sp)
	addi $sp,$sp, 4
	sw $v0, -16($s7)
   #ecrire a
	lw $v0, -16($s7)

	move $a0, $v0
	li $v0, 1
	syscall
	la $a0, saut_ligne
	li $v0, 4
	syscall

   #ecrire b
	lw $v0, -20($s7)

	move $a0, $v0
	li $v0, 1
	syscall
	la $a0, saut_ligne
	li $v0, 4
	syscall

   #ecrire c
	lw $v0, -24($s7)

	move $a0, $v0
	li $v0, 1
	syscall
	la $a0, saut_ligne
	li $v0, 4
	syscall

	li $v0, 0
	jr $ra

   #Fin du programme :
	end:
	li $v0, 10
	syscall