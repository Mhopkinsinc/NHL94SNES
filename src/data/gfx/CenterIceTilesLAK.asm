; Centre-ice logo tiles: linear 4bpp, packed for DecompressHuffman.

CenterIceTilesLAK:	; the Los Angeles centre ice logo: linear 4bpp tiles packed for DecompressHuffman (team 10 of
			;   the centre ice table in bank $9C)
	db $30,$FB
	db $00,$03,$20
	incbin "CenterIceLAK.lin.huf":5..240
