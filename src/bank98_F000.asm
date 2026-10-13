; Bank $98, last 4 KB: the end of DATA8_98EF17, then DATA8_98F158, a player photo, then DATA8_98F399, a player photo,
; then DATA8_98F5D7, a player photo, then DATA8_98F814, a player photo, then DATA8_98FA51, a player photo, then
; DATA8_98FC8E, a player photo, then CenterIceTilesNYI, the New York Islanders centre ice logo tiles, then the last
; bytes of the bank.

org $98F000
	incbin "data/gfx/DATA8_98EF17.lin.huf":233..577
DATA8_98F158:		; a player photo: 6 x 6 linear 4bpp tiles packed for DecompressHuffman, one entry of the photo table
			;   in bank $9D
	db $30,$FB
	db $00,$04,$80
	incbin "data/gfx/DATA8_98F158.lin.huf":5..577
DATA8_98F399:		; a player photo: 6 x 6 linear 4bpp tiles packed for DecompressHuffman, one entry of the photo table
			;   in bank $9D
	db $30,$FB
	db $00,$04,$80
	incbin "data/gfx/DATA8_98F399.lin.huf":5..574
DATA8_98F5D7:		; a player photo: 6 x 6 linear 4bpp tiles packed for DecompressHuffman, one entry of the photo table
			;   in bank $9D
	db $30,$FB
	db $00,$04,$80
	incbin "data/gfx/DATA8_98F5D7.lin.huf":5..572
	db $00
DATA8_98F814:		; a player photo: 6 x 6 linear 4bpp tiles packed for DecompressHuffman, one entry of the photo table
			;   in bank $9D
	db $30,$FB
	db $00,$04,$80
	incbin "data/gfx/DATA8_98F814.lin.huf":5..573
DATA8_98FA51:		; a player photo: 6 x 6 linear 4bpp tiles packed for DecompressHuffman, one entry of the photo table
			;   in bank $9D
	db $30,$FB
	db $00,$04,$80
	incbin "data/gfx/DATA8_98FA51.lin.huf":5..573
DATA8_98FC8E:		; a player photo: 6 x 6 linear 4bpp tiles packed for DecompressHuffman, one entry of the photo table
			;   in bank $9D
	db $30,$FB
	db $00,$04,$80
	incbin "data/gfx/DATA8_98FC8E.lin.huf":5..573
CenterIceTilesNYI:	; the New York Islanders centre ice logo: linear 4bpp tiles packed for DecompressHuffman (team 13
			;   of the centre ice table in bank $9C)
	db $30,$FB
	db $00,$03,$A0
	incbin "data/gfx/CenterIceNYI.lin.huf":5..305
	db $FF,$FF,$FF,$FF
