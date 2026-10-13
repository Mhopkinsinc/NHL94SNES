; Segment bank8B_E000: not yet disassembled. tools/disasm65816.py writes its starting text to output/quickpass/bank8B_E000.asm.
org $8BE028
	incbin "../Extracted/segments/bank8B_E000.bin":40..4096
