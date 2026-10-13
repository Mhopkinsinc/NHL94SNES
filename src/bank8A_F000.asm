; Segment bank8A_F000: not yet disassembled. tools/disasm65816.py writes its starting text to output/quickpass/bank8A_F000.asm.
org $8AF011
	incbin "../Extracted/segments/bank8A_F000.bin":17..4096
