; Segment bank80_D000: not yet disassembled. tools/disasm65816.py writes its starting text to output/quickpass/bank80_D000.asm.
org $80D001
	incbin "../Extracted/segments/bank80_D000.bin":1..4096
