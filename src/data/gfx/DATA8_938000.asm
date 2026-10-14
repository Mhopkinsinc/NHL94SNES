; Graphics.

DATA8_938000:		; background tiles packed for DecompressHuffman, unpacked by a screen setup; the screen is not
			;   identified yet
	db $30,$FB
	db $00,$18,$80
	incbin "../../../Extracted/data/gfx/DATA8_938000.chr.huf":5..4346
