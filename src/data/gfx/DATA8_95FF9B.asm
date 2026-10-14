; Graphics.

DATA8_95FF9B:		; a map packed for DecompressHuffman: width 6, height 13 and a word, then the map words; read
	db $30,$FB
	db $00,$00,$A2
	incbin "../../../Extracted/data/gfx/DATA8_95FF9B.map.huf":5..101
