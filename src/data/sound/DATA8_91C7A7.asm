; A block for the sound CPU: sound RAM address, length, then the bytes.

DATA8_91C7A7:		; for SPCUploadBlock, as DATA8_918000
	db $00,$1B
	db $16,$02
	incbin "DATA8_91C7A7.spc":4..5638
