; Bank $93, sixth 4 KB: the end of DATA8_93C20B, then DATA8_93D187, a block for the sound CPU, then the start of
; DATA8_93DFAD, a block for the sound CPU (upload list DATA8_80E6FD).

org $93D000
	incbin "data/sound/DATA8_93C20B.spc":3573..3964
DATA8_93D187:		; for SPCUploadBlock, as DATA8_9390FA
	db $0E,$22
	db $0E,$22
	incbin "data/sound/DATA8_93D187.spc":4..3622
DATA8_93DFAD:		; for SPCUploadBlock, as DATA8_9390FA
	db $03,$60
	db $0D,$80
	incbin "data/sound/DATA8_93DFAD.spc":4..83
