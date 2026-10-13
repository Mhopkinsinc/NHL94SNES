; A player photo: linear 4bpp tiles packed for DecompressHuffman.

DATA8_8FFE74:		; a player photo: 6 x 6 linear 4bpp tiles packed for DecompressHuffman; the photo table points
			;   here for most players without a photo of their own
	db $30,$FB
	db $00,$04,$80
	incbin "DATA8_8FFE74.lin.huf":5..379
	db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
