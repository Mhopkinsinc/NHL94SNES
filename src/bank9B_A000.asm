; Segment bank9B_A000: not yet disassembled. tools/disasm65816.py writes its starting text to output/quickpass/bank9B_A000.asm.
org $9BA000
	incbin "../Extracted/segments/bank9B_A000.bin":0..3
CODE_9BA003:
	incbin "../Extracted/segments/bank9B_A000.bin":3..4096
