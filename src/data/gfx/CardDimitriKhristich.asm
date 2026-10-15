; Player photo: Dimitri Khristich (PlayerPhotoTable WSH 3)

CardDimitriKhristich:		; a player photo: 6 x 6 linear 4bpp tiles packed for DecompressHuffman, one entry of the photo table
			;   in bank $9D
	db $30,$FB
	db $00,$04,$80
	incbin "../../../Extracted/data/gfx/CardDimitriKhristich.lin.huf":5..608
