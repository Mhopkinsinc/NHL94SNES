; Segment bank9F_C000: not yet disassembled. tools/disasm65816.py writes its starting text to output/quickpass/bank9F_C000.asm.
org $9FC002
	incbin "../Extracted/segments/bank9F_C000.bin":2..13
CODE_9FC00D:
	incbin "../Extracted/segments/bank9F_C000.bin":13..4096
