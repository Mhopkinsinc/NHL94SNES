; Bank $93, fifth 4 KB: the end of DATA8_93B217, then the start of DATA8_93C20B, a block for the sound CPU (upload
; list DATA8_80DD16).

org $93C000
	incbin "data/gfx/DATA8_93B217.lin.pairs":3561..4084
DATA8_93C20B:		; for SPCUploadBlock, as DATA8_9390FA
	db $0F,$78
	db $0F,$78
	incbin "data/sound/DATA8_93C20B.spc":4..3573
