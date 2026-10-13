; Bank $93, first 4 KB: the start of DATA8_938000, Huffman-packed background tiles of a screen not identified yet.

org $938000
DATA8_938000:		; background tiles packed for DecompressHuffman, unpacked by a screen setup in bank $9D; the screen is not
			;   identified yet
	db $30,$FB
	db $00,$18,$80
	incbin "../Extracted/data/DATA8_938000.chr.huf":5..4096
