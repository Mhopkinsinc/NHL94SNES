; Segment bank9E_F000: not yet disassembled. tools/disasm65816.py writes its starting text to output/quickpass/bank9E_F000.asm.
org $9EF000
	incbin "../Extracted/segments/bank9E_F000.bin":0..42
CODE_9EF02A:
	incbin "../Extracted/segments/bank9E_F000.bin":42..4096
