; A block for the sound CPU: sound RAM address, length, then the bytes.

DATA8_96DE60:		; for SPCUploadBlock, as DATA8_968000
	db $03,$45
	db $03,$45
	incbin "../../../Extracted/data/sound/DATA8_96DE60.spc":4..841
