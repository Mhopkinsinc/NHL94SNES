; Player photo: Mike Vernon (PlayerPhotoTable CGY 0)

CardMikeVernon:		; a player photo: 6 x 6 linear 4bpp tiles packed for DecompressHuffman, one entry of the photo table
			;   in bank $9D
	db $30,$FB
	db $00,$04,$80
	incbin "../../../Extracted/data/gfx/DATA8_97BA0D.lin.huf":5..639
