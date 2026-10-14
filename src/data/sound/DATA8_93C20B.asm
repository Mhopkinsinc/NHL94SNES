; A block for the sound CPU: sound RAM address, length, then the bytes.

DATA8_93C20B:		; for SPCUploadBlock, as DATA8_9390FA
	db $0F,$78
	db $0F,$78
	incbin "../../../Extracted/data/sound/DATA8_93C20B.spc":4..3964
