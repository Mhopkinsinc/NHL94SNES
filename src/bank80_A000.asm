; Segment bank80_A000: not yet disassembled. tools/disasm65816.py writes its starting text to output/quickpass/bank80_A000.asm.
org $809FF5
	incbin "../Extracted/segments/bank80_9000.bin":4085..4096
	incbin "../Extracted/segments/bank80_A000.bin":0..4096
