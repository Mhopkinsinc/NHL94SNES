; A BRR sound sample for the sound CPU: its loop point and length, then the BRR blocks.

DATA8_9390FA:		; for SPCUploadBlock: loop point and length (big-endian words, in bytes; multiples of the 9-byte BRR block), then the BRR blocks
	db $0D,$9B
	db $10,$8F
	incbin "../../../Extracted/data/sound/DATA8_9390FA.spc":4..4243
