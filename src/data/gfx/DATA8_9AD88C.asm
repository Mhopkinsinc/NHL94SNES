; Graphics.

DATA8_9AD88C:		; a 32 x 28 map packed for DecompressHuffman (width, height, , then the map words), read
			;   by a screen setup in bank $9D; not identified yet
	db $30,$FB
	db $00,$07,$06
	incbin "../../../Extracted/data/gfx/DATA8_9AD88C.map.huf":5..229
	db $00
