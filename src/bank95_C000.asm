; Bank $95, fifth 4 KB: the end of DATA8_95BA96, then DATA8_95C376, a block for the sound CPU (upload lists
; DATA8_80E6C1 and DATA8_80E6FD), then the start of DATA8_95CBEA, a block for the sound CPU (upload lists DATA8_80E6C1
; and DATA8_80DD16).

org $95C000
	incbin "data/gfx/DATA8_95BA96.chr.lz":1386..2272
DATA8_95C376:		; for SPCUploadBlock, as DATA8_958000
	db $07,$1A
	db $08,$70
	incbin "data/sound/DATA8_95C376.spc":4..2164
DATA8_95CBEA:		; for SPCUploadBlock, as DATA8_958000
	db $08,$04
	db $08,$04
	incbin "data/sound/DATA8_95CBEA.spc":4..1046
