; A block for the sound CPU: sound RAM address, length, then the bytes.

DATA8_93A18D:		; for SPCUploadBlock, as DATA8_9390FA
	db $10,$86
	db $10,$86
	incbin "../../../Extracted/data/sound/DATA8_93A18D.spc":4..4234
