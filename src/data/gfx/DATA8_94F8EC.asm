; Graphics.

DATA8_94F8EC:		; a sprite set packed for DecompressHuffman: two frames, large E and A letters (the EA logo, by its look)
	db $30,$FB
	db $00,$0D,$D0
	incbin "../../../Extracted/data/gfx/DATA8_94F8EC.spr.huf":5..1805
	db $FF,$FF,$FF,$FF,$FF,$FF,$FF
