; A player photo: linear 4bpp tiles packed for DecompressHuffman.

DATA8_9897BF:		; a player photo: 6 x 6 linear 4bpp tiles packed for DecompressHuffman, one entry of the photo table
			;   in bank $9D
	db $30,$FB
	db $00,$04,$80
	incbin "DATA8_9897BF.lin.huf":5..601
