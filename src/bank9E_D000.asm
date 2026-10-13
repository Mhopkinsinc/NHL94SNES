; Segment bank9E_D000: not yet disassembled. tools/disasm65816.py writes its starting text to output/quickpass/bank9E_D000.asm.
org $9ED002
	incbin "../Extracted/segments/bank9E_D000.bin":2..9
CODE_9ED009:
	incbin "../Extracted/segments/bank9E_D000.bin":9..77
CODE_9ED04D:
	incbin "../Extracted/segments/bank9E_D000.bin":77..4096
