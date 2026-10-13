; A player photo: linear 4bpp tiles packed for DecompressHuffman.

DATA8_98F5D7:		; a player photo: 6 x 6 linear 4bpp tiles packed for DecompressHuffman, one entry of the photo table
			;   in bank $9D
	db $30,$FB
	db $00,$04,$80
	incbin "DATA8_98F5D7.lin.huf":5..572
	db $00
