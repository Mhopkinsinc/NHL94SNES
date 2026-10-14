; A block for the sound CPU: sound RAM address, length, then the bytes.

DATA8_90A120:		; for SPCUploadBlock: sound RAM address, length (big-endian words), then the bytes
	db $20,$E8
	db $20,$E8
	incbin "../../../Extracted/data/sound/DATA8_90A120.spc":4..8428
