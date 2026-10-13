; Graphics.

DATA8_96C61F:		; a 32 x 32 map packed for DecompressLZ (width, height, , then the map words), read by a screen
			;   setup in bank $9D; not identified yet
	db $10,$FB
	db $00,$08,$06
	incbin "DATA8_96C61F.map.lz":5..943
