; A block for the sound CPU: sound RAM address, length, then the bytes.

DATA8_94ED96:		; for SPCUploadBlock, as DATA8_948D6F
	db $0B,$52
	db $0B,$52
	incbin "../../../Extracted/data/sound/DATA8_94ED96.spc":4..2902
