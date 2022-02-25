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


message = "J'aime le cours de Réseaux 2"

message_bytes = bytes(message, "utf-8")

try:
    sent = mysocket.sendto(message_bytes, (sys.argv[1], int(sys.argv[2])))
except:
    print("Erreur lors de l'envoi du message.")
    sys.exit(-3)

try:
    (resultat_bytes, adresse_serveur) = mysocket.recvfrom(60)
except:
    print("Erreur lors de la réception du message.")
    sys.exit(-4)

resultat = str(resultat_bytes, "utf-8")
print(resultat)

try:
    mysocket.close()
except:
    print("Erreur lors de la fermeture du socket.")
    sys.exit(-5)

sys.exit(0)
