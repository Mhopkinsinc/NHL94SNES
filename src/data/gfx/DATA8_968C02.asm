; Graphics.

DATA8_968C02:		; packed for DecompressLZ, read by a screen setup; not identified yet
	db $10,$FB
	db $00,$07,$40
	incbin "../../../Extracted/data/gfx/DATA8_968C02.lz":5..1422
