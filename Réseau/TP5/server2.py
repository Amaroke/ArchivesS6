from socket import *
import sys
import select

mysocket = socket(AF_INET, SOCK_STREAM, IPPROTO_TCP)

port = int(sys.argv[1])
mysocket.bind(('',port))
mysocket.listen(1)

listesockets = [mysocket]
clients = []

while True:
    [veutmeparler,_,_] = select.select(listesockets,[],[])
    for s in veutmeparler:
        if s == mysocket:
            # nouveau client
            (nouvellesocket,adr) = s.accept()
            clients.append(nouvellesocket)
            listesockets.append(nouvellesocket)
        else:
            msg = s.recv(1000)
            if len(msg) == 0:
            # le client est parti
                s.close()
                clients.remove(s)
                listesockets.remove(s)
            else:
                message = str(msg, 'utf-8')
                print(message)