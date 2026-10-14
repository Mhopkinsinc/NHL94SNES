; A block for the sound CPU: sound RAM address, length, then the bytes.

DATA8_94BEAC:		; for SPCUploadBlock, as DATA8_948D6F
	db $0C,$0F
	db $0C,$0F
	incbin "../../../Extracted/data/sound/DATA8_94BEAC.spc":4..3091
