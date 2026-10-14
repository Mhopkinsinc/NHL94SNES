; A block for the sound CPU: sound RAM address, length, then the bytes.

DATA8_9A8000:		; for SPCUploadBlock: sound RAM address, length (big-endian words), then the bytes
	db $00,$09
	db $00,$1B
	incbin "../../../Extracted/data/sound/DATA8_9A8000.spc":4..31
