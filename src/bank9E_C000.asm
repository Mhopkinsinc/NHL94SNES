; Segment bank9E_C000: not yet disassembled. tools/disasm65816.py writes its starting text to output/quickpass/bank9E_C000.asm.
org $9EC000
CODE_9EC000:
	incbin "../Extracted/segments/bank9E_C000.bin":0..29
CODE_9EC01D:
	incbin "../Extracted/segments/bank9E_C000.bin":29..4096
