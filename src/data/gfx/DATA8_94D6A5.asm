; Graphics.

DATA8_94D6A5:		; background tiles packed for DecompressHuffman, unpacked by a screen setup
	db $30,$FB
	db $00,$12,$80
	incbin "DATA8_94D6A5.chr.huf":5..2944
