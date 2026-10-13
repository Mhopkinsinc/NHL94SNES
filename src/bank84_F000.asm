; Segment bank84_F000: not yet disassembled. tools/disasm65816.py writes its starting text to output/quickpass/bank84_F000.asm.
org $84F045
	incbin "../Extracted/segments/bank84_F000.bin":69..4096
