from socket import *
import sys

if len(sys.argv) != 3:
    print("Le nombre d'argument fourni n'est pas le bon merci de préciser l'IP et le port.")
    sys.exit(-1)

try:
    host = sys.argv[1]
    port = int(sys.argv[2])
    mysocket = socket(AF_INET, SOCK_STREAM, IPPROTO_TCP)
except:
    print("Erreur lors de la création du socket")
    sys.exit(-2)


message = "J'aime le cours de Réseaux 2"

message_bytes = bytes(message, "utf-8")

try:
    mysocket.connect((host, port))
except:
    print("Erreur lors de la connexion.")
    sys.exit(-3)

try:
    sent = mysocket.send(message_bytes)
except:
    print("Erreur lors de l'envoi du message.")
    sys.exit(-4)

try:
    resultat_bytes = mysocket.recv(60)
except:
    print("Erreur lors de la réception du message.")
    sys.exit(-5)

resultat = str(resultat_bytes, "utf-8")
print(resultat)

try:
    mysocket.close()
except:
    print("Erreur lors de la fermeture du socket.")
    sys.exit(-6)

sys.exit(0)