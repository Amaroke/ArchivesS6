from socket import *
import sys
import select

if len(sys.argv) != 3:
    sys.exit(-1)

try:
    host = sys.argv[1]
    port = int(sys.argv[2])
    mysocket = socket(AF_INET, SOCK_STREAM, IPPROTO_TCP)
    myself = gethostname()
    mysocket.connect((host, port))

    arret = False

    while arret == False:
        sockets = [mysocket, sys.stdin]
        veutmeparler, _, _ = select.select(sockets, [], [])
        for socket in veutmeparler:
            if socket == mysocket:
                msg = socket.recv(1000)
                if not msg:
                    arret = True
                    sockets.remove(socket)
                else:
                    print(str(msg.strip(), "utf-8"))
            else:
                message = sys.stdin.readline()
                sys.stdout.flush()
                sys.stdin.flush()

                if message.strip() == "FIN":
                    print("Vous vous êtes déconnecté")
                    sockets.remove(socket)
                    arret = True
                else:
                    message_bytes = bytes(message.strip(), "utf-8")
                    sent = mysocket.send(message_bytes)
    mysocket.close()

except:
    print("Mauvais arguments")