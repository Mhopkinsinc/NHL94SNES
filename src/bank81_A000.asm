; Bank $81, third 4 KB: the end of IceRinkTiles, then the start of the team logos: a sprite set packed for
; DecompressHuffman, one frame per team, then the Wales and Campbell conference, NHL and NHLPA logos. The team setup code
; in bank $9D unpacks it to $7F7800 and draws a logo with DrawSprite, in the palette of that team. Both blocks come from
; data assets that the prebuild cuts from the ROM (Extracted/data/IceRink.chr.lz, Extracted/data/TeamLogos.spr.huf).

org $81A000
	incbin "../Extracted/data/IceRink.chr.lz":8192..11230
TeamLogoSprites:	; packed sprite set: format word, unpacked size (big-endian), then the stream
	db $30,$FB
	db $00,$7C,$00
	incbin "../Extracted/data/TeamLogos.spr.huf":5..1058
