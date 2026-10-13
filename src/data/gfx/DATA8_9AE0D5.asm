; Graphics.

DATA8_9AE0D5:		; colours packed for DecompressLZ, loaded into CGRAM by a screen setup; not identified yet
	db $10,$FB
	db $00,$00,$A0
	incbin "DATA8_9AE0D5.pal.lz":5..76
