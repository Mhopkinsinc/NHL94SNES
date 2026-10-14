; A block for the sound CPU: sound RAM address, length, then the bytes.

DATA8_959E48:		; for SPCUploadBlock, as DATA8_958000
	db $03,$F9
	db $09,$AB
	incbin "../../../Extracted/data/sound/DATA8_959E48.spc":4..2479
