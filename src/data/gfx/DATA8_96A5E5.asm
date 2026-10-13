; Graphics.

DATA8_96A5E5:		; tiles packed for DecompressLZ that a screen setup sends to VRAM; not identified yet
	db $10,$FB
	db $00,$12,$C0
	incbin "DATA8_96A5E5.chr.lz":5..1151
