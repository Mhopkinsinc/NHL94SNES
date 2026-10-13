; Centre-ice logo tiles: linear 4bpp, packed for DecompressHuffman.

CenterIceTilesANA:	; the Anaheim centre ice logo: linear 4bpp tiles packed for DecompressHuffman (team 0 of
			;   the centre ice table in bank $9C)
	db $30,$FB
	db $00,$03,$60
	incbin "CenterIceANA.lin.huf":5..405
