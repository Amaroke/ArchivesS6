#MATHIEU STEINBACH Hugo & MOSELLE Marie-Luc

.data

vrai: .word 1
faux: .word 0
AffichageVrai: .asciiz "vrai"
AffichageFaux: .asciiz "faux"
saut_ligne: .asciiz "\n"

.text

main: 
   #Initialisation de la base des variables :
	move $s7, $sp
	addi $sp, $sp, -12

   #Initialisation de $s1 avec la valeur faux :
	la $s1, faux

   #Debut du programme :

   #ecrire fonc1
   #Sauvegarde des registres
	sw $ra,0($sp)
	sw $s1,-4($sp)
	addi $sp,$sp,-8
   #Appel de la fonction
	jal fonc1
   #Restauration des registres
	lw $s1,4($sp)
	lw $ra,8($sp)
	addi $sp,$sp,8
	move $a0, $v0
	move $t0, $v0
	beq $s1, $t0, Sinon15
	la $a0, AffichageVrai
	li $v0, 4
	syscall
	b FinSi15
	Sinon15:
	la $a0, AffichageFaux
	li $v0, 4
	syscall
	FinSi15:
	la $a0, saut_ligne
	li $v0, 4
	syscall

   #ecrire 1
	li $a0, 1
	li $v0, 1
	syscall
	la $a0, saut_ligne
	li $v0, 4
	syscall

   #ecrire vrai
	la $a0, AffichageVrai
	li $v0, 4
	syscall
	la $a0, saut_ligne
	li $v0, 4
	syscall

	b end

	fonc2:
	la, $v0, faux
	jr $ra

	fonc1:
   #Sauvegarde des registres
	sw $ra,0($sp)
	sw $s1,-4($sp)
	addi $sp,$sp,-8
   #Appel de la fonction
	jal fonc2
   #Restauration des registres
	lw $s1,4($sp)
	lw $ra,8($sp)
	addi $sp,$sp,8

	jr $ra

   #Fin du programme :
	end:
	li $v0, 10
	syscall
