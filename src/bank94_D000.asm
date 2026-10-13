; Bank $94, sixth 4 KB: the end of DATA8_94CABF, then the start of DATA8_94D6A5, Huffman-packed background tiles.

org $94D000
	incbin "../Extracted/data/DATA8_94CABF.spc":1345..3046
DATA8_94D6A5:		; background tiles packed for DecompressHuffman, unpacked by a screen setup in bank $9D
	db $30,$FB
	db $00,$12,$80
	incbin "../Extracted/data/DATA8_94D6A5.chr.huf":5..2395
