; Graphics.

DATA8_9AE9C7:		; a 30 x 12 map packed for DecompressLZ (width, height, , then the map words)
			;   read in bank $9B; not identified yet
	db $10,$FB
	db $00,$02,$D6
	incbin "../../../Extracted/data/gfx/DATA8_9AE9C7.map.lz":5..41
