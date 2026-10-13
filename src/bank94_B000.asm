; Bank $94, fourth 4 KB: the end of DATA8_94A662, then DATA8_94B287, a block for the sound CPU (upload list
; DATA8_80DD16), then the start of DATA8_94BEAC, a block for the sound CPU (upload list DATA8_80E6FD).

org $94B000
	incbin "data/sound/DATA8_94A662.spc":2462..3109
DATA8_94B287:		; for SPCUploadBlock, as DATA8_948D6F
	db $0C,$21
	db $0C,$21
	incbin "data/sound/DATA8_94B287.spc":4..3109
DATA8_94BEAC:		; for SPCUploadBlock, as DATA8_948D6F
	db $0C,$0F
	db $0C,$0F
	incbin "data/sound/DATA8_94BEAC.spc":4..340
