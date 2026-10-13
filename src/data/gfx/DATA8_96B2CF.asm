; Graphics.

DATA8_96B2CF:		; tiles packed for DecompressLZ that screen setups send to VRAM; not identified yet
	db $10,$FB
	db $00,$06,$E0
	incbin "DATA8_96B2CF.chr.lz":5..1022
