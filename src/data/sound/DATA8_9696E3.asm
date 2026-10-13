; A block for the sound CPU: sound RAM address, length, then the bytes.

DATA8_9696E3:		; for SPCUploadBlock, as DATA8_968000
	db $05,$22
	db $05,$22
	incbin "DATA8_9696E3.spc":4..1318
