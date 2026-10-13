; Bank $99, first 4 KB: DATA8_998000, a player photo, then DATA8_99823D, a player photo, then DATA8_998479, a player
; photo, then DATA8_9986B3, a player photo, then DATA8_9988EC, a player photo, then DATA8_998B25, a player photo, then
; DATA8_998D5D, a player photo, then the start of DATA8_998F93, a player photo.

org $998000
DATA8_998000:		; a player photo: 6 x 6 linear 4bpp tiles packed for DecompressHuffman, one entry of the photo table
			;   in bank $9D
	db $30,$FB
	db $00,$04,$80
	incbin "data/gfx/DATA8_998000.lin.huf":5..573
DATA8_99823D:		; a player photo: 6 x 6 linear 4bpp tiles packed for DecompressHuffman, one entry of the photo table
			;   in bank $9D
	db $30,$FB
	db $00,$04,$80
	incbin "data/gfx/DATA8_99823D.lin.huf":5..572
DATA8_998479:		; a player photo: 6 x 6 linear 4bpp tiles packed for DecompressHuffman, one entry of the photo table
			;   in bank $9D
	db $30,$FB
	db $00,$04,$80
	incbin "data/gfx/DATA8_998479.lin.huf":5..569
	db $00
DATA8_9986B3:		; a player photo: 6 x 6 linear 4bpp tiles packed for DecompressHuffman, one entry of the photo table
			;   in bank $9D
	db $30,$FB
	db $00,$04,$80
	incbin "data/gfx/DATA8_9986B3.lin.huf":5..569
DATA8_9988EC:		; a player photo: 6 x 6 linear 4bpp tiles packed for DecompressHuffman, one entry of the photo table
			;   in bank $9D
	db $30,$FB
	db $00,$04,$80
	incbin "data/gfx/DATA8_9988EC.lin.huf":5..568
	db $00
DATA8_998B25:		; a player photo: 6 x 6 linear 4bpp tiles packed for DecompressHuffman, one entry of the photo table
			;   in bank $9D
	db $30,$FB
	db $00,$04,$80
	incbin "data/gfx/DATA8_998B25.lin.huf":5..568
DATA8_998D5D:		; a player photo: 6 x 6 linear 4bpp tiles packed for DecompressHuffman, one entry of the photo table
			;   in bank $9D
	db $30,$FB
	db $00,$04,$80
	incbin "data/gfx/DATA8_998D5D.lin.huf":5..566
DATA8_998F93:		; a player photo: 6 x 6 linear 4bpp tiles packed for DecompressHuffman, one entry of the photo table
			;   in bank $9D
	db $30,$FB
	db $00,$04,$80
	incbin "data/gfx/DATA8_998F93.lin.huf":5..109
