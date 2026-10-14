; A block for the sound CPU: sound RAM address, length, then the bytes.

DATA8_91F2F9:		; for SPCUploadBlock, as DATA8_918000
	db $0D,$02
	db $0D,$02
	incbin "../../../Extracted/data/sound/DATA8_91F2F9.spc":4..3334
	db $FF
