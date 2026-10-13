; Segment bank9B_B000: not yet disassembled. tools/disasm65816.py writes its starting text to output/quickpass/bank9B_B000.asm.
org $9BB001
	incbin "../Extracted/segments/bank9B_B000.bin":1..17
CODE_9BB011:
	incbin "../Extracted/segments/bank9B_B000.bin":17..21
CODE_9BB015:
	incbin "../Extracted/segments/bank9B_B000.bin":21..29
CODE_9BB01D:
	incbin "../Extracted/segments/bank9B_B000.bin":29..4096
