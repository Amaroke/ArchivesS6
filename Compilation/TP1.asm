# MATHIEU STEINBACH Hugo
.data
saut_ligne: .asciiz "\n"
.text
main :
    # Initialiser s7 avec sp (initialisation de la base des variables).
     move $s7, $sp
     
    # entier i ; entier j ; entier k ; entier z ;
    # i -> 0
    # j -> -4
    # k -> -8
    # z -> -12
     addi $sp, $sp, -16
     
    # k = 10
     li $v0, 10
     sw $v0, -8($s7)
     
    # j = 8
     li $v0, 8
     sw $v0, -4($s7)
     
   # ecrire k
    lw $v0, -8($s7)        		# On récupère k dans $v0
    move $a0, $v0           		# On met $v0 dans $a0 pour l'affichage.
    li $v0, 1
    syscall
    
   # Saut de ligne
    la $a0, saut_ligne
    li $v0, 4
    syscall
    
   # i = j + 2 ; 
    lw $v0, -4($s7)         		# On récupère j dans $v0
    li $t8, 2
    add $v0, $v0, $t8           	# On ajoute $t8 à $v0
    sw $v0, 0($s7)          		# On stocke $v0 dans i
    
   # ecrire i + 1 ;
    lw $v0, 0($s7)          		# On récupère i dans $v0
    li $t8, 1
    add $v0, $v0, $t8           	# On ajoute $t8 à $v0
    move $a0, $v0           		# On met $v0 dans $a0 pour l'affichage.
    li $v0, 1
    syscall
    
   # Saut de ligne
    la $a0, saut_ligne
    li $v0, 4
    syscall
    
   # j = j - i ;
    lw $v0, -4($s7)             	# On récupère j dans $v0
    sw $v0,($sp)            		# On empile $v0
    add $sp, $sp, -4
    lw $v0, 0($s7)          		# On récupère i dans $v0
    add $sp, $sp, 4         		# On dépile dans $t8
    lw $t8,($sp)
    sub $v0, $t8, $v0           	# On retire $t8 à $v0
    sw $v0, -4($s7)         		# On stocke $v0 dans j
    
   # z = (k - 3) - (j * k) ; 
    lw $v0, -8($s7)           		# On récupère k dans $v0
    li $t8, 3
    sub $v0, $v0, $t8         		# On retire $t8 à $v0
    sw $v0,($sp)       			# On empile $v0
    add $sp, $sp, -4
    lw $v0, -4($s7)        		# On récupère j dans $v0
    sw $v0,($sp)       			# On empile $v0
    add $sp, $sp, -4
    lw $v0, -8($s7)      		# On récupère k dans $v0
    add $sp, $sp, 4      		# On dépile dans $t8
    lw $t8,($sp)
    mult $v0, $t8       		# On multiplie $v0 par $t8
    mflo $v0
    add $sp, $sp, 4         		# On dépile dans $t8
    lw $t8,($sp)
    sub $v0, $t8, $v0         		# On retire $v0 à $t8
    sw $v0, -12($s7)          		# On stocke $v0 dans z
     	
   # ecrire z
    lw $v0, -12($s7)            	# On récupère z dans $v0
    move $a0, $v0			# On met $v0 dans $a0 pour l'affichage.
    li $v0, 1
    syscall
    
   # si i < z alors ecrire i ; sinon ecrire z ; finsi
   
   # repeter j = j + 1 ; k = k - j ; jusqua k < 0 finrepeter
   
end :

    # Retour au système
    li $v0, 10
    syscall