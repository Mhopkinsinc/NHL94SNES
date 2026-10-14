; Graphics.

DATA8_9ADC8D:		; a 128 x 128 map of bytes (width, height, , then a byte per entry) packed for
			;   DecompressHuffman, copied to VRAM by a routine in bank $9F; not identified yet
	db $30,$FB
	db $00,$40,$06
	incbin "../../../Extracted/data/gfx/DATA8_9ADC8D.map.huf":5..166
