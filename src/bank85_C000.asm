; Segment bank85_C000: not yet disassembled. tools/disasm65816.py writes its starting text to output/quickpass/bank85_C000.asm.
org $85C0EC
	incbin "../Extracted/segments/bank85_C000.bin":236..4096
