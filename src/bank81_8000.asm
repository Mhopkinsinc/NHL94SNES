; Bank $81, first 4 KB: the start of the ice rink tiles, packed for DecompressLZ. The game code in bank $9F unpacks them to
; $7F0000 and sends them to VRAM; the rink map, its own packed block, is built from them. The packed bytes
; come from Extracted/data/IceRink.chr.lz, which the prebuild cuts from the ROM; the block continues in the following files.

org $818000
IceRinkTiles:		; packed rink tiles: format word, unpacked size (big-endian), then the stream
	db $10,$FB
	db $00,$4C,$A0
	incbin "../Extracted/data/IceRink.chr.lz":5..4096
