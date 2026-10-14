; Player photo: Owen Nolan (PlayerPhotoTable QUE 12)

CardOwenNolan:		; a player photo: 6 x 6 linear 4bpp tiles packed for DecompressHuffman, one entry of the photo table
			;   in bank $9D
	db $30,$FB
	db $00,$04,$80
	incbin "../../../Extracted/data/gfx/DATA8_9A801F.lin.huf":5..517
	db $00
