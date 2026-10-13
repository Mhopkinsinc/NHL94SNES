; A block for the sound CPU: sound RAM address, length, then the bytes.

DATA8_9199D2:		; for SPCUploadBlock, as DATA8_918000
	db $17,$B2
	db $17,$B2
	incbin "DATA8_9199D2.spc":4..6070
