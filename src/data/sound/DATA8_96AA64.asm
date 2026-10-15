; A BRR sound sample for the sound CPU: its loop point and length, then the BRR blocks.

DATA8_96AA64:		; for SPCUploadBlock, as SampleCowbell
	db $04,$53
	db $04,$53
	incbin "../../../Extracted/data/sound/DATA8_96AA64.spc":4..1111
