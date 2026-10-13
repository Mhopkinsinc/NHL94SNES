; Segment bank9F_9000: not yet disassembled. tools/disasm65816.py writes its starting text to output/quickpass/bank9F_9000.asm.
org $9F9001
	incbin "../Extracted/segments/bank9F_9000.bin":1..4096
