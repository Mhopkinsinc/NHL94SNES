; A BRR sound sample for the sound CPU: its loop point and length, then the BRR blocks.

DATA8_958000:		; for SPCUploadBlock: loop point and length (big-endian words, in bytes; multiples of the 9-byte BRR block), then the BRR blocks
	db $0A,$B9
	db $0A,$B9
	incbin "../../../Extracted/data/sound/DATA8_958000.spc":4..2749
