; A block for the sound CPU: sound RAM address, length, then the bytes.

DATA8_95D3F2:		; for SPCUploadBlock, as DATA8_958000
	db $07,$98
	db $07,$98
	incbin "../../../Extracted/data/sound/DATA8_95D3F2.spc":4..1948
