; Segment bank9C_9000: not yet disassembled. tools/disasm65816.py writes its starting text to output/quickpass/bank9C_9000.asm.
org $9C9000
	incbin "../Extracted/segments/bank9C_9000.bin":0..2
CODE_9C9002:
	incbin "../Extracted/segments/bank9C_9000.bin":2..4096
