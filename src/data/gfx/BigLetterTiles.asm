; The big letter tiles (50, linear 4bpp, A-Z and marks) RenderBigText draws team names with: the player select and playoff screens unpack them

BigLetterTiles:		; packed for DecompressHuffman, unpacked into a RAM buffer by screen setups; not identified yet
	db $30,$FB
	db $00,$06,$40
	incbin "../../../Extracted/data/gfx/DATA8_9AB610.huf":5..401
