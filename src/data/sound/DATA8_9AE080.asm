; A block for the sound CPU: sound RAM address, length, then the bytes.

DATA8_9AE080:		; for SPCUploadBlock, as DATA8_9A8000
	db $00,$51
	db $00,$51
	incbin "../../../Extracted/data/sound/DATA8_9AE080.spc":4..85
