; A block for the sound CPU: sound RAM address, length, then the bytes.

DATA8_95B15C:		; for SPCUploadBlock, as DATA8_958000
	db $09,$36
	db $09,$36
	incbin "../../../Extracted/data/sound/DATA8_95B15C.spc":4..2362
