import glob
import shutil
import time
import re
import subprocess
import os
import sys

ln_split = re.compile('[ \t\n\r]+')

def check_sol(fname):
    try:
        dest = fname.replace("pending/", "submissions/")
        shutil.move(fname, dest)
        with open(dest.replace(".txt", ".result"), 'w') as f: f.write("*** WAIT ***")
        # get a list of writes from file
        writes = {}
        with open(dest, 'r') as f:
            for line in f.readlines():
                line = line.strip()
                if not len(line): continue
                if line[0] == ';': continue
                fields = ln_split.split(line)
                if len(fields) < 3: continue
                frame = int(fields[0], 10)
                addr = int(fields[1], 16)
                if frame not in writes:
                    writes[frame] = []
                for i in range(2, len(fields)):
                    if addr < 0x2000000 or addr > 0x3ffffff: continue
                    writes[frame].append((addr, int(fields[i], 16)))
                    addr += 1
        # convert it to mgba debug commands
        cmds = []
        cmds.append("watch/r 0x085e5c14")
        for i in range(0, 10000):
            if i in writes:
                for write in writes[i]:
                    cmds.append("w/1 0x%.8x 0x%.2x" % (write[0], write[1]))
            cmds.append("frame")
        cmds.append("quit")
        with open(dest.replace(".txt", ".mgbacmd"), "w") as f:
            f.write("\n".join(cmds))
            f.write("\n")
        # run mgba
        p = subprocess.Popen(['/bin/sh', '-c', 'cd /home/gbachall; export DISPLAY=:1; export SDL_AUDIODRIVER=disk; export SDL_DISKAUDIOFILE; rm emerald.sav; mgba -d emerald.gba -C audioSync=0 -C videoSync=0 -C fpsTarget=999 -C mute=1 < "%s" 2>&1 > "%s"' % (dest.replace(".txt", ".mgbacmd"), dest.replace(".txt", ".mgbaout"))])
        try:
            p.wait(60)
        except subprocess.TimeoutExpired:
            p.kill()
        time.sleep(1)
        os.system("killall -9 mgba")
        # check the output for the watchpoint hit
        with open(dest.replace(".txt", ".mgbaout"), 'r') as f:
            mgba_out = f.read()
        if 'Hit watchpoint at 0x085E5C14' in mgba_out and '08006120:' in mgba_out:
            with open(dest.replace(".txt", ".result"), 'w') as f: f.write("*** OK ***")
        else:
            with open(dest.replace(".txt", ".result"), 'w') as f: f.write("*** FAIL ***")
    except:
        with open(dest.replace(".txt", ".result"), 'w') as f: f.write("%s[%i]" % (sys.exc_info()[0], sys.exc_info()[2].tb_lineno))

while 1:
    for f in glob.glob("pending/*.txt"):
        print("checking %s" % f)
        check_sol(f)
    time.sleep(10)
