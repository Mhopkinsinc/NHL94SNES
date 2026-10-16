#!/usr/bin/env python3
# romrefs.py: list numeric literals in src/ that look like ROM addresses, so they can be written as labels.
# Run ./build.sh first (it needs output/nhl94snes.sym for the label addresses and the address of every line).
# Usage: python3 tools/romrefs.py [--all]   (--all also prints the weak candidates)
import re, sys, os, glob, collections

ROOT = os.path.join(os.path.dirname(os.path.abspath(__file__)), '..')
SYM = os.path.join(ROOT, 'output', 'nhl94snes.sym')

def is_rom(bank, addr):
	b = bank & 0x7F
	if b == 0x7E or b == 0x7F: return False
	if b >= 0x40: return True
	return addr >= 0x8000

def load_sym():
	labels = collections.defaultdict(list); files = {}; line_addr = {}
	sect = None
	for l in open(SYM, encoding='latin1'):
		l = l.strip()
		if l.startswith('['): sect = l; continue
		if not l or l.startswith(';'): continue
		if sect == '[labels]':
			m = re.match(r'([0-9a-f]{2}):([0-9a-f]{4}) (\S+)', l, re.I)
			if m and not m[3].startswith(':'):
				labels[(int(m[1], 16) << 16) | int(m[2], 16)].append(m[3])
		elif sect == '[source files]':
			i, _, name = l.split(' ', 2); files[int(i, 16)] = os.path.normcase(os.path.normpath(os.path.join(ROOT, name)))
		elif sect == '[addr-to-line mapping]':
			m = re.match(r'([0-9a-f]{2}):([0-9a-f]{4}) ([0-9a-f]{4}):([0-9a-f]{8})', l, re.I)
			if m:
				key = (files[int(m[3], 16)], int(m[4], 16))
				line_addr.setdefault(key, (int(m[1], 16) << 16) | int(m[2], 16))
	return labels, line_addr

def data_starts(line_addr):
	# ROM addresses where a db/dw/dl/dd/incbin line starts
	out = set(); cache = {}
	for (f, n), a in line_addr.items():
		if f not in cache:
			try: cache[f] = open(f, encoding='latin1').read().split(chr(10))
			except OSError: cache[f] = []
		src = cache[f]
		if n <= len(src) and re.match(r'\s*(db|dw|dl|dd|incbin)', src[n - 1], re.I): out.add(a)
	return out

labels, line_addr = load_sym()
datastart = data_starts(line_addr)
label_lo = collections.defaultdict(set)		# low word -> banks that have a label there
for a in labels: label_lo[a & 0xFFFF].add(a >> 16)

MNEM = re.compile(r'^\s*([a-z]{3})(\.[bwl])?\s*(.*)$', re.I)
HEX = re.compile(r'\$([0-9A-Fa-f]+)')
BANKIMM = re.compile(r'#\$(?:00)?([89ABab][0-9A-Fa-f])\b')
DATA = re.compile(r'^\s*(db|dw|dl|dd)\s+(.*)$', re.I)

def lname(a):
	n = labels.get(a)
	return n[0] if n else None

strong = []; weak = []
for f in sorted(glob.glob(os.path.join(ROOT, 'src', '**', '*.asm'), recursive=True)):
	key = os.path.normcase(os.path.normpath(f)); rel = os.path.relpath(f, ROOT).replace(chr(92), '/')
	src = [l.split(';')[0].rstrip() for l in open(f, encoding='latin1')]
	for i, l in enumerate(src):
		pc = line_addr.get((key, i + 1))
		m = MNEM.match(l)
		d = DATA.match(l)
		where = f'{rel}:{i + 1}'
		if d and pc is not None:
			kind = d[1].lower()
			for v in re.findall(r'\$([0-9A-Fa-f]+)', d[2]):
				n = int(v, 16)
				if kind in ('dl', 'dd') and len(v) >= 5 and is_rom(n >> 16, n & 0xFFFF):
					strong.append((where, f'{kind} ${v}', lname(n) or 'ROM long pointer'))
				elif kind == 'dw' and n >= 0x8000 and (pc >> 16) in label_lo.get(n, ()):
					strong.append((where, f'dw ${v}', f'= {lname(((pc >> 16) << 16) | n)} (same bank as the table)'))
				elif kind == 'dw' and n >= 0x8000 and label_lo.get(n):
					weak.append((where, f'dw ${v}', 'low word of a label in bank ' + ','.join(f'${b:02X}' for b in sorted(label_lo[n]))))
			continue
		if not m or pc is None: continue
		op, size, arg = m[1].lower(), (m[2] or '').lower(), m[3]
		if op in ('org', 'pad', 'inc', 'dec') and not arg: continue
		for h in HEX.finditer(arg):
			v = h[1]; n = int(v, 16); imm = arg[:h.start()].endswith('#')
			if imm:
				same = ((pc >> 16) << 16) | n
				if n >= 0x8000 and len(v) == 4 and (same in labels or same in datastart):
					strong.append((where, f'{op} #${v}', f'= {lname(same) or "a data line"} at ${same:06X} (same bank as the code)'))
					continue
				if n >= 0x8000 and len(v) == 4:
					win = ' '.join(src[max(0, i - 6):i + 7])
					banks = {int(b, 16) for b in BANKIMM.findall(win)}
					hit = [b for b in banks if (b << 16 | n) in labels or (is_rom(b, n) and b != 0x7E and b != 0x7F)]
					if hit:
						b = hit[0]; nm = lname(b << 16 | n)
						strong.append((where, f'{op} #${v}', f'with bank ${b:02X} nearby: ' + (nm or f'inside ROM ${b:02X}:{n:04X}')))
				continue
			if len(v) == 6 and is_rom(n >> 16, n & 0xFFFF):
				strong.append((where, f'{op}{size} ${v}', lname(n) or 'long ROM operand'))
			elif len(v) == 4 and n >= 0x8000 and op not in ('rep', 'sep', 'brk', 'cop', 'wdm'):
				if op in ('jmp', 'jsr', 'jml', 'jsl'):
					strong.append((where, f'{op}{size} ${v}', 'numeric jump target'))
				else:
					weak.append((where, f'{op}{size} ${v}', f'absolute $8000+ (ROM if DBR is ROM): code at ${pc:06X}'))
		if op in ('lda', 'ldx', 'ldy', 'pea') and BANKIMM.search(arg) and op != 'pea':
			n = int(BANKIMM.search(arg)[1], 16)
			nxt = ' '.join(src[i + 1:i + 4]).lower()
			if re.search(r'\bplb\b|\bpha\b|sta\.\w\s+\w+\+2|stx\.\w\s+\w+\+2|sty\.\w\s+\w+\+2', nxt):
				weak.append((where, f'{op} #${n:02X}', 'numeric bank byte (pointer bank or plb)'))

out = [('STRONG', strong)] + ([('WEAK', weak)] if '--all' in sys.argv else [])
for title, rows in out:
	print(f'== {title}: {len(rows)}')
	for w, what, why in rows: print(f'{w}: {what}  ; {why}')
if '--all' not in sys.argv: print(f'== WEAK: {len(weak)} (--all to list)')
