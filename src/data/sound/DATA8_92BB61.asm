; A block for the sound CPU: sound RAM address, length, then the bytes.

DATA8_92BB61:		; for SPCUploadBlock, as DATA8_928000
	db $13,$68
	db $13,$68
	incbin "../../../Extracted/data/sound/DATA8_92BB61.spc":4..4972
