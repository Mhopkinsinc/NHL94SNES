; A block for the sound CPU: sound RAM address, length, then the bytes.

DATA8_959490:		; for SPCUploadBlock, as DATA8_958000
	db $09,$B4
	db $09,$B4
	incbin "../../../Extracted/data/sound/DATA8_959490.spc":4..2488
