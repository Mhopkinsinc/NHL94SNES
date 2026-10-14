; A block for the sound CPU: sound RAM address, length, then the bytes.

DATA8_8FBB26:		; for SPCUploadBlock: sound RAM address, length (big-endian words), then the bytes
	db $22,$08
	db $22,$08
	incbin "../../../Extracted/data/sound/DATA8_8FBB26.spc":4..8716
