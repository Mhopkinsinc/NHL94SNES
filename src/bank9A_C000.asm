; Bank $9A, fifth 4 KB: the end of CenterIceTilesBOS, then DATA8_9AC0CC, a packed 32 x 28 map, then DATA8_9AC1F3,
; Huffman-packed tiles, then CenterIceTilesEDM, the Edmonton centre ice logo tiles, then CenterIceTilesPHI, the
; Philadelphia centre ice logo tiles, then CenterIceTilesFLA, the Florida centre ice logo tiles, then
; CenterIceTilesSJS, the San Jose centre ice logo tiles, then CenterIceTilesSTL, the St. Louis centre ice logo tiles,
; then CenterIceTilesDET, the Detroit centre ice logo tiles, then DATA8_9AC98B, Huffman-packed tiles, then
; CenterIceTilesBUF, the Buffalo centre ice logo tiles, then CenterIceTilesNYR, the New York Rangers centre ice logo
; tiles, then DATA8_9ACCA9, LZ-packed colours, then DATA8_9ACDB0, a 32 x 4 map, then DATA8_9ACEB6, colours, then the
; start of DATA8_9ACFB6, colours.

org $9AC000
	incbin "data/gfx/CenterIceBOS.lin.huf":95..299
DATA8_9AC0CC:		; a 32 x 28 map packed for DecompressHuffman (width, height, $0308, then the map words), read
			;   by a screen setup in bank $9D; not identified yet
	db $30,$FB
	db $00,$07,$06
	incbin "data/gfx/DATA8_9AC0CC.map.huf":5..295
DATA8_9AC1F3:		; tiles packed for DecompressHuffman sent to VRAM by screen setups in banks $9D and $9F; not identified yet
	db $30,$FB
	db $00,$02,$A0
	incbin "data/gfx/DATA8_9AC1F3.chr.huf":5..290
CenterIceTilesEDM:	; the Edmonton centre ice logo: linear 4bpp tiles packed for DecompressHuffman (team 7 of
			;   the centre ice table in bank $9C)
	db $30,$FB
	db $00,$03,$20
	incbin "data/gfx/CenterIceEDM.lin.huf":5..289
CenterIceTilesPHI:	; the Philadelphia centre ice logo: linear 4bpp tiles packed for DecompressHuffman (team 16 of
			;   the centre ice table in bank $9C)
	db $30,$FB
	db $00,$03,$80
	incbin "data/gfx/CenterIcePHI.lin.huf":5..289
CenterIceTilesFLA:	; the Florida centre ice logo: linear 4bpp tiles packed for DecompressHuffman (team 8 of
			;   the centre ice table in bank $9C)
	db $30,$FB
	db $00,$03,$20
	incbin "data/gfx/CenterIceFLA.lin.huf":5..272
CenterIceTilesSJS:	; the San Jose centre ice logo: linear 4bpp tiles packed for DecompressHuffman (team 19 of
			;   the centre ice table in bank $9C)
	db $30,$FB
	db $00,$03,$00
	incbin "data/gfx/CenterIceSJS.lin.huf":5..269
CenterIceTilesSTL:	; the St. Louis centre ice logo: linear 4bpp tiles packed for DecompressHuffman (team 20 of
			;   the centre ice table in bank $9C)
	db $30,$FB
	db $00,$03,$20
	incbin "data/gfx/CenterIceSTL.lin.huf":5..268
CenterIceTilesDET:	; the Detroit centre ice logo: linear 4bpp tiles packed for DecompressHuffman (team 6 of
			;   the centre ice table in bank $9C)
	db $30,$FB
	db $00,$03,$40
	incbin "data/gfx/CenterIceDET.lin.huf":5..267
DATA8_9AC98B:		; tiles packed for DecompressHuffman sent to VRAM by screen setups in bank $9F; not identified yet
	db $30,$FB
	db $00,$01,$80
	incbin "data/gfx/DATA8_9AC98B.chr.huf":5..267
CenterIceTilesBUF:	; the Buffalo centre ice logo: linear 4bpp tiles packed for DecompressHuffman (team 2 of
			;   the centre ice table in bank $9C)
	db $30,$FB
	db $00,$03,$60
	incbin "data/gfx/CenterIceBUF.lin.huf":5..266
CenterIceTilesNYR:	; the New York Rangers centre ice logo: linear 4bpp tiles packed for DecompressHuffman (team 14 of
			;   the centre ice table in bank $9C)
	db $30,$FB
	db $00,$03,$40
	incbin "data/gfx/CenterIceNYR.lin.huf":5..265
DATA8_9ACCA9:		; 256 colours packed for DecompressLZ, loaded into CGRAM by a screen setup in bank $9D; not identified yet
	db $10,$FB
	db $00,$02,$00
	incbin "data/gfx/DATA8_9ACCA9.pal.lz":5..263
DATA8_9ACDB0:		; a map, not packed: width, height and a word, then the map words (32 x 4); not identified yet
	dw $0020,$0004,$0308
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0001,$0002
	dw $0003,$0004,$0005,$0006,$0007,$0000,$0008,$0009
	dw $000A,$000B,$0000,$0000,$0000,$000C,$000D,$000E
	dw $0000,$000F,$0010,$0011,$0012,$0013,$0000,$0014
	dw $0015,$0016,$0017,$0018,$0019,$001A,$001B,$001C
	dw $001D,$001E,$001F,$0020,$0021,$0022,$0023,$0024
	dw $0025,$0026,$0027,$0028,$0029,$002A,$002B,$002C
	dw $002D,$002E,$002F,$0030,$0031,$0032,$0033,$0034
	dw $0035,$0036,$0037,$0038,$0039,$003A,$003B,$001D
	dw $003C,$003D,$003E,$003F,$0040,$0041,$0042,$0043
	dw $0044,$0045,$0046,$0047,$0048,$0049,$004A,$004B
	dw $004C,$004D,$004E,$004F,$0050,$0051,$0052,$0053
	dw $0054,$0055,$0056,$0057,$0058,$0059,$005A,$005B
	dw $005C,$005D,$005E,$005F,$0060,$0061,$0062,$0063
	dw $0064,$0065,$0066,$0067,$0068,$0069,$0000,$0000
DATA8_9ACEB6:		; colours, not packed, that screen setups in banks $9D and $9F load into CGRAM; not identified yet
	dw $7FF2,$1084,$0000,$6F7B,$000D,$0012,$4A5B,$35B6
	dw $4A52,$6F7B,$009B,$22C0,$0D5F,$0814,$17FF,$7E6F
	dw $0000,$0000,$0000,$7000,$0000,$0000,$0000,$7000
	dw $0000,$0000,$0000,$6000,$0000,$0000,$0000,$7000
	dw $0000,$0000,$0000,$7000,$0000,$0000,$0000,$7000
	dw $0000,$0000,$0000,$7000,$0000,$0000,$0000,$7000
	dw $0000,$0000,$0000,$7000,$0000,$0000,$0000,$6000
	dw $0000,$0000,$0000,$7000,$0000,$0000,$0000,$6000
	dw $0000,$0000,$0000,$6000,$0000,$0000,$0000,$7000
	dw $0000,$0000,$0000,$6000,$0000,$0000,$0000,$7000
	dw $0000,$0000,$0000,$6000,$0000,$0000,$0000,$7000
	dw $50D0,$60E0,$60E0,$60E0,$60E0,$60E0,$60E0,$60E0
	dw $70F0,$70F0,$70F0,$60F0,$70F0,$60E0,$70F0,$60E0
	dw $70F0,$60E0,$70E0,$60F0,$60E0,$70F0,$70F0,$60E0
	dw $60E0,$60E0,$60E0,$60E0,$60E0,$60E0,$60E0,$60E0
	dw $40C0,$40C0,$60C0,$60E0,$60E0,$60E0,$60E0,$60E0
DATA8_9ACFB6:		; colours, not packed, that a screen setup in bank $9B loads into CGRAM; not identified yet
	dw $0000,$0000,$0160,$016B,$000B,$6318,$03E0,$03FF
	dw $001F,$7C1F,$7C1F,$7C1F,$7C1F,$7C1F,$7C1F,$7C1F
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000
