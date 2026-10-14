; A block packed for DecompressLZ.

DATA8_87FF91:		; packed for DecompressLZ: unpacked, three words (10, 12, 16) and then 10 x 12 bytes, a byte map. The
			;   screen setup in bank $9D unpacks it to $7F0000; its use is not traced yet
	db $10,$FB
	db $00,$00,$7E
	incbin "../../../Extracted/data/gfx/DATA8_87FF91.lz":5..106
	db $FF,$FF,$FF,$FF,$FF
