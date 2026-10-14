; A block for the sound CPU: sound RAM address, length, then the bytes.

DATA8_95EA63:		; for SPCUploadBlock, as DATA8_958000
	db $07,$47
	db $07,$47
	incbin "../../../Extracted/data/sound/DATA8_95EA63.spc":4..1867
