; Segment bank86_B000: not yet disassembled. tools/disasm65816.py writes its starting text to output/quickpass/bank86_B000.asm.
org $86B0F0
	incbin "../Extracted/segments/bank86_B000.bin":240..4096
