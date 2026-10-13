; Segment bank86_F000: not yet disassembled. tools/disasm65816.py writes its starting text to output/quickpass/bank86_F000.asm.
org $86F164
	incbin "../Extracted/segments/bank86_F000.bin":356..4096
