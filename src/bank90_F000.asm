; Bank $90, last 4 KB: the end of DATA8_90E08C (see bank90_E000), from Extracted/data/DATA8_90E08C.spc, then a player
; photo from Extracted/data/DATA8_90FDE2.lin.huf and the last byte of the bank.

org $90F000
	incbin "../Extracted/data/DATA8_90E08C.spc":3956..7510
DATA8_90FDE2:		; a player photo: 6 x 6 linear 4bpp tiles packed for DecompressHuffman, one entry of the photo table
			;   in bank $9D
	db $30,$FB
	db $00,$04,$80
	incbin "../Extracted/data/DATA8_90FDE2.lin.huf":5..541
	db $00
