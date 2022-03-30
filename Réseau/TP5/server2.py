from socket import *
import sys
import select

mysocket = socket(AF_INET, SOCK_STREAM, IPPROTO_TCP)

port = int(sys.argv[1])
mysocket.bind(('',port))
mysocket.listen(10)

sockets = [mysocket]
clients = []
liste_clients = dict()

while True:
    [veutmeparler,_,_] = select.select(sockets,[],[])
    for socket in veutmeparler:
        if socket == mysocket:
            (nouvellesocket,adr) = socket.accept()
            clients.append(nouvellesocket)
            sockets.append(nouvellesocket)
            liste_clients[nouvellesocket] = adr
            print(adr[0] + " se connecte.")
            message = adr[0] + " se connecte."
            message_bytes = bytes(message, "utf-8")
        else:
            message_recu = socket.recv(1024)
            if len(message_recu) == 0 or str(message_recu, 'utf-8') == 'FIN':
                socket.close()
                clients.remove(socket)
                sockets.remove(socket)
                print(liste_clients[socket][0] + " se deconnecte.")
                message = liste_clients[socket][0] + " se deconnecte."
                message_bytes = bytes(message, "utf-8")
            else:
                print(str(message_recu, "utf-8"))
                message = str(message_recu, "utf-8")
                message_bytes = bytes(message, "utf-8")
                print(message)
            
        for client in clients:
            if (client != socket):
                client.send(message_bytes)

