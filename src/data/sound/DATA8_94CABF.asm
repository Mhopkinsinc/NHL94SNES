; A block for the sound CPU: sound RAM address, length, then the bytes.

DATA8_94CABF:		; for SPCUploadBlock, as DATA8_948D6F
	db $0B,$E2
	db $0B,$E2
	incbin "DATA8_94CABF.spc":4..3046
