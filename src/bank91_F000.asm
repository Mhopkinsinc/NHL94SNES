; Bank $91, last 4 KB: the end of DATA8_91DDAD, then a block for the sound CPU from the upload list DATA8_80DD16 in
; bank80_D000, and the last byte of the bank.

org $91F000
	incbin "data/gfx/DATA8_91DDAD.chr.lz":4691..5452
DATA8_91F2F9:		; for SPCUploadBlock, as DATA8_918000
	db $0D,$02
	db $0D,$02
	incbin "data/sound/DATA8_91F2F9.spc":4..3334
	db $FF
