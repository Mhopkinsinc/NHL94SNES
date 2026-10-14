; A block for the sound CPU: sound RAM address, length, then the bytes.

DATA8_95C376:		; for SPCUploadBlock, as DATA8_958000
	db $07,$1A
	db $08,$70
	incbin "../../../Extracted/data/sound/DATA8_95C376.spc":4..2164
