; A block for the sound CPU: sound RAM address, length, then the bytes.

DATA8_948D6F:		; for SPCUploadBlock: sound RAM address, length (big-endian words), then the bytes
	db $0C,$8D
	db $0C,$8D
	incbin "../../../Extracted/data/sound/DATA8_948D6F.spc":4..3217
