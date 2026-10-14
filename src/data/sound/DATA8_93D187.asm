; A block for the sound CPU: sound RAM address, length, then the bytes.

DATA8_93D187:		; for SPCUploadBlock, as DATA8_9390FA
	db $0E,$22
	db $0E,$22
	incbin "../../../Extracted/data/sound/DATA8_93D187.spc":4..3622
