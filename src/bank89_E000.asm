; Segment bank89_E000: not yet disassembled. tools/disasm65816.py writes its starting text to output/quickpass/bank89_E000.asm.
org $89E033
	incbin "../Extracted/segments/bank89_E000.bin":51..4096
