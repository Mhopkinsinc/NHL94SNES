; Segment bank9B_C000: not yet disassembled. tools/disasm65816.py writes its starting text to output/quickpass/bank9B_C000.asm.
org $9BC001
CODE_9BC001:
	incbin "../Extracted/segments/bank9B_C000.bin":1..4096
