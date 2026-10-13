; Segment bank87_E000: not yet disassembled. tools/disasm65816.py writes its starting text to output/quickpass/bank87_E000.asm.
org $87E078
	incbin "../Extracted/segments/bank87_E000.bin":120..4096
