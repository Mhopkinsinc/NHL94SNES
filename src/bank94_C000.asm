; Bank $94, fifth 4 KB: the end of DATA8_94BEAC, then the start of DATA8_94CABF, a block for the sound CPU (upload
; list DATA8_80DD16).

org $94C000
	incbin "data/sound/DATA8_94BEAC.spc":340..3091
DATA8_94CABF:		; for SPCUploadBlock, as DATA8_948D6F
	db $0B,$E2
	db $0B,$E2
	incbin "data/sound/DATA8_94CABF.spc":4..1345
