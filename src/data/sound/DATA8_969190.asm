; A block for the sound CPU: sound RAM address, length, then the bytes.

DATA8_969190:		; for SPCUploadBlock, as DATA8_968000
	db $05,$4F
	db $05,$4F
	incbin "DATA8_969190.spc":4..1363
