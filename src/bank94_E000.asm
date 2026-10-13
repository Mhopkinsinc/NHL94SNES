; Bank $94, seventh 4 KB: the end of DATA8_94D6A5, then DATA8_94E225, a block for the sound CPU (upload list
; DATA8_80DD16), then the start of DATA8_94ED96, a block for the sound CPU (upload list DATA8_80DD16).

org $94E000
	incbin "../Extracted/data/DATA8_94D6A5.chr.huf":2395..2944
DATA8_94E225:		; for SPCUploadBlock, as DATA8_948D6F
	db $0B,$6D
	db $0B,$6D
	incbin "../Extracted/data/DATA8_94E225.spc":4..2929
DATA8_94ED96:		; for SPCUploadBlock, as DATA8_948D6F
	db $0B,$52
	db $0B,$52
	incbin "../Extracted/data/DATA8_94ED96.spc":4..618
