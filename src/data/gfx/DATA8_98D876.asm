; A player photo: linear 4bpp tiles packed for DecompressHuffman.

DATA8_98D876:		; a player photo: 6 x 6 linear 4bpp tiles packed for DecompressHuffman, one entry of the photo table
			;   in bank $9D
	db $30,$FB
	db $00,$04,$80
	incbin "DATA8_98D876.lin.huf":5..582
