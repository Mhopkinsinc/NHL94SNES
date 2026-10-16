#!/usr/bin/env python3
# bankcheck.py: 16-bit (.w) references that only work while two things share a bank. asar keeps the low word of a label in
# another bank without a word, so moving a routine or a table to another bank breaks these silently. Run ./build.sh first
# (output/nhl94snes.sym). Usage: python3 tools/bankcheck.py. The retail code has none; the exit status is 1 if any.
#   ERROR  jsr.w / jmp.w (also jmp (Label,x)) to a label in another bank: always wrong, those stay in the program bank.
#   WARN   lda.w / sta.w ... Label with Label in ROM in another bank than the code: right only if the data bank register
#          (DBR) was set to that bank (phb / plb) first.
import re, os, glob, sys, collections

ROOT = os.path.join(os.path.dirname(os.path.abspath(__file__)), '..')
SYM = os.path.join(ROOT, 'output', 'nhl94snes.sym')

labels = {}; files = {}; line_addr = {}; sect = None
for l in open(SYM, encoding='latin1'):
	l = l.strip()
	if l.startswith('['): sect = l; continue
	if not l or l.startswith(';'): continue
	if sect == '[labels]':
		m = re.match(r'([0-9a-f]{2}):([0-9a-f]{4}) (\S+)', l, re.I)
		if m and not m[3].startswith(':'): labels.setdefault(m[3], (int(m[1], 16) << 16) | int(m[2], 16))
	elif sect == '[source files]':
		i, _, n = l.split(' ', 2); files[int(i, 16)] = os.path.normcase(os.path.normpath(os.path.join(ROOT, n)))
	elif sect == '[addr-to-line mapping]':
		m = re.match(r'([0-9a-f]{2}):([0-9a-f]{4}) ([0-9a-f]{4}):([0-9a-f]{8})', l, re.I)
		if m: line_addr.setdefault((files[int(m[3], 16)], int(m[4], 16)), (int(m[1], 16) << 16) | int(m[2], 16))

def rom(a): return (a >> 16) & 0x7F < 0x7E and (a & 0xFFFF) >= 0x8000
def bank(a): return (a >> 16) & 0x7F		# $00-$3F and $80-$BF are the same banks

INS = re.compile(r'^\s*([a-z]{3})\.w\s+\(?([A-Za-z_.][\w.]*)', re.I)
rows = []
for f in sorted(glob.glob(os.path.join(ROOT, 'src', '**', '*.asm'), recursive=True)):
	key = os.path.normcase(os.path.normpath(f)); rel = os.path.relpath(f, ROOT).replace(chr(92), '/')
	parent = None
	for n, l in enumerate(open(f, encoding='latin1').read().split(chr(10)), 1):
		c = l.split(';')[0].rstrip()
		g = re.match(r'^([A-Za-z_]\w*):', c)
		if g: parent = g[1]
		m = INS.match(c)
		if not m: continue
		pc = line_addr.get((key, n))
		if pc is None: continue
		op, name = m[1].lower(), m[2]
		if name.startswith('.'): name = (parent or '') + '_' + name[1:]
		a = labels.get(name)
		if a is None or not rom(a) or bank(a) == bank(pc): continue
		kind = 'ERROR' if op in ('jsr', 'jmp') else 'WARN'
		rows.append((kind, f'{rel}:{n}', f'{op}.w {m[2]}', f'${a:06X} from code in ${pc >> 16:02X}'))

for k, w, what, why in rows: print(f'{k} {w}: {what}  ; {why}')
print(f'bankcheck: {sum(r[0] == "ERROR" for r in rows)} errors, {sum(r[0] == "WARN" for r in rows)} cross-bank .w reads')
sys.exit(1 if rows else 0)
