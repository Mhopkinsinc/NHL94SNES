; Graphics.

DATA8_96BABD:		; tiles packed for DecompressLZ that screen setups send to VRAM; not identified yet
	db $10,$FB
	db $00,$09,$E0
	incbin "../../../Extracted/data/gfx/DATA8_96BABD.chr.lz":5..1000
