#MATHIEU STEINBACH Hugo & MOSELLE Marie-Luc

.data

AffichageVrai: .asciiz "vrai"
AffichageFaux: .asciiz "faux"
saut_ligne: .asciiz "\n"

.text

main: 
   #Initialisation de la base des variables :
	move $s7, $sp
	addi $sp, $sp, -28

   #Debut du programme :

   #ecrire 42
	li $v0, 42
	move $a0, $v0
	li $v0, 1
	syscall
	la $a0, saut_ligne
	li $v0, 4
	syscall

   #ecrire faux
	li $v0, 0
	move $a0, $v0
	beq $zero, $a0, Sinon1
	la $a0, AffichageVrai
	li $v0, 4
	syscall
	b FinSi1
	Sinon1:
	la $a0, AffichageFaux
	li $v0, 4
	syscall
	FinSi1:
	la $a0, saut_ligne
	li $v0, 4
	syscall

   #ecrire vrai
	li $v0, 1
	move $a0, $v0
	beq $zero, $a0, Sinon2
	la $a0, AffichageVrai
	li $v0, 4
	syscall
	b FinSi2
	Sinon2:
	la $a0, AffichageFaux
	li $v0, 4
	syscall
	FinSi2:
	la $a0, saut_ligne
	li $v0, 4
	syscall

   #a = 5
	li $v0, 5
	sw $v0, 0($s7)
   #c = a
	lw $v0, 0($s7)

	sw $v0, -8($s7)
   #b = vrai
	li $v0, 1
	sw $v0, -4($s7)
   #d = faux
	li $v0, 0
	sw $v0, -12($s7)
   #ecrire a
	lw $v0, 0($s7)

	move $a0, $v0
	li $v0, 1
	syscall
	la $a0, saut_ligne
	li $v0, 4
	syscall

   #ecrire b
	lw $v0, -4($s7)

	move $a0, $v0
	beq $zero, $a0, Sinon4
	la $a0, AffichageVrai
	li $v0, 4
	syscall
	b FinSi4
	Sinon4:
	la $a0, AffichageFaux
	li $v0, 4
	syscall
	FinSi4:
	la $a0, saut_ligne
	li $v0, 4
	syscall

   #ecrire c
	lw $v0, -8($s7)

	move $a0, $v0
	li $v0, 1
	syscall
	la $a0, saut_ligne
	li $v0, 4
	syscall

   #ecrire d
	lw $v0, -12($s7)

	move $a0, $v0
	beq $zero, $a0, Sinon6
	la $a0, AffichageVrai
	li $v0, 4
	syscall
	b FinSi6
	Sinon6:
	la $a0, AffichageFaux
	li $v0, 4
	syscall
	FinSi6:
	la $a0, saut_ligne
	li $v0, 4
	syscall

   #ecrire fonc1
	   #Sauvegarde des registres
	sw $ra,0($sp)
	sw $s1,-4($sp)
	addi $sp,$sp,-8
   #Empilage des paramètres
	addi $sp, $sp, 0
   #Appel de la fonction
	jal fonc10
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

   #ecrire fonc2
	   #Sauvegarde des registres
	sw $ra,0($sp)
	sw $s1,-4($sp)
	addi $sp,$sp,-8
   #Empilage des paramètres
	addi $sp, $sp, 0
   #Appel de la fonction
	jal fonc20
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

   #ecrire fonc3
	   #Sauvegarde des registres
	sw $ra,0($sp)
	sw $s1,-4($sp)
	addi $sp,$sp,-8
   #Empilage des paramètres
	addi $sp, $sp, 0
   #Appel de la fonction
	jal fonc30
   #Restauration des registres
	lw $s1,4($sp)
	lw $ra,8($sp)
	addi $sp,$sp,8

	move $a0, $v0
	beq $zero, $a0, Sinon9
	la $a0, AffichageVrai
	li $v0, 4
	syscall
	b FinSi9
	Sinon9:
	la $a0, AffichageFaux
	li $v0, 4
	syscall
	FinSi9:
	la $a0, saut_ligne
	li $v0, 4
	syscall

	b end

	fonc20:
	li $v0, 42
	jr $ra

	fonc10:
	   #Sauvegarde des registres
	sw $ra,0($sp)
	sw $s1,-4($sp)
	addi $sp,$sp,-8
   #Empilage des paramètres
	addi $sp, $sp, 0
   #Appel de la fonction
	jal fonc20
   #Restauration des registres
	lw $s1,4($sp)
	lw $ra,8($sp)
	addi $sp,$sp,8

	jr $ra

	fonc30:
	li $v0, 0
	jr $ra

   #Fin du programme :
	end:
	li $v0, 10
	syscall
