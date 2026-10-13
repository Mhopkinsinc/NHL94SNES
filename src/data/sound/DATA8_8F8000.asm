; A block for the sound CPU: sound RAM address, length, then the bytes.

DATA8_8F8000:		; for SPCUploadBlock: sound RAM address, length (big-endian words), then the bytes
	db $3B,$22
	db $3B,$22
	incbin "DATA8_8F8000.spc":4..15142
