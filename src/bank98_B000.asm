; Bank $98, fourth 4 KB: the end of DATA8_98AF19, then DATA8_98B16A, a player photo, then DATA8_98B3B9, a player
; photo, then DATA8_98B608, a player photo, then DATA8_98B857, a player photo, then DATA8_98BAA5, a player photo, then
; DATA8_98BCF3, a player photo, then the start of DATA8_98BF41, a player photo.

org $98B000
	incbin "../Extracted/data/DATA8_98AF19.lin.huf":231..593
DATA8_98B16A:		; a player photo: 6 x 6 linear 4bpp tiles packed for DecompressHuffman, one entry of the photo table
			;   in bank $9D
	db $30,$FB
	db $00,$04,$80
	incbin "../Extracted/data/DATA8_98B16A.lin.huf":5..591
DATA8_98B3B9:		; a player photo: 6 x 6 linear 4bpp tiles packed for DecompressHuffman, one entry of the photo table
			;   in bank $9D
	db $30,$FB
	db $00,$04,$80
	incbin "../Extracted/data/DATA8_98B3B9.lin.huf":5..591
DATA8_98B608:		; a player photo: 6 x 6 linear 4bpp tiles packed for DecompressHuffman, one entry of the photo table
			;   in bank $9D
	db $30,$FB
	db $00,$04,$80
	incbin "../Extracted/data/DATA8_98B608.lin.huf":5..591
DATA8_98B857:		; a player photo: 6 x 6 linear 4bpp tiles packed for DecompressHuffman, one entry of the photo table
			;   in bank $9D
	db $30,$FB
	db $00,$04,$80
	incbin "../Extracted/data/DATA8_98B857.lin.huf":5..590
DATA8_98BAA5:		; a player photo: 6 x 6 linear 4bpp tiles packed for DecompressHuffman, one entry of the photo table
			;   in bank $9D
	db $30,$FB
	db $00,$04,$80
	incbin "../Extracted/data/DATA8_98BAA5.lin.huf":5..590
DATA8_98BCF3:		; a player photo: 6 x 6 linear 4bpp tiles packed for DecompressHuffman, one entry of the photo table
			;   in bank $9D
	db $30,$FB
	db $00,$04,$80
	incbin "../Extracted/data/DATA8_98BCF3.lin.huf":5..590
DATA8_98BF41:		; a player photo: 6 x 6 linear 4bpp tiles packed for DecompressHuffman, one entry of the photo table
			;   in bank $9D
	db $30,$FB
	db $00,$04,$80
	incbin "../Extracted/data/DATA8_98BF41.lin.huf":5..191
