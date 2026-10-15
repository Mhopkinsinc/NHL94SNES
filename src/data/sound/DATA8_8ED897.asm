; A BRR sound sample for the sound CPU: its loop point and length, then the BRR blocks.

DATA8_8ED897:		; for SPCUploadBlock: loop point and length (big-endian words, in bytes; multiples of the 9-byte BRR block), then the BRR blocks
	db $15,$45
	db $24,$90
	incbin "../../../Extracted/data/sound/DATA8_8ED897.spc":4..9364
