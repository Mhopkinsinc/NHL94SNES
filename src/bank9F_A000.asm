; Segment bank9F_A000: not yet disassembled. tools/disasm65816.py writes its starting text to output/quickpass/bank9F_A000.asm.
org $9FA001
	incbin "../Extracted/segments/bank9F_A000.bin":1..4096
