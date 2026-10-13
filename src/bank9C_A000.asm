; Segment bank9C_A000: not yet disassembled. tools/disasm65816.py writes its starting text to output/quickpass/bank9C_A000.asm.
org $9CA002
	incbin "../Extracted/segments/bank9C_A000.bin":2..77
CODE_9CA04D:
	incbin "../Extracted/segments/bank9C_A000.bin":77..4096
