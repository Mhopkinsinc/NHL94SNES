; Bank $99, last 4 KB: the end of DATA8_99EE68, then DATA8_99F079, a player photo, then DATA8_99F289, a player photo,
; then DATA8_99F498, a player photo, then DATA8_99F6A3, a player photo, then DATA8_99F8AC, a player photo, then
; DATA8_99FAB4, a player photo, then DATA8_99FCBA, a player photo, then CenterIceTilesOTT, the Ottawa centre ice logo
; tiles, then the last bytes of the bank.

org $99F000
	incbin "data/gfx/DATA8_99EE68.lin.huf":408..529
DATA8_99F079:		; a player photo: 6 x 6 linear 4bpp tiles packed for DecompressHuffman, one entry of the photo table
			;   in bank $9D
	db $30,$FB
	db $00,$04,$80
	incbin "data/gfx/DATA8_99F079.lin.huf":5..528
DATA8_99F289:		; a player photo: 6 x 6 linear 4bpp tiles packed for DecompressHuffman, one entry of the photo table
			;   in bank $9D
	db $30,$FB
	db $00,$04,$80
	incbin "data/gfx/DATA8_99F289.lin.huf":5..527
DATA8_99F498:		; a player photo: 6 x 6 linear 4bpp tiles packed for DecompressHuffman, one entry of the photo table
			;   in bank $9D
	db $30,$FB
	db $00,$04,$80
	incbin "data/gfx/DATA8_99F498.lin.huf":5..523
DATA8_99F6A3:		; a player photo: 6 x 6 linear 4bpp tiles packed for DecompressHuffman, one entry of the photo table
			;   in bank $9D
	db $30,$FB
	db $00,$04,$80
	incbin "data/gfx/DATA8_99F6A3.lin.huf":5..521
DATA8_99F8AC:		; a player photo: 6 x 6 linear 4bpp tiles packed for DecompressHuffman, one entry of the photo table
			;   in bank $9D
	db $30,$FB
	db $00,$04,$80
	incbin "data/gfx/DATA8_99F8AC.lin.huf":5..520
DATA8_99FAB4:		; a player photo: 6 x 6 linear 4bpp tiles packed for DecompressHuffman, one entry of the photo table
			;   in bank $9D
	db $30,$FB
	db $00,$04,$80
	incbin "data/gfx/DATA8_99FAB4.lin.huf":5..518
DATA8_99FCBA:		; a player photo: 6 x 6 linear 4bpp tiles packed for DecompressHuffman, one entry of the photo table
			;   in bank $9D
	db $30,$FB
	db $00,$04,$80
	incbin "data/gfx/DATA8_99FCBA.lin.huf":5..518
CenterIceTilesOTT:	; the Ottawa centre ice logo: linear 4bpp tiles packed for DecompressHuffman (team 15 of the
			;   centre ice table in bank $9C)
	db $30,$FB
	db $00,$03,$20
	incbin "data/gfx/CenterIceOTT.lin.huf":5..314
	db $FF,$FF,$FF,$FF,$FF,$FF
