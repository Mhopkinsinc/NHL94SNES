; A block for the sound CPU: sound RAM address, length, then the bytes.

DATA8_92CECD:		; for SPCUploadBlock, as DATA8_928000
	db $00,$3F
	db $11,$82
	incbin "../../../Extracted/data/sound/DATA8_92CECD.spc":4..4486
