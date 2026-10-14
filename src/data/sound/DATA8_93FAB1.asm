; A block for the sound CPU: sound RAM address, length, then the bytes.

DATA8_93FAB1:		; for SPCUploadBlock, as DATA8_9390FA
	db $05,$46
	db $05,$46
	incbin "../../../Extracted/data/sound/DATA8_93FAB1.spc":4..1354
	db $FF,$FF,$FF,$FF,$FF
