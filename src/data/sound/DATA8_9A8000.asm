; A BRR sound sample for the sound CPU: its loop point and length, then the BRR blocks.

DATA8_9A8000:		; for SPCUploadBlock: loop point and length (big-endian words, in bytes; multiples of the 9-byte BRR block), then the BRR blocks
	db $00,$09
	db $00,$1B
	incbin "../../../Extracted/data/sound/DATA8_9A8000.spc":4..31
