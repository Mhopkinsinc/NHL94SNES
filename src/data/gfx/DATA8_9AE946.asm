; Graphics.

DATA8_9AE946:		; colours packed for DecompressLZ, loaded into CGRAM by a screen setup; not identified yet
	db $10,$FB
	db $00,$01,$00
	incbin "../../../Extracted/data/gfx/DATA8_9AE946.pal.lz":5..44
