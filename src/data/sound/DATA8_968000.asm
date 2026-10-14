; A block for the sound CPU: sound RAM address, length, then the bytes.

DATA8_968000:		; for SPCUploadBlock: sound RAM address, length (big-endian words), then the bytes
	db $06,$42
	db $06,$42
	incbin "../../../Extracted/data/sound/DATA8_968000.spc":4..1606
