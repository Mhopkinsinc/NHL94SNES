; Bank $93, third 4 KB: the end of DATA8_9390FA, then the start of DATA8_93A18D, a block for the sound CPU (a long
; pointer list in bank $9C).

org $93A000
	incbin "data/sound/DATA8_9390FA.spc":3846..4243
DATA8_93A18D:		; for SPCUploadBlock, as DATA8_9390FA
	db $10,$86
	db $10,$86
	incbin "data/sound/DATA8_93A18D.spc":4..3699
