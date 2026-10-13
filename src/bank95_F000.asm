; Bank $95, last 4 KB: the end of DATA8_95EA63, then DATA8_95F1AE, LZ-packed tiles, then DATA8_95F8C6, an LZ-packed
; block, then DATA8_95FF9B, a packed 6 x 13 map.

org $95F000
	incbin "../Extracted/data/DATA8_95EA63.spc":1437..1867
DATA8_95F1AE:		; tiles packed for DecompressLZ that screen setups in bank $9D send to VRAM; not identified yet
	db $10,$FB
	db $00,$0D,$00
	incbin "../Extracted/data/DATA8_95F1AE.chr.lz":5..1816
DATA8_95F8C6:		; packed for DecompressLZ, read by a screen setup in bank $9D; not identified yet
	db $10,$FB
	db $00,$24,$40
	incbin "../Extracted/data/DATA8_95F8C6.lz":5..1749
DATA8_95FF9B:		; a map packed for DecompressHuffman: width 6, height 13 and a word, then the map words; read in bank $9D
	db $30,$FB
	db $00,$00,$A2
	incbin "../Extracted/data/DATA8_95FF9B.map.huf":5..101
