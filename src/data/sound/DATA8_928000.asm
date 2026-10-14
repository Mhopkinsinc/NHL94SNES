; A block for the sound CPU: sound RAM address, length, then the bytes.

DATA8_928000:		; for SPCUploadBlock: sound RAM address, length (big-endian words), then the bytes
	db $00,$12
	db $13,$EF
	incbin "../../../Extracted/data/sound/DATA8_928000.spc":4..5107
