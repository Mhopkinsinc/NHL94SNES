; A block for the sound CPU: sound RAM address, length, then the bytes.

DATA8_96AA64:		; for SPCUploadBlock, as DATA8_968000
	db $04,$53
	db $04,$53
	incbin "DATA8_96AA64.spc":4..1111
