; A BRR sound sample for the sound CPU: its loop point and length, then the BRR blocks.

DATA8_90E08C:		; for SPCUploadBlock: loop point and length (big-endian words, in bytes; multiples of the 9-byte BRR block), then the BRR blocks
	db $1D,$52
	db $1D,$52
	incbin "../../../Extracted/data/sound/DATA8_90E08C.spc":4..7510
