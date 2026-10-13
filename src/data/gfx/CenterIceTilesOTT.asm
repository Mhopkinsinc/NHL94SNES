; Centre-ice logo tiles: linear 4bpp, packed for DecompressHuffman.

CenterIceTilesOTT:	; the Ottawa centre ice logo: linear 4bpp tiles packed for DecompressHuffman (team 15 of the
			;   centre ice table in bank $9C)
	db $30,$FB
	db $00,$03,$20
	incbin "CenterIceOTT.lin.huf":5..314
	db $FF,$FF,$FF,$FF,$FF,$FF
