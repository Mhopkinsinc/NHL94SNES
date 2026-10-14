; Graphics.

DATA8_9ADE57:		; colours packed for DecompressLZ, loaded into CGRAM by screen setups; not identified yet
	db $10,$FB
	db $00,$01,$00
	incbin "../../../Extracted/data/gfx/DATA8_9ADE57.pal.lz":5..137
