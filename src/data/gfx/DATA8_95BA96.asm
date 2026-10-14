; Graphics.

DATA8_95BA96:		; tiles packed for DecompressLZ that screen setups send to VRAM; not identified yet
	db $10,$FB
	db $00,$0E,$A0
	incbin "../../../Extracted/data/gfx/DATA8_95BA96.chr.lz":5..2272
