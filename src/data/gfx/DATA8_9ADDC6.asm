; Graphics.

DATA8_9ADDC6:		; a 32 x 28 map packed for DecompressHuffman (width, height, , then the map words), read
			;   by a screen setup in bank $9D; not identified yet
	db $30,$FB
	db $00,$07,$06
	incbin "DATA8_9ADDC6.map.huf":5..145
