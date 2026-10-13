; A block for the sound CPU: sound RAM address, length, then the bytes.

DATA8_918000:		; for SPCUploadBlock: sound RAM address, length (big-endian words), then the bytes
	db $19,$CE
	db $19,$CE
	incbin "DATA8_918000.spc":4..6610
