; Graphics.

DATA8_9AE121:		; colours packed for DecompressLZ, loaded into CGRAM by screen setups; not identified yet
	db $10,$FB
	db $00,$01,$00
	incbin "DATA8_9AE121.pal.lz":5..71
