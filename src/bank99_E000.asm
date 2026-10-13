; Bank $99, seventh 4 KB: the end of DATA8_99DFCF, then DATA8_99E1E8, a player photo, then DATA8_99E401, a player
; photo, then DATA8_99E619, a player photo, then DATA8_99E831, a player photo, then DATA8_99EA44, a player photo, then
; DATA8_99EC56, a player photo, then the start of DATA8_99EE68, a player photo.

org $99E000
	incbin "data/gfx/DATA8_99DFCF.lin.huf":49..537
DATA8_99E1E8:		; a player photo: 6 x 6 linear 4bpp tiles packed for DecompressHuffman, one entry of the photo table
			;   in bank $9D
	db $30,$FB
	db $00,$04,$80
	incbin "data/gfx/DATA8_99E1E8.lin.huf":5..536
	db $00
DATA8_99E401:		; a player photo: 6 x 6 linear 4bpp tiles packed for DecompressHuffman, one entry of the photo table
			;   in bank $9D
	db $30,$FB
	db $00,$04,$80
	incbin "data/gfx/DATA8_99E401.lin.huf":5..536
DATA8_99E619:		; a player photo: 6 x 6 linear 4bpp tiles packed for DecompressHuffman, one entry of the photo table
			;   in bank $9D
	db $30,$FB
	db $00,$04,$80
	incbin "data/gfx/DATA8_99E619.lin.huf":5..536
DATA8_99E831:		; a player photo: 6 x 6 linear 4bpp tiles packed for DecompressHuffman, one entry of the photo table
			;   in bank $9D
	db $30,$FB
	db $00,$04,$80
	incbin "data/gfx/DATA8_99E831.lin.huf":5..531
DATA8_99EA44:		; a player photo: 6 x 6 linear 4bpp tiles packed for DecompressHuffman, one entry of the photo table
			;   in bank $9D
	db $30,$FB
	db $00,$04,$80
	incbin "data/gfx/DATA8_99EA44.lin.huf":5..529
	db $00
DATA8_99EC56:		; a player photo: 6 x 6 linear 4bpp tiles packed for DecompressHuffman, one entry of the photo table
			;   in bank $9D
	db $30,$FB
	db $00,$04,$80
	incbin "data/gfx/DATA8_99EC56.lin.huf":5..530
DATA8_99EE68:		; a player photo: 6 x 6 linear 4bpp tiles packed for DecompressHuffman, one entry of the photo table
			;   in bank $9D
	db $30,$FB
	db $00,$04,$80
	incbin "data/gfx/DATA8_99EE68.lin.huf":5..408
