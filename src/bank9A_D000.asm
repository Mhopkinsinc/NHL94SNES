; Bank $9A, sixth 4 KB: the end of DATA8_9ACFB6, then DATA8_9AD1B6, colours, then DATA8_9AD3B6, colours, then
; CenterIceTilesNHL, the NHL shield centre ice logo tiles, then CenterIceTilesQUE, the Quebec centre ice logo tiles,
; then DATA8_9AD6A6, a 12 x 10 map, then CenterIceTilesLAK, the Los Angeles centre ice logo tiles, then DATA8_9AD88C,
; a packed 32 x 28 map, then CenterIceTilesTOR, the Toronto centre ice logo tiles, then CenterIceTilesMTL, the
; Montreal centre ice logo tiles, then DATA8_9ADB19, an 18 x 10 byte map, then DATA8_9ADBD3, an 18 x 10 byte map, then
; DATA8_9ADC8D, a packed 128 x 128 byte map, then CenterIceTilesWSH, the Washington centre ice logo tiles, then
; DATA8_9ADDC6, a packed 32 x 28 map, then DATA8_9ADE57, LZ-packed colours, then DATA8_9ADEE0, a packed 12 x 12 byte
; map, then DATA8_9ADF59, a 27 x 2 map, then the start of DATA8_9ADFCB, a packed 18 x 3 map.

org $9AD000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$7F98,$7FBD,$7FBA,$6F7B,$0000
	dw $5AD6,$35AD,$2529,$5ADB,$4A5F,$353B,$6E4D,$12DB
	dw $7ED2,$1084,$7F72,$7F98,$6F7B,$4A52,$2529,$1084
	dw $025B,$01B6,$0000,$4884,$3400,$0124,$0080,$0136
	dw $000D,$35B6,$112D,$7F98,$0240,$2640,$3640,$4A40
	dw $5A40,$6E40,$7E40,$02C0,$12C0,$26C0,$36C0,$4AC0
	dw $5AC0,$6EC0,$7EC0,$7F98,$0360,$2760,$3760,$4B60
	dw $5B60,$6F60,$7F60,$03E0,$13E0,$27E0,$37E0,$4BE0
	dw $5BE0,$6FE0,$7FE0,$7F98,$0360,$037B,$001B,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$6733,$2529,$5AD6,$2529,$5EF7
	dw $2154,$0A99,$762D,$36BF,$2532,$3239,$6F31,$3670
	dw $31D6,$4212,$41D7,$03EC,$6318,$4E73,$2529,$4E73
	dw $11F5,$1E55,$2529,$3D6B,$3529,$1167,$6293,$1D36
	dw $2952,$1DFC,$3617,$7F98,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000
DATA8_9AD1B6:		; colours, not packed, that a screen setup in bank $9D loads into CGRAM; not identified yet
	dw $0000,$60C6,$D4A5,$D484,$C863,$3C42,$0000,$0842
	dw $1084,$98C6,$D8C0,$801B,$7FFF,$C210,$1F9F,$801B
	dw $0320,$0300,$0300,$0300,$0300,$0300,$0300,$0300
	dw $0300,$0300,$02E0,$82E0,$82E0,$82E0,$82E0,$82E0
	dw $82E0,$82E0,$82E0,$82E0,$82C0,$82C0,$82C0,$82C0
	dw $82C0,$82C0,$82C0,$82C0,$82C0,$82A0,$82A0,$82A0
	dw $82A0,$82A0,$82A0,$82A0,$82A0,$82A0,$82A0,$8280
	dw $8280,$8280,$8280,$8280,$8280,$8280,$8280,$8280
	dw $8260,$0260,$0260,$0260,$0260,$0260,$0260,$0260
	dw $0260,$0260,$0240,$0240,$0240,$0240,$0240,$0240
	dw $0240,$0240,$0240,$0220,$0220,$0220,$0220,$0220
	dw $0220,$0220,$0220,$0220,$0220,$0200,$0200,$0200
	dw $0200,$0200,$0200,$0200,$0200,$0200,$01E0,$81E0
	dw $81E0,$81E0,$81E0,$81E0,$81E0,$81E0,$81E0,$81E0
	dw $81C0,$81C0,$81C0,$81C0,$81C0,$81C0,$81C0,$81C0
	dw $81C0,$81A0,$81A0,$81A0,$81A0,$81A0,$81A0,$81A0
	dw $0000,$03E0,$8200,$03FF,$8210,$001F,$0010,$050E
	dw $0971,$1616,$26DA,$BF9F,$8000,$7FFF,$8318,$0018
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
DATA8_9AD3B6:		; colours, not packed, that screen setups in bank $9D load into CGRAM; not identified yet
	dw $0200,$6821,$6145,$7D4A,$7E0F,$058E,$9234,$1E76
	dw $2AB8,$B71B,$435D,$4FBF,$8000,$741F,$741F,$741F
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
CenterIceTilesNHL:	; the NHL shield centre ice logo of the all-star teams (26 and 27 of the centre ice table in bank
			;   $9C): linear 4bpp tiles packed for DecompressHuffman, drawn with CenterIceMapNHL
	db $30,$FB
	db $00,$02,$E0
	incbin "../Extracted/data/CenterIceNHL.lin.huf":5..249
CenterIceTilesQUE:	; the Quebec centre ice logo: linear 4bpp tiles packed for DecompressHuffman (team 18 of
			;   the centre ice table in bank $9C)
	db $30,$FB
	db $00,$03,$40
	incbin "../Extracted/data/CenterIceQUE.lin.huf":5..247
DATA8_9AD6A6:		; a map, not packed: width, height and a word, then the map words (12 x 10); not identified yet
	dw $000C,$000A,$0308
	dw $2000,$2001,$2002,$2003,$2004,$2005,$2006,$2007
	dw $2008,$2009,$200A,$200B,$200C,$200D,$200E,$200F
	dw $2010,$2011,$2012,$2013,$2014,$2015,$2016,$2017
	dw $2018,$2019,$201A,$2019,$2019,$2019,$201B,$201C
	dw $2019,$2019,$2019,$201D,$201E,$201F,$2020,$201F
	dw $201F,$201F,$2021,$2022,$601F,$601F,$601F,$2023
	dw $2024,$2025,$2026,$2025,$2025,$2025,$2027,$2028
	dw $2025,$2025,$2025,$2029,$2024,$2025,$2025,$2025
	dw $2025,$2025,$202A,$202B,$202C,$2025,$2025,$2029
	dw $2024,$2025,$2025,$2025,$2025,$2025,$202D,$202E
	dw $202F,$2025,$2025,$2029,$2024,$2025,$2025,$2025
	dw $2025,$2025,$2030,$2031,$2032,$2033,$2025,$2029
	dw $2024,$2025,$2025,$2025,$2025,$2025,$2025,$2025
	dw $2025,$2025,$2025,$2029,$2034,$2035,$2035,$2035
	dw $2035,$2035,$2035,$2035,$2035,$2035,$2035,$2036
CenterIceTilesLAK:	; the Los Angeles centre ice logo: linear 4bpp tiles packed for DecompressHuffman (team 10 of
			;   the centre ice table in bank $9C)
	db $30,$FB
	db $00,$03,$20
	incbin "../Extracted/data/CenterIceLAK.lin.huf":5..240
DATA8_9AD88C:		; a 32 x 28 map packed for DecompressHuffman (width, height, $0308, then the map words), read
			;   by a screen setup in bank $9D; not identified yet
	db $30,$FB
	db $00,$07,$06
	incbin "../Extracted/data/DATA8_9AD88C.map.huf":5..229
	db $00
CenterIceTilesTOR:	; the Toronto centre ice logo: linear 4bpp tiles packed for DecompressHuffman (team 22 of
			;   the centre ice table in bank $9C)
	db $30,$FB
	db $00,$03,$40
	incbin "../Extracted/data/CenterIceTOR.lin.huf":5..216
CenterIceTilesMTL:	; the Montreal centre ice logo: linear 4bpp tiles packed for DecompressHuffman (team 11 of
			;   the centre ice table in bank $9C)
	db $30,$FB
	db $00,$03,$40
	incbin "../Extracted/data/CenterIceMTL.lin.huf":5..207
DATA8_9ADB19:		; an 18 x 10 map of bytes, not packed (width, height, $0010, then a byte per entry), read by
			;   a routine in bank $9F; not identified yet
	db $12,$00,$0A,$00,$10,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	db $00,$05,$06,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	db $00,$00,$0A,$0B,$0C,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	db $00,$00,$00,$00,$10,$11,$12,$13,$00,$00,$00,$00,$00,$00,$00,$00
	db $00,$00,$17,$18,$18,$19,$1A,$1B,$1C,$1D,$00,$00,$00,$00,$00,$00
	db $00,$00,$00,$00,$22,$23,$24,$24,$24,$25,$26,$27,$28,$00,$00,$00
	db $00,$00,$00,$00,$00,$00,$00,$2E,$2F,$30,$31,$32,$33,$2F,$34,$00
	db $00,$00,$00,$00,$00,$00,$00,$00,$00,$38,$39,$3A,$00,$00,$00,$3B
	db $3C,$3D,$00,$00,$00,$00,$00,$00,$00,$00,$00,$43,$44,$45,$00,$00
	db $00,$46,$47,$48,$00,$00,$00,$00,$00,$00,$00,$00,$00,$4D,$4E,$4F
	db $00,$00,$00,$00,$50,$51,$52,$00,$00,$00,$00,$00,$00,$00,$00,$56
	db $57,$32,$00,$00,$00,$00,$58,$59,$5A,$00
DATA8_9ADBD3:		; an 18 x 10 map of bytes, not packed (width, height, $0010, then a byte per entry), read by
			;   a routine in bank $9F; not identified yet
	db $12,$00,$0A,$00,$10,$00,$00,$00,$01,$02,$03,$03,$03,$03,$03,$04
	db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$07,$08,$08,$08,$08,$08
	db $08,$09,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$0D,$0E,$0E,$0E
	db $0E,$0E,$0E,$0F,$00,$00,$00,$00,$00,$00,$00,$00,$00,$14,$15,$15
	db $15,$15,$16,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$1E,$1F
	db $20,$20,$20,$20,$21,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	db $29,$2A,$2B,$2C,$2A,$2D,$0F,$00,$00,$00,$00,$00,$00,$00,$00,$00
	db $00,$00,$00,$35,$36,$37,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	db $00,$00,$00,$00,$00,$3E,$3F,$40,$41,$41,$41,$42,$00,$00,$00,$00
	db $00,$00,$00,$00,$00,$00,$49,$4A,$4B,$4B,$4B,$4B,$4B,$4C,$00,$00
	db $00,$00,$00,$00,$00,$00,$00,$00,$53,$54,$54,$54,$54,$54,$54,$55
	db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
DATA8_9ADC8D:		; a 128 x 128 map of bytes (width, height, $0010, then a byte per entry) packed for
			;   DecompressHuffman, copied to VRAM by a routine in bank $9F; not identified yet
	db $30,$FB
	db $00,$40,$06
	incbin "../Extracted/data/DATA8_9ADC8D.map.huf":5..166
CenterIceTilesWSH:	; the Washington centre ice logo: linear 4bpp tiles packed for DecompressHuffman (team 24 of
			;   the centre ice table in bank $9C)
	db $30,$FB
	db $00,$02,$40
	incbin "../Extracted/data/CenterIceWSH.lin.huf":5..147
DATA8_9ADDC6:		; a 32 x 28 map packed for DecompressHuffman (width, height, $0308, then the map words), read
			;   by a screen setup in bank $9D; not identified yet
	db $30,$FB
	db $00,$07,$06
	incbin "../Extracted/data/DATA8_9ADDC6.map.huf":5..145
DATA8_9ADE57:		; colours packed for DecompressLZ, loaded into CGRAM by screen setups in bank $9D; not identified yet
	db $10,$FB
	db $00,$01,$00
	incbin "../Extracted/data/DATA8_9ADE57.pal.lz":5..137
DATA8_9ADEE0:		; a 12 x 12 map of bytes (width, height, $0010, then a byte per entry) packed for
			;   DecompressRLE, read by a screen setup in bank $9D; not identified yet
	incbin "../Extracted/data/DATA8_9ADEE0.map.rle":0..121
DATA8_9ADF59:		; a map, not packed: width, height and a word, then the map words (27 x 2); not identified yet
	dw $001B,$0002,$0308
	dw $0001,$0002,$0003,$0004,$0005,$0006,$0007,$0008
	dw $0009,$000A,$000B,$000C,$000D,$000E,$000F,$0010
	dw $0011,$0012,$0013,$0014,$0015,$0016,$0017,$0018
	dw $0019,$001A,$001B,$001C,$001D,$001E,$001F,$0020
	dw $0021,$0022,$0023,$0021,$0024,$0025,$0026,$0027
	dw $0025,$0028,$0029,$002A,$002B,$0024,$002C,$002D
	dw $002E,$002F,$0023,$002C,$0030,$0031
DATA8_9ADFCB:		; an 18 x 3 map packed for DecompressHuffman (width, height, $0308, then the map words)
			;   read in bank $9B; not identified yet
	db $30,$FB
	db $00,$00,$72
	incbin "../Extracted/data/DATA8_9ADFCB.map.huf":5..53
