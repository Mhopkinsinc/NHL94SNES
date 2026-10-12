; Segment bank80_B000: not yet disassembled. tools/disasm65816.py writes its starting text to output/quickpass/bank80_B000.asm.
org $80B001
	incbin "../Extracted/segments/bank80_B000.bin":1..4096
