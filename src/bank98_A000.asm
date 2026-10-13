; Bank $98, third 4 KB: the end of DATA8_989EC9, then DATA8_98A120, a player photo, then DATA8_98A377, a player photo,
; then DATA8_98A5CD, a player photo, then DATA8_98A821, a player photo, then DATA8_98AA74, a player photo, then
; DATA8_98ACC7, a player photo, then the start of DATA8_98AF19, a player photo.

org $98A000
	incbin "data/gfx/DATA8_989EC9.lin.huf":311..599
DATA8_98A120:		; a player photo: 6 x 6 linear 4bpp tiles packed for DecompressHuffman, one entry of the photo table
			;   in bank $9D
	db $30,$FB
	db $00,$04,$80
	incbin "data/gfx/DATA8_98A120.lin.huf":5..599
DATA8_98A377:		; a player photo: 6 x 6 linear 4bpp tiles packed for DecompressHuffman, one entry of the photo table
			;   in bank $9D
	db $30,$FB
	db $00,$04,$80
	incbin "data/gfx/DATA8_98A377.lin.huf":5..598
DATA8_98A5CD:		; a player photo: 6 x 6 linear 4bpp tiles packed for DecompressHuffman, one entry of the photo table
			;   in bank $9D
	db $30,$FB
	db $00,$04,$80
	incbin "data/gfx/DATA8_98A5CD.lin.huf":5..596
DATA8_98A821:		; a player photo: 6 x 6 linear 4bpp tiles packed for DecompressHuffman, one entry of the photo table
			;   in bank $9D
	db $30,$FB
	db $00,$04,$80
	incbin "data/gfx/DATA8_98A821.lin.huf":5..594
	db $00
DATA8_98AA74:		; a player photo: 6 x 6 linear 4bpp tiles packed for DecompressHuffman, one entry of the photo table
			;   in bank $9D
	db $30,$FB
	db $00,$04,$80
	incbin "data/gfx/DATA8_98AA74.lin.huf":5..595
DATA8_98ACC7:		; a player photo: 6 x 6 linear 4bpp tiles packed for DecompressHuffman, one entry of the photo table
			;   in bank $9D
	db $30,$FB
	db $00,$04,$80
	incbin "data/gfx/DATA8_98ACC7.lin.huf":5..594
DATA8_98AF19:		; a player photo: 6 x 6 linear 4bpp tiles packed for DecompressHuffman, one entry of the photo table
			;   in bank $9D
	db $30,$FB
	db $00,$04,$80
	incbin "data/gfx/DATA8_98AF19.lin.huf":5..231
