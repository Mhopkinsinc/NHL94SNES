; A block for the sound CPU: sound RAM address, length, then the bytes.

DATA8_95CBEA:		; for SPCUploadBlock, as DATA8_958000
	db $08,$04
	db $08,$04
	incbin "../../../Extracted/data/sound/DATA8_95CBEA.spc":4..2056
