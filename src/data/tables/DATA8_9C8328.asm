; Data table.
DATA8_9C8328:		; packed for DecompressLZ, unpacked by a screen setup in bank $9B; not identified yet
	db $10,$FB
	db $00,$01,$00
	incbin "../gfx/DATA8_9C8328.lz":5..143
