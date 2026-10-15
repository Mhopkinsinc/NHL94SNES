; A BRR sound sample for the sound CPU: its loop point and length, then the BRR blocks.

DATA8_918000:		; for SPCUploadBlock: loop point and length (big-endian words, in bytes; multiples of the 9-byte BRR block), then the BRR blocks
	db $19,$CE
	db $19,$CE
	incbin "../../../Extracted/data/sound/DATA8_918000.spc":4..6610
