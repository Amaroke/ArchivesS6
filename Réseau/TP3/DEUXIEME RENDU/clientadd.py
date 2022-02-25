from socket import *
import sys

if len(sys.argv) != 3:
    print("Le nombre d'argument fourni n'est pas le bon merci de préciser l'IP et le port.")
    sys.exit(-1)

try:
    mysocket = socket(AF_INET, SOCK_DGRAM, IPPROTO_UDP)
except:
    print("Erreur lors de la création du socket")
    sys.exit(-2)


x = int(input("Donner un entier : "))
y = int(input("Donner un deuxième entier : "))

x_bytes = int.to_bytes(x, 4, byteorder="big")
y_bytes = int.to_bytes(y, 4, byteorder="big")

try:
    sent = mysocket.sendto(x_bytes + y_bytes, (sys.argv[1], int(sys.argv[2])))
except:
    print("Erreur lors de l'envoi du message.")
    sys.exit(-3)

try:
    (resultat_bytes, adresse_serveur) = mysocket.recvfrom(60)
except:
    print("Erreur lors de la réception du message.")
    sys.exit(-4)

print("Voici le résultat : " + str(int.from_bytes(resultat_bytes, byteorder="big")))

try:
    mysocket.close()
except:
    print("Erreur lors de la fermeture du socket.")
    sys.exit(-5)

sys.exit(0)
