; Bank $92, seventh 4 KB: the end of DATA8_92CECD, then the start of IceRinkMap, the packed rink map.

org $92E000
	incbin "data/sound/DATA8_92CECD.spc":4403..4486
IceRinkMap:		; the rink map packed for DecompressLZ: three words (width, height, ...), then the map words
			;   for IceRinkTiles
	db $10,$FB
	db $00,$2A,$66
	incbin "data/gfx/IceRink.map.lz":5..4013
