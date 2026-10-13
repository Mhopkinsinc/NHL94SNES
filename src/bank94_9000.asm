; Bank $94, second 4 KB: the end of DATA8_948D6F, then the start of DATA8_949A00, an LZ-packed block not identified
; yet.

org $949000
	incbin "data/sound/DATA8_948D6F.spc":657..3217
DATA8_949A00:		; packed for DecompressLZ, read by code in bank $9F; what it unpacks to is not identified yet
	db $10,$FB
	db $00,$2E,$40
	incbin "data/gfx/DATA8_949A00.lz":5..1536
