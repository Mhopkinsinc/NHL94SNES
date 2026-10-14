; A block packed for DecompressLZ.

DATA8_89FFC7:		; packed for DecompressLZ: unpacked, BGR555 colours. A screen setup in bank $9D unpacks it and loads
			;   its first 16 colours into colours $40-$4F; the screen is not identified yet
	db $10,$FB
	db $00,$01,$00
	incbin "../../../Extracted/data/gfx/DATA8_89FFC7.pal.lz":5..45
	db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
