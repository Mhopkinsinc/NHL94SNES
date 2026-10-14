; Graphics.

DATA8_9ABA95:		; a 32 x 28 map packed for DecompressLZ (width, height, , then the map words), read
			;   by screen setups in banks $9B and $9D; not identified yet
	db $10,$FB
	db $00,$07,$06
	incbin "../../../Extracted/data/gfx/DATA8_9ABA95.map.lz":5..352
