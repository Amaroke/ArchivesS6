from ctypes import sizeof
from socket import *
import sys

def really_recv(n):
    try:
        (socket2, adresse_client) = mysocket.accept()
    except:
        print("Erreur lors de la connexion du client.")
        sys.exit(-6)
    len_message = 0
    while(len_message != n):
        print(len_message)
        try:
            message = socket2.recv(n)
            len_message = len(message)
        except:
            print("Erreur lors de la réception du message")
            sys.exit(-7)
    return (adresse_client, message, socket2)


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

try:
    (adresse_client, message, socket2) = really_recv(8)
except:
    print("Erreur lors de la réception du message.")
    sys.exit(-3)

print("Voici l'IP et le port du client : ")
print(adresse_client)

x = int.from_bytes(message[0:4], byteorder="big")
y = int.from_bytes(message[4:8], byteorder="big")

try:
    socket2.send(int.to_bytes(x+y,4, byteorder="big"))
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