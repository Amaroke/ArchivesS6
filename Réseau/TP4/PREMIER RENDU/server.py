from socket import *
import sys

if len(sys.argv) != 3:
    print("Le nombre d'argument fourni n'est pas le bon merci de préciser l'IP et le port.")
    sys.exit(-1)

try:
    host = sys.argv[1]
    port = int(sys.argv[2])
    mysocket = socket(AF_INET, SOCK_STREAM, IPPROTO_TCP)
    mysocket.bind(('', port))
    mysocket.listen(1)
except:
    print("Erreur lors de la création du socket")
    sys.exit(-2)

# On attend, avec un client au plus dans la file d’attente.
(socket2, adresse_client) = mysocket.accept()

try:
    message = socket2.recv(60)
except:
    print("Erreur lors de la réception du message.")
    sys.exit(-3)

print("Voici l'IP et le port du client : ")
print(adresse_client)

try:
    socket2.send(bytes(str(message, "utf-8").upper(), "utf-8"))
except:
    print("Erreur lors de l'envoi du message.")
    sys.exit(-4)

try:
    socket2.close()
    mysocket.close()
except:
    print("Erreur lors de la fermeture du socket.")
    sys.exit(-5)

sys.exit(0)