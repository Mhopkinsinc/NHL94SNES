; Graphics.

DATA8_9AEA15:		; a 7 x 7 map packed for DecompressLZ (width, height, , then the map words)
			;   read by a screen setup in bank $9D; not identified yet
	db $10,$FB
	db $00,$00,$68
	incbin "../../../Extracted/data/gfx/DATA8_9AEA15.map.lz":5..37
