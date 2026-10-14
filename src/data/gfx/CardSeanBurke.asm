; Player photo: Sean Burke (PlayerPhotoTable HFD 0)

CardSeanBurke:		; a player photo: 6 x 6 linear 4bpp tiles packed for DecompressHuffman, one entry of the photo table
			;   in bank $9D
	db $30,$FB
	db $00,$04,$80
	incbin "../../../Extracted/data/gfx/DATA8_98DD01.lin.huf":5..581
