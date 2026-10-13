; A block for the sound CPU: sound RAM address, length, then the bytes.

DATA8_958ABD:		; for SPCUploadBlock, as DATA8_958000
	db $09,$CF
	db $09,$CF
	incbin "DATA8_958ABD.spc":4..2515
