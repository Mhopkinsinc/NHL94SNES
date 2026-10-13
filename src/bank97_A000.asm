; Bank $97, third 4 KB: the end of DATA8_979E57, then DATA8_97A0E8, a player photo, then DATA8_97A374, a player photo,
; then DATA8_97A600, a player photo, then DATA8_97A887, a player photo, then DATA8_97AB0A, a player photo, then the
; start of DATA8_97AD8B, a player photo.

org $97A000
	incbin "../Extracted/data/DATA8_979E57.lin.huf":425..657
DATA8_97A0E8:		; a player photo: 6 x 6 linear 4bpp tiles packed for DecompressHuffman, one entry of the photo table
			;   in bank $9D
	db $30,$FB
	db $00,$04,$80
	incbin "../Extracted/data/DATA8_97A0E8.lin.huf":5..652
DATA8_97A374:		; a player photo: 6 x 6 linear 4bpp tiles packed for DecompressHuffman, one entry of the photo table
			;   in bank $9D
	db $30,$FB
	db $00,$04,$80
	incbin "../Extracted/data/DATA8_97A374.lin.huf":5..652
DATA8_97A600:		; a player photo: 6 x 6 linear 4bpp tiles packed for DecompressHuffman, one entry of the photo table
			;   in bank $9D
	db $30,$FB
	db $00,$04,$80
	incbin "../Extracted/data/DATA8_97A600.lin.huf":5..647
DATA8_97A887:		; a player photo: 6 x 6 linear 4bpp tiles packed for DecompressHuffman, one entry of the photo table
			;   in bank $9D
	db $30,$FB
	db $00,$04,$80
	incbin "../Extracted/data/DATA8_97A887.lin.huf":5..643
DATA8_97AB0A:		; a player photo: 6 x 6 linear 4bpp tiles packed for DecompressHuffman, one entry of the photo table
			;   in bank $9D
	db $30,$FB
	db $00,$04,$80
	incbin "../Extracted/data/DATA8_97AB0A.lin.huf":5..641
DATA8_97AD8B:		; a player photo: 6 x 6 linear 4bpp tiles packed for DecompressHuffman, one entry of the photo table
			;   in bank $9D
	db $30,$FB
	db $00,$04,$80
	incbin "../Extracted/data/DATA8_97AD8B.lin.huf":5..629
