; A block for the sound CPU: sound RAM address, length, then the bytes.

DATA8_94E225:		; for SPCUploadBlock, as DATA8_948D6F
	db $0B,$6D
	db $0B,$6D
	incbin "../../../Extracted/data/sound/DATA8_94E225.spc":4..2929
