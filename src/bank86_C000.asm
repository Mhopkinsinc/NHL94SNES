; Segment bank86_C000: not yet disassembled. tools/disasm65816.py writes its starting text to output/quickpass/bank86_C000.asm.
org $86C11B
	incbin "../Extracted/segments/bank86_C000.bin":283..4096
