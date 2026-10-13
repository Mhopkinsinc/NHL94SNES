; A block for the sound CPU: sound RAM address, length, then the bytes.

DATA8_9293F3:		; for SPCUploadBlock, as DATA8_928000
	db $13,$C2
	db $13,$C2
	incbin "DATA8_9293F3.spc":4..5062
