; Bank $91, fourth 4 KB: the end of DATA8_9199D2, then a packed sprite set of an opening screen.

org $91B000
	incbin "data/sound/DATA8_9199D2.spc":5678..6070
DATA8_91B188:		; a sprite set packed for DecompressHuffman: the N, H and L letters in three steps each, the NHL
			;   shield, the NHLPA logo and the licence line of an opening screen
	db $30,$FB
	db $00,$29,$AF
	incbin "data/gfx/DATA8_91B188.spr.huf":5..3704
