; Graphics.

DATA8_9ACCA9:		; 256 colours packed for DecompressLZ, loaded into CGRAM by a screen setup; not identified yet
	db $10,$FB
	db $00,$02,$00
	incbin "../../../Extracted/data/gfx/DATA8_9ACCA9.pal.lz":5..263
