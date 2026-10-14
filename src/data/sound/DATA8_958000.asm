; A block for the sound CPU: sound RAM address, length, then the bytes.

DATA8_958000:		; for SPCUploadBlock: sound RAM address, length (big-endian words), then the bytes
	db $0A,$B9
	db $0A,$B9
	incbin "../../../Extracted/data/sound/DATA8_958000.spc":4..2749
