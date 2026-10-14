; Graphics.

DATA8_91B188:		; a sprite set packed for DecompressHuffman: the N, H and L letters in three steps each, the NHL
			;   shield, the NHLPA logo and the licence line of an opening screen
	db $30,$FB
	db $00,$29,$AF
	incbin "../../../Extracted/data/gfx/DATA8_91B188.spr.huf":5..5662
	db $00
