; Segment bank86_E000: not yet disassembled. tools/disasm65816.py writes its starting text to output/quickpass/bank86_E000.asm.
org $86E0AA
	incbin "../Extracted/segments/bank86_E000.bin":170..4096
