; Graphics.

IceRinkMap:		; the rink map packed for DecompressLZ: three words (width, height, ...), then the map words
			;   for IceRinkTiles
	db $10,$FB
	db $00,$2A,$66
	incbin "IceRink.map.lz":5..4407
