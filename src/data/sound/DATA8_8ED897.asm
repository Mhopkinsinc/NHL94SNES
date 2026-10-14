; A block for the sound CPU: sound RAM address, length, then the bytes.

DATA8_8ED897:		; for SPCUploadBlock: sound RAM address, length (big-endian words), then the bytes
	db $15,$45
	db $24,$90
	incbin "../../../Extracted/data/sound/DATA8_8ED897.spc":4..9364
