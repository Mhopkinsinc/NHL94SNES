; A BRR sound sample for the sound CPU: its loop point and length, then the BRR blocks.

DATA8_8F8000:		; for SPCUploadBlock: loop point and length (big-endian words, in bytes; multiples of the 9-byte BRR block), then the BRR blocks
	db $3B,$22
	db $3B,$22
	incbin "../../../Extracted/data/sound/DATA8_8F8000.spc":4..15142
