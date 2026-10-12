; Bank $81, first 4 KB: the start of a block of background tiles packed for DecompressLZ, which the bank $9F screen code
; unpacks to $7F0000 and sends to VRAM. The packed bytes come from Extracted/data/818000.chr.lz, which the prebuild cuts
; from the ROM; the block continues in the following files.

org $818000
DATA8_818000:		; packed tiles: format word, unpacked size (big-endian), then the stream
	db $10,$FB
	db $00,$4C,$A0
	incbin "../Extracted/data/818000.chr.lz":5..4096
