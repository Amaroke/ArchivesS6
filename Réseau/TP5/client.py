from socket import *
import time
import sys
if len(sys.argv) != 3:
    sys.exit(-1)

host = sys.argv[1]
port = int(sys.argv[2])
mysocket = socket(AF_INET, SOCK_STREAM, IPPROTO_TCP)
myself = gethostname()
mysocket.connect((host, port))

for i in range(5):    
    message = "hello from " + myself +"\n"
    time.sleep(1)
    message_bytes = bytes(message, "utf-8")
    sent = mysocket.send(message_bytes)
mysocket.close()


