; A block for the sound CPU: sound RAM address, length, then the bytes.

DATA8_94A662:		; for SPCUploadBlock, as DATA8_948D6F
	db $0C,$21
	db $0C,$21
	incbin "DATA8_94A662.spc":4..3109
