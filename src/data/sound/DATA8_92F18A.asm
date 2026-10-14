; A block for the sound CPU: sound RAM address, length, then the bytes.

DATA8_92F18A:		; for SPCUploadBlock, as DATA8_928000
	db $0E,$22
	db $0E,$22
	incbin "../../../Extracted/data/sound/DATA8_92F18A.spc":4..3622
