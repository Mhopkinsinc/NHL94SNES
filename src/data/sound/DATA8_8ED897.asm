; A block for the sound CPU: sound RAM address, length, then the bytes.

DATA8_8ED897:		; for SPCUploadBlock: sound RAM address, length (big-endian words), then the bytes
	db $15,$45
	db $24,$90
	incbin "DATA8_8ED897.spc":4..1897

	incbin "DATA8_8ED897.spc":1897..5993

	incbin "DATA8_8ED897.spc":5993..9364
