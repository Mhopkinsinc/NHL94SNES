; Graphics.

DATA8_948000:		; tiles packed for DecompressLZ, unpacked by a screen setup: logo pieces with a (R) mark
	db $10,$FB
	db $00,$16,$E0
	incbin "DATA8_948000.chr.lz":5..3439
