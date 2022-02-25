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

try:
    mysocket.bind(("", int(sys.argv[2])))
except:
    print("Erreur lors de la liaison.")
    sys.exit(-3)

try:
    (message, adresse_client) = mysocket.recvfrom(60)
except:
    print("Erreur lors de la réception du message.")
    sys.exit(-4)

print("Voici l'IP et le port du client : ")
print(adresse_client)

try:
    sent = mysocket.sendto(bytes(str(message, "utf-8").upper(), "utf-8"), adresse_client)
except:
    print("Erreur lors de l'envoi du message.")
    sys.exit(-5)

try:
    mysocket.close()
except:
    print("Erreur lors de la fermeture du socket.")
    sys.exit(-6)

sys.exit(0)
