; Graphics.

DATA8_9ADFCB:		; an 18 x 3 map packed for DecompressHuffman (width, height, , then the map words)
			;   read in bank $9B; not identified yet
	db $30,$FB
	db $00,$00,$72
	incbin "DATA8_9ADFCB.map.huf":5..92
