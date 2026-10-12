; Segment bank80_C000: not yet disassembled. tools/disasm65816.py writes its starting text to output/quickpass/bank80_C000.asm.
org $80C001
	incbin "../Extracted/segments/bank80_C000.bin":1..105
CODE_80C069:
	incbin "../Extracted/segments/bank80_C000.bin":105..4096
