; Segment bank9F_D000: not yet disassembled. tools/disasm65816.py writes its starting text to output/quickpass/bank9F_D000.asm.
org $9FD000
	incbin "../Extracted/segments/bank9F_D000.bin":0..31
CODE_9FD01F:
	incbin "../Extracted/segments/bank9F_D000.bin":31..4096
