; Player photo: Scott Stevens (PlayerPhotoTable NJ 17; ASE 22)

CardScottStevens:		; a player photo: 6 x 6 linear 4bpp tiles packed for DecompressHuffman, one entry of the photo table
			;   in bank $9D
	db $30,$FB
	db $00,$04,$80
	incbin "../../../Extracted/data/gfx/DATA8_98F158.lin.huf":5..577
