import warnings
warnings.filterwarnings("ignore")
import os
import sys
import threading
import time

def watchdog():
    time.sleep(10)
    os.kill(os.getpid(), 9)

thr = threading.Thread(target=watchdog, daemon=True)
thr.start()

TOO_LARGE_CONTENT = b"<h1>413 Request Entity Too Large</h1>\n<p>Only requests up to 0x800 bytes are allowed.</p>"
TOO_LARGE_DATA = b"HTTP/1.0 413 Request Entity Too Large\r\nServer: gbhttp (harness)\r\nContent-Type: text/html\r\nContent-Length: %i\r\n\r\n%s" % (len(TOO_LARGE_CONTENT), TOO_LARGE_CONTENT)

NO_RESP_CONTENT = b"<h1>502 Bad Gateway</h1>\n<p>Something horrible happened to our Game Boy system.</p>\n<p>The code monkeys at our headquarters are working VEWY HAWD to fix this!</p>"
NO_RESP_DATA = b"HTTP/1.0 502 Bad Gateway\r\nServer: gbhttp (harness)\r\nContent-Type: text/html\r\nContent-Length: %i\r\n\r\n%s" % (len(NO_RESP_CONTENT), NO_RESP_CONTENT)

req_bytes = []
while 1:
    r = sys.stdin.buffer.read(1)
    if len(r) == 0:
        break
    req_bytes.append(r[0])
    if len(req_bytes) >= 4:
        if req_bytes[-1] == 10 and req_bytes[-2] == 13 and req_bytes[-3] == 10 and req_bytes[-4] == 13:
            break
    if len(req_bytes) >= 0x800:
        sys.stdout.buffer.write(TOO_LARGE_DATA)
        sys.exit(0)

from pyboy import PyBoy
pb = PyBoy(
    '/home/gbhttp/server.gb',
    sound=False,
    bootrom="/home/gbhttp/quickboot.bin",
    window="null"
)

got_result = False

for x in range(0, 60):
    pb.tick()
    if pb.memory[0xff80] == 1:
        for i in range(0, len(req_bytes)):
            pb.memory[0xc000+i] = req_bytes[i]
        pb.memory[0xff80] = 2
    if pb.memory[0xff80] == 3:
        got_result = True
        break

if not got_result:
    sys.stdout.buffer.write(NO_RESP_DATA)
else:
    resp = bytes([pb.memory[i] for i in range(0xc800, 0xd000)]).split(b"\0", 1)[0]
    sys.stdout.buffer.write(resp)
sys.exit(0)
