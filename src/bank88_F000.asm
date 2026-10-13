; Segment bank88_F000: not yet disassembled. tools/disasm65816.py writes its starting text to output/quickpass/bank88_F000.asm.
org $88F096
	incbin "../Extracted/segments/bank88_F000.bin":150..4096
