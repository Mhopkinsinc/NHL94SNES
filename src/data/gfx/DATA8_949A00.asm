; Graphics.

DATA8_949A00:		; packed for DecompressLZ, read by code; what it unpacks to is not identified yet
	db $10,$FB
	db $00,$2E,$40
	incbin "DATA8_949A00.lz":5..3170
