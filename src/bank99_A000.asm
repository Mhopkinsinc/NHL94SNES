; Bank $99, third 4 KB: the end of DATA8_999F04, then DATA8_99A138, a player photo, then DATA8_99A36C, a player photo,
; then DATA8_99A5A0, a player photo, then DATA8_99A7D3, a player photo, then DATA8_99AA05, a player photo, then
; DATA8_99AC36, a player photo, then the start of DATA8_99AE67, a player photo.

org $99A000
	incbin "../Extracted/data/DATA8_999F04.lin.huf":252..564
DATA8_99A138:		; a player photo: 6 x 6 linear 4bpp tiles packed for DecompressHuffman, one entry of the photo table
			;   in bank $9D
	db $30,$FB
	db $00,$04,$80
	incbin "../Extracted/data/DATA8_99A138.lin.huf":5..564
DATA8_99A36C:		; a player photo: 6 x 6 linear 4bpp tiles packed for DecompressHuffman, one entry of the photo table
			;   in bank $9D
	db $30,$FB
	db $00,$04,$80
	incbin "../Extracted/data/DATA8_99A36C.lin.huf":5..564
DATA8_99A5A0:		; a player photo: 6 x 6 linear 4bpp tiles packed for DecompressHuffman, one entry of the photo table
			;   in bank $9D
	db $30,$FB
	db $00,$04,$80
	incbin "../Extracted/data/DATA8_99A5A0.lin.huf":5..563
DATA8_99A7D3:		; a player photo: 6 x 6 linear 4bpp tiles packed for DecompressHuffman, one entry of the photo table
			;   in bank $9D
	db $30,$FB
	db $00,$04,$80
	incbin "../Extracted/data/DATA8_99A7D3.lin.huf":5..562
DATA8_99AA05:		; a player photo: 6 x 6 linear 4bpp tiles packed for DecompressHuffman, one entry of the photo table
			;   in bank $9D
	db $30,$FB
	db $00,$04,$80
	incbin "../Extracted/data/DATA8_99AA05.lin.huf":5..561
DATA8_99AC36:		; a player photo: 6 x 6 linear 4bpp tiles packed for DecompressHuffman, one entry of the photo table
			;   in bank $9D
	db $30,$FB
	db $00,$04,$80
	incbin "../Extracted/data/DATA8_99AC36.lin.huf":5..561
DATA8_99AE67:		; a player photo: 6 x 6 linear 4bpp tiles packed for DecompressHuffman, one entry of the photo table
			;   in bank $9D
	db $30,$FB
	db $00,$04,$80
	incbin "../Extracted/data/DATA8_99AE67.lin.huf":5..409
