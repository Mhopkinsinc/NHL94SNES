; Bank $98, first 4 KB: DATA8_988000, a player photo, then DATA8_988264, a player photo, then DATA8_9884C8, a player
; photo, then DATA8_98872C, a player photo, then DATA8_98898F, a player photo, then DATA8_988BF0, a player photo, then
; the start of DATA8_988E50, a player photo.

org $988000
DATA8_988000:		; a player photo: 6 x 6 linear 4bpp tiles packed for DecompressHuffman, one entry of the photo table
			;   in bank $9D
	db $30,$FB
	db $00,$04,$80
	incbin "data/gfx/DATA8_988000.lin.huf":5..612
DATA8_988264:		; a player photo: 6 x 6 linear 4bpp tiles packed for DecompressHuffman, one entry of the photo table
			;   in bank $9D
	db $30,$FB
	db $00,$04,$80
	incbin "data/gfx/DATA8_988264.lin.huf":5..612
DATA8_9884C8:		; a player photo: 6 x 6 linear 4bpp tiles packed for DecompressHuffman, one entry of the photo table
			;   in bank $9D
	db $30,$FB
	db $00,$04,$80
	incbin "data/gfx/DATA8_9884C8.lin.huf":5..611
	db $00
DATA8_98872C:		; a player photo: 6 x 6 linear 4bpp tiles packed for DecompressHuffman, one entry of the photo table
			;   in bank $9D
	db $30,$FB
	db $00,$04,$80
	incbin "data/gfx/DATA8_98872C.lin.huf":5..611
DATA8_98898F:		; a player photo: 6 x 6 linear 4bpp tiles packed for DecompressHuffman, one entry of the photo table
			;   in bank $9D
	db $30,$FB
	db $00,$04,$80
	incbin "data/gfx/DATA8_98898F.lin.huf":5..609
DATA8_988BF0:		; a player photo: 6 x 6 linear 4bpp tiles packed for DecompressHuffman, one entry of the photo table
			;   in bank $9D
	db $30,$FB
	db $00,$04,$80
	incbin "data/gfx/DATA8_988BF0.lin.huf":5..608
DATA8_988E50:		; a player photo: 6 x 6 linear 4bpp tiles packed for DecompressHuffman, one entry of the photo table
			;   in bank $9D
	db $30,$FB
	db $00,$04,$80
	incbin "data/gfx/DATA8_988E50.lin.huf":5..432
