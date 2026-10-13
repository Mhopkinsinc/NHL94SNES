; Bank $94, last 4 KB: the end of DATA8_94ED96, then DATA8_94F8EC, a packed sprite set of large E and A letters.

org $94F000
	incbin "data/sound/DATA8_94ED96.spc":618..2902
DATA8_94F8EC:		; a sprite set packed for DecompressHuffman: two frames, large E and A letters (the EA logo, by its look)
	db $30,$FB
	db $00,$0D,$D0
	incbin "data/gfx/DATA8_94F8EC.spr.huf":5..1805
	db $FF,$FF,$FF,$FF,$FF,$FF,$FF
