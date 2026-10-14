; A block for the sound CPU: sound RAM address, length, then the bytes.

DATA8_948D6F:		; for SPCUploadBlock: sound RAM address, length (big-endian words), then the bytes
	db $0C,a1
	db $0C,a1
	incbin "../../../Extracted/data/sound/DATA8_948D6F.spc":4..3217
