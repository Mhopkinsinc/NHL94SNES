; Bank $9A, seventh 4 KB: the end of DATA8_9ADFCB, then DATA8_9AE027, an LZ-packed block, then DATA8_9AE080, a block
; for the sound CPU (upload list DATA8_80DD16), then DATA8_9AE0D5 and DATA8_9AE121, LZ-packed colours, then the centre
; ice logo maps of the teams (CenterIceMapPIT to CenterIceMapMTL), then small packed colours and maps (DATA8_9AE884 to
; DATA8_9AEA15) and the map DATA8_9AEA3A, then the photo colours of the teams (PhotoPaletteBUF to PhotoPaletteWPG,
; with the all-star DATA8_9AEB3C), then the logo colours of the teams (LogoPaletteBOS to LogoPaletteCGY, with other
; colours between them) and the start of LogoPaletteSJS.

org $9AE000
	incbin "../Extracted/data/DATA8_9ADFCB.map.huf":53..92
DATA8_9AE027:		; packed for DecompressLZ by a screen setup in bank $9D; not identified yet
	db $10,$FB
	db $00,$01,$00
	incbin "../Extracted/data/DATA8_9AE027.lz":5..89
DATA8_9AE080:		; for SPCUploadBlock, as DATA8_9A8000
	db $00,$51
	db $00,$51
	incbin "../Extracted/data/DATA8_9AE080.spc":4..85
DATA8_9AE0D5:		; colours packed for DecompressLZ, loaded into CGRAM by a screen setup in bank $9D; not identified yet
	db $10,$FB
	db $00,$00,$A0
	incbin "../Extracted/data/DATA8_9AE0D5.pal.lz":5..76
DATA8_9AE121:		; colours packed for DecompressLZ, loaded into CGRAM by screen setups in bank $9D; not identified yet
	db $10,$FB
	db $00,$01,$00
	incbin "../Extracted/data/DATA8_9AE121.pal.lz":5..71
CenterIceMapPIT:	; the Pittsburgh centre ice logo map: width, height, a word, then the map words (8 x 4)
	dw $0008,$0004,$0308
	dw $0000,$0401,$0402,$0403,$0404,$0405,$0000,$0000
	dw $0406,$0407,$0408,$0409,$040A,$040B,$040C,$040D
	dw $0000,$040E,$040F,$0410,$0411,$0412,$0413,$0000
	dw $0000,$0000,$0000,$0414,$0415,$0000,$0000,$0000
CenterIceMapQUE:	; the Quebec centre ice logo map: width, height, a word, then the map words (8 x 4)
	dw $0008,$0004,$0308
	dw $0000,$0401,$0402,$0403,$0404,$0000,$0000,$0000
	dw $0405,$0406,$0407,$0408,$0409,$040A,$040B,$0000
	dw $040C,$040D,$040E,$040F,$0410,$0411,$0412,$0413
	dw $0414,$0415,$0415,$0416,$0415,$0417,$0418,$0419
CenterIceMapDET:	; the Detroit centre ice logo map: width, height, a word, then the map words (8 x 4)
	dw $0008,$0004,$0308
	dw $0000,$0000,$0000,$0001,$0002,$0002,$0003,$0004
	dw $0005,$0006,$0007,$0008,$0009,$000A,$000B,$000C
	dw $000D,$000E,$000F,$0010,$0011,$0012,$0013,$0000
	dw $0014,$0015,$0016,$0017,$0018,$0019,$0000,$0000
CenterIceMapSJS:	; the San Jose centre ice logo map: width, height, a word, then the map words (8 x 4)
	dw $0008,$0004,$0308
	dw $0000,$0001,$0002,$0003,$0000,$0004,$0005,$0000
	dw $0006,$0007,$0008,$0009,$000A,$000B,$000C,$000D
	dw $0000,$000E,$000F,$0010,$0011,$0012,$0013,$0000
	dw $0000,$0014,$0015,$0016,$0017,$0000,$0000,$0000
CenterIceMapSTL:	; the St. Louis centre ice logo map: width, height, a word, then the map words (8 x 4)
	dw $0008,$0004,$0308
	dw $0400,$0401,$0402,$0403,$0404,$0405,$0406,$0407
	dw $0008,$0409,$040A,$040B,$040C,$040D,$040E,$040F
	dw $0008,$0410,$0411,$0412,$0413,$0414,$0008,$0008
	dw $0008,$0415,$0416,$0417,$0418,$0008,$0008,$0008
CenterIceMapLAK:	; the Los Angeles centre ice logo map: width, height, a word, then the map words (8 x 4)
	dw $0008,$0004,$0308
	dw $0000,$0401,$0402,$0403,$0404,$0405,$0405,$0406
	dw $0407,$0408,$0409,$040A,$040B,$040C,$040D,$040E
	dw $040F,$0410,$0411,$0412,$0413,$0414,$0415,$0000
	dw $0000,$0000,$0416,$0417,$0418,$0000,$0000,$0000
CenterIceMapTBL:	; the Tampa Bay centre ice logo map: width, height, a word, then the map words (8 x 4)
	dw $0008,$0004,$0308
	dw $0400,$0401,$0402,$0403,$0404,$0405,$0406,$0407
	dw $0408,$0409,$040A,$040B,$040C,$040D,$040E,$040F
	dw $0410,$0411,$0412,$0413,$0414,$0415,$0416,$0417
	dw $0018,$0419,$041A,$041B,$041C,$041D,$0018,$0018
CenterIceMapTOR:	; the Toronto centre ice logo map: width, height, a word, then the map words (8 x 4)
	dw $0008,$0004,$0308
	dw $0000,$0000,$0401,$0402,$0403,$0404,$0000,$0000
	dw $0405,$0406,$0407,$0408,$0409,$040A,$0406,$040B
	dw $040C,$040D,$040E,$040F,$0410,$0411,$0412,$0413
	dw $0000,$0414,$0415,$0416,$0417,$0418,$0419,$0000
CenterIceMapDAL:	; the Dallas centre ice logo map: width, height, a word, then the map words (8 x 4)
	dw $0008,$0004,$0308
	dw $0000,$0401,$0402,$0403,$0404,$0405,$0406,$0407
	dw $0408,$0409,$040A,$040B,$040C,$040D,$040E,$040F
	dw $0000,$0410,$0411,$0412,$0413,$0414,$0000,$0000
	dw $0000,$0415,$0416,$0000,$0417,$0418,$0000,$0000
CenterIceMapVAN:	; the Vancouver centre ice logo map: width, height, a word, then the map words (8 x 4)
	dw $0008,$0004,$0308
	dw $0000,$0000,$0401,$0402,$0403,$0404,$0405,$0000
	dw $0000,$0406,$0407,$0408,$0409,$040A,$040B,$040C
	dw $040D,$040E,$040F,$0410,$0411,$0412,$0413,$0000
	dw $0000,$0414,$0415,$0416,$0417,$0418,$0000,$0000
CenterIceMapWSH:	; the Washington centre ice logo map: width, height, a word, then the map words (8 x 4)
	dw $0008,$0004,$0308
	dw $0000,$0000,$0000,$0401,$0000,$0000,$0000,$0000
	dw $0402,$0403,$0404,$0405,$0406,$0407,$0408,$0409
	dw $040A,$040B,$040C,$040D,$040E,$040F,$0410,$0411
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
CenterIceMapWPG:	; the Winnipeg centre ice logo map: width, height, a word, then the map words (8 x 4)
	dw $0008,$0004,$0308
	dw $0000,$0401,$0402,$0403,$0404,$0405,$0406,$0000
	dw $0000,$0407,$0408,$0409,$040A,$040B,$040C,$040D
	dw $040E,$040F,$0410,$0411,$0412,$0413,$0414,$0415
	dw $0416,$0417,$0418,$0419,$041A,$041B,$041C,$0000
CenterIceMapHFD:	; the Hartford centre ice logo map: width, height, a word, then the map words (8 x 4)
	dw $0008,$0004,$0308
	dw $0400,$0401,$0402,$0403,$0404,$0402,$0405,$0406
	dw $0407,$0408,$0409,$040A,$040B,$040C,$040D,$040E
	dw $040F,$0410,$0411,$0412,$0413,$0414,$0415,$040E
	dw $0416,$0417,$0418,$0419,$041A,$0418,$041B,$041C
CenterIceMapCHI:	; the Chicago centre ice logo map: width, height, a word, then the map words (8 x 4)
	dw $0008,$0004,$0308
	dw $0000,$0001,$0002,$0003,$0004,$0005,$0000,$0000
	dw $0000,$0006,$0007,$0008,$0009,$000A,$000B,$000C
	dw $000D,$000E,$000F,$0010,$0011,$0012,$0013,$0014
	dw $0000,$0015,$0016,$0017,$0018,$0019,$001A,$001B
CenterIceMapANA:	; the Anaheim centre ice logo map: width, height, a word, then the map words (8 x 4)
	dw $0008,$0004,$0308
	dw $0000,$0001,$0002,$0003,$0004,$0005,$0006,$0007
	dw $0008,$0009,$000A,$000B,$000C,$000D,$000E,$0008
	dw $0008,$000F,$0010,$0011,$0012,$0013,$0008,$0008
	dw $0008,$0014,$0015,$0016,$0017,$0018,$0019,$001A
CenterIceMapNYI:	; the New York Islanders centre ice logo map: width, height, a word, then the map words (8 x 4)
	dw $0008,$0004,$0308
	dw $0000,$0401,$0402,$0403,$0404,$0405,$0406,$0000
	dw $0407,$0408,$0409,$040A,$040B,$040C,$040D,$040E
	dw $040F,$0410,$0411,$0412,$0413,$0414,$0415,$0416
	dw $0000,$0417,$0418,$0419,$041A,$041B,$041C,$0000
CenterIceMapNYR:	; the New York Rangers centre ice logo map: width, height, a word, then the map words (8 x 4)
	dw $0008,$0004,$0308
	dw $0400,$0401,$0402,$0403,$0404,$0405,$0406,$0407
	dw $0008,$0409,$040A,$040B,$040C,$040D,$040E,$0008
	dw $0008,$040F,$0410,$0411,$0412,$0413,$0414,$0008
	dw $0008,$0415,$0416,$0417,$0418,$0416,$0419,$0008
CenterIceMapOTT:	; the Ottawa centre ice logo map: width, height, a word, then the map words (8 x 4)
	dw $0008,$0004,$0308
	dw $0000,$0000,$0001,$0002,$0003,$0004,$0000,$0000
	dw $0005,$0006,$0007,$0008,$0009,$000A,$000B,$0000
	dw $000C,$000D,$000E,$000F,$0010,$0011,$0012,$0000
	dw $0000,$0013,$0014,$0015,$0016,$0017,$0018,$0000
CenterIceMapFLA:	; the Florida centre ice logo map: width, height, a word, then the map words (8 x 4)
	dw $0008,$0004,$0308
	dw $0000,$0000,$0401,$0402,$0403,$0404,$0000,$0000
	dw $0405,$0406,$0407,$0408,$0409,$040A,$040B,$040C
	dw $040D,$040E,$040F,$0410,$0411,$0412,$0413,$0414
	dw $0000,$0000,$0415,$0416,$0417,$0418,$0000,$0000
CenterIceMapNJD:	; the New Jersey centre ice logo map: width, height, a word, then the map words (8 x 4)
	dw $0008,$0004,$0308
	dw $0000,$0000,$0401,$0402,$0403,$0404,$0405,$0000
	dw $0000,$0406,$0407,$0408,$0409,$040A,$040B,$0000
	dw $0000,$040C,$040D,$040E,$040F,$0410,$0411,$0000
	dw $0412,$0413,$0414,$0415,$0416,$0417,$0418,$0000
CenterIceMapCGY:	; the Calgary centre ice logo map: width, height, a word, then the map words (8 x 4)
	dw $0008,$0004,$0308
	dw $0000,$0401,$0402,$0403,$0404,$0405,$0406,$0000
	dw $0407,$0408,$0409,$040A,$040B,$040C,$040D,$0000
	dw $040E,$040F,$0410,$0411,$0412,$0413,$0414,$0000
	dw $0000,$0415,$0416,$0417,$0418,$0419,$0000,$0000
CenterIceMapEDM:	; the Edmonton centre ice logo map: width, height, a word, then the map words (8 x 4)
	dw $0008,$0004,$0308
	dw $0000,$0401,$0402,$0403,$0404,$0405,$0406,$0000
	dw $0000,$0407,$0408,$0409,$040A,$040B,$040C,$0000
	dw $0000,$040D,$040E,$040F,$0410,$0411,$0412,$0000
	dw $0000,$0413,$0414,$0415,$0416,$0417,$0418,$0000
CenterIceMapBUF:	; the Buffalo centre ice logo map: width, height, a word, then the map words (8 x 4)
	dw $0008,$0004,$0308
	dw $0000,$0401,$0402,$0403,$0404,$0405,$0406,$0000
	dw $0000,$0407,$0408,$0409,$040A,$040B,$040C,$040D
	dw $0000,$040E,$040F,$0410,$0411,$0412,$0413,$0414
	dw $0000,$0415,$0416,$0417,$0418,$0419,$041A,$0000
CenterIceMapPHI:	; the Philadelphia centre ice logo map: width, height, a word, then the map words (8 x 4)
	dw $0008,$0004,$0308
	dw $0400,$0401,$0401,$0401,$0401,$0402,$0403,$0004
	dw $0405,$0406,$0407,$0408,$0409,$040A,$040B,$040C
	dw $040D,$040E,$040F,$0410,$0411,$0412,$0413,$0414
	dw $0415,$0416,$0417,$0418,$0419,$041A,$041B,$0004
CenterIceMapBOS:	; the Boston centre ice logo map: width, height, a word, then the map words (8 x 4)
	dw $0008,$0004,$0308
	dw $0000,$0401,$0402,$0403,$0404,$0405,$0406,$0000
	dw $0000,$0407,$0408,$0409,$040A,$040B,$040C,$0000
	dw $0000,$040D,$040E,$040F,$0410,$0411,$0412,$0000
	dw $0000,$0413,$0414,$0415,$0416,$0417,$0418,$0000
CenterIceMapMTL:	; the Montreal centre ice logo map: width, height, a word, then the map words (8 x 4)
	dw $0008,$0004,$0308
	dw $0000,$0000,$0401,$0402,$0403,$0404,$0405,$0000
	dw $0406,$0407,$0408,$0409,$040A,$040B,$040C,$0000
	dw $040D,$040E,$040F,$0410,$0411,$0412,$0413,$0414
	dw $0000,$0415,$0416,$0417,$0417,$0418,$0419,$0000
DATA8_9AE884:		; colours packed for DecompressRLE, loaded into the colour buffer by a screen setup in bank $9D; not identified yet
	incbin "../Extracted/data/DATA8_9AE884.pal.rle":0..59
DATA8_9AE8BF:		; packed for DecompressHuffman by a screen setup in bank $9D; not identified yet
	db $30,$FB
	db $00,$00,$C0
	incbin "../Extracted/data/DATA8_9AE8BF.huf":5..45
DATA8_9AE8EC:		; an 18 x 3 map packed for DecompressRLE (width, height, $0308, then the map words)
			;   read in bank $9B; not identified yet
	incbin "../Extracted/data/DATA8_9AE8EC.map.rle":0..45
DATA8_9AE919:		; an 18 x 3 map packed for DecompressRLE (width, height, $0308, then the map words)
			;   read in bank $9B; not identified yet
	incbin "../Extracted/data/DATA8_9AE919.map.rle":0..45
DATA8_9AE946:		; colours packed for DecompressLZ, loaded into CGRAM by a screen setup in bank $9D; not identified yet
	db $10,$FB
	db $00,$01,$00
	incbin "../Extracted/data/DATA8_9AE946.pal.lz":5..44
DATA8_9AE972:		; colours packed for DecompressHuffman, loaded into CGRAM by a screen setup in bank $9D; not identified yet
	db $30,$FB
	db $00,$01,$00
	incbin "../Extracted/data/DATA8_9AE972.pal.huf":5..43
DATA8_9AE99D:		; a map, not packed: width, height and a word, then the map words (9 x 2); read in bank $9F
	dw $0009,$0002,$0308
	dw $0001,$0002,$0003,$0004,$0005,$0007,$0008,$0009
	dw $000A,$000B,$000C,$000D,$000E,$0010,$0011,$0012
	dw $0013,$0014
DATA8_9AE9C7:		; a 30 x 12 map packed for DecompressLZ (width, height, $0308, then the map words)
			;   read in bank $9B; not identified yet
	db $10,$FB
	db $00,$02,$D6
	incbin "../Extracted/data/DATA8_9AE9C7.map.lz":5..41
DATA8_9AE9F0:		; a 7 x 7 map packed for DecompressLZ (width, height, $0308, then the map words)
			;   read by a screen setup in bank $9D; not identified yet
	db $10,$FB
	db $00,$00,$68
	incbin "../Extracted/data/DATA8_9AE9F0.map.lz":5..37
DATA8_9AEA15:		; a 7 x 7 map packed for DecompressLZ (width, height, $0308, then the map words)
			;   read by a screen setup in bank $9D; not identified yet
	db $10,$FB
	db $00,$00,$68
	incbin "../Extracted/data/DATA8_9AEA15.map.lz":5..37
DATA8_9AEA3A:		; a map, not packed: width, height and a word, then the map words (7 x 2); read in bank $9F
	dw $0007,$0002,$0308
	dw $0401,$0402,$0403,$0404,$0405,$0406,$0401,$0401
	dw $0407,$0408,$0409,$040A,$040B,$0401
PhotoPaletteBUF:	; the 16 colours of the Buffalo player photos (the photo palette table in bank $9D)
	dw $7C1F,$4EFE,$C6BD,$BE7B,$3239,$29F8,$9DB6,$9575
	dw $0D33,$0911,$04EF,$808A,$8027,$027B,$4803,$2000
PhotoPaletteCGY:	; the 16 colours of the Calgary player photos (the photo palette table in bank $9D)
	dw $7C1F,$4EFE,$C6BD,$BE7B,$3239,$29F8,$9DB6,$9575
	dw $0D33,$0911,$04EF,$808A,$8066,$0319,$00F5,$EF7B
PhotoPaletteCHI:	; the 16 colours of the Chicago player photos (the photo palette table in bank $9D)
	dw $7C1F,$4EFE,$C6BD,$BE7B,$3239,$29F8,$9DB6,$9575
	dw $0D33,$0911,$04EF,$808A,$8027,$77BD,$8018,$0000
PhotoPaletteDAL:	; the 16 colours of the Dallas player photos (the photo palette table in bank $9D)
	dw $7C1F,$4EFE,$C6BD,$BE7B,$3239,$29F8,$9DB6,$9575
	dw $0D33,$0911,$04EF,$808A,$8047,$739C,$8000,$01E0
PhotoPaletteDET:	; the 16 colours of the Detroit player photos (the photo palette table in bank $9D)
	dw $7C1F,$4EFE,$C6BD,$BE7B,$3239,$29F8,$9DB6,$9575
	dw $0D33,$0911,$04EF,$808A,$8027,$77BD,$801B,$77BD
PhotoPaletteEDM:	; the 16 colours of the Edmonton player photos (the photo palette table in bank $9D)
	dw $7C1F,$4EFE,$C6BD,$BE7B,$3239,$29F8,$9DB6,$9575
	dw $0D33,$0911,$04EF,$808A,$8047,$739C,$D400,$0119
PhotoPaletteFLA:	; the 16 colours of the Florida player photos (the photo palette table in bank $9D)
	dw $4E31,$4EFE,$C6BD,$BE7B,$3239,$29F8,$9DB6,$9575
	dw $0D33,$0911,$04EF,$808A,$8027,$30C5,$8CB4,$9275
DATA8_9AEB3C:		; 16 colours: the photo colours of the all-star teams (26 and 27 of the photo palette table in
			;   bank $9D)
	dw $7C1F,$4EFE,$C6BD,$BE7B,$3239,$29F8,$9DB6,$9575
	dw $0D33,$0911,$04EF,$808A,$8066,$6739,$0000,$0000
PhotoPaletteHFD:	; the 16 colours of the Hartford player photos (the photo palette table in bank $9D)
	dw $7C1F,$4EFE,$C6BD,$BE7B,$3239,$29F8,$9DB6,$9575
	dw $0D33,$0911,$04EF,$808A,$8066,$5294,$B800,$0200
PhotoPaletteLAK:	; the 16 colours of the Los Angeles player photos (the photo palette table in bank $9D)
	dw $7C1F,$4EFE,$C6BD,$BE7B,$3239,$29F8,$9DB6,$9575
	dw $0D33,$0911,$04EF,$808A,$8027,$5294,$8000,$77BD
PhotoPaletteMTL:	; the 16 colours of the Montreal player photos (the photo palette table in bank $9D)
	dw $7C1F,$4EFE,$C6BD,$BE7B,$3239,$29F8,$9DB6,$9575
	dw $0D33,$0911,$04EF,$808A,$8027,$6F7B,$001B,$6000
PhotoPaletteNJD:	; the 16 colours of the New Jersey player photos (the photo palette table in bank $9D)
	dw $7C1F,$4EFE,$C6BD,$BE7B,$3239,$29F8,$9DB6,$9575
	dw $0D33,$0911,$04EF,$808A,$8066,$7FFF,$8012,$0000
PhotoPaletteNYI:	; the 16 colours of the New York Islanders player photos (the photo palette table in bank $9D)
	dw $7C1F,$4EFE,$C6BD,$BE7B,$3239,$29F8,$9DB6,$9575
	dw $0D33,$0911,$04EF,$808A,$8027,$6F7B,$50A0,$8118
PhotoPaletteNYR:	; the 16 colours of the New York Rangers player photos (the photo palette table in bank $9D)
	dw $7C1F,$4EFE,$C6BD,$BE7B,$3239,$29F8,$9DB6,$9575
	dw $0D33,$0911,$04EF,$808A,$8047,$739C,$E800,$0013
PhotoPaletteOTT:	; the 16 colours of the Ottawa player photos (the photo palette table in bank $9D)
	dw $7C1F,$4EFE,$C6BD,$BE7B,$3239,$29F8,$9DB6,$9575
	dw $0D33,$0911,$04EF,$808A,$8047,$001A,$0000,$739C
PhotoPalettePHI:	; the 16 colours of the Philadelphia player photos (the photo palette table in bank $9D)
	dw $566F,$4F1E,$46FD,$BE9B,$B259,$2A18,$1DB6,$9575
	dw $0D33,$0911,$04EF,$808A,$8027,$6F7B,$0179,$0000
PhotoPalettePIT:	; the 16 colours of the Pittsburgh player photos (the photo palette table in bank $9D)
	dw $7C1F,$4EFE,$C6BD,$BE7B,$3239,$29F8,$9DB6,$9575
	dw $0D33,$0911,$04EF,$808A,$8027,$739C,$8000,$02DA
PhotoPaletteQUE:	; the 16 colours of the Quebec player photos (the photo palette table in bank $9D)
	dw $7C1F,$4EFE,$C6BD,$BE7B,$3239,$29F8,$9DB6,$9575
	dw $0D33,$0911,$04EF,$808A,$8027,$739C,$E580,$E739
PhotoPaletteSJS:	; the 16 colours of the San Jose player photos (the photo palette table in bank $9D)
	dw $7C1F,$4EFE,$C6BD,$BE7B,$3239,$29F8,$9DB6,$9575
	dw $0D33,$0911,$04EF,$808A,$8027,$7BDE,$C180,$E318
PhotoPaletteSTL:	; the 16 colours of the St. Louis player photos (the photo palette table in bank $9D)
	dw $7C1F,$4EFE,$C6BD,$BE7B,$3239,$29F8,$9DB6,$9575
	dw $0D33,$0911,$04EF,$808A,$8027,$739C,$D800,$02B8
PhotoPaletteTBL:	; the 16 colours of the Tampa Bay player photos (the photo palette table in bank $9D)
	dw $7C1F,$4EFE,$C6BD,$BE7B,$3239,$29F8,$9DB6,$9575
	dw $0D33,$0911,$04EF,$808A,$8027,$5800,$0000,$739C
PhotoPaletteTOR:	; the 16 colours of the Toronto player photos (the photo palette table in bank $9D)
	dw $7C1F,$4EFE,$C6BD,$BE7B,$3239,$29F8,$9DB6,$9575
	dw $0D33,$0911,$04EF,$808A,$8027,$739C,$E060,$3800
PhotoPaletteVAN:	; the 16 colours of the Vancouver player photos (the photo palette table in bank $9D)
	dw $7C1F,$4EFE,$C6BD,$BE7B,$3239,$29F8,$9DB6,$9575
	dw $0D33,$0911,$04EF,$808A,$8027,$001C,$0000,$02F9
PhotoPaletteWSH:	; the 16 colours of the Washington player photos (the photo palette table in bank $9D)
	dw $7C1F,$4EFE,$C6BD,$BE7B,$3239,$29F8,$9DB6,$9575
	dw $0D33,$0911,$04EF,$808A,$8027,$739C,$801C,$5400
PhotoPaletteWPG:	; the 16 colours of the Winnipeg player photos (the photo palette table in bank $9D)
	dw $7C1F,$4EFE,$C6BD,$BE7B,$3239,$29F8,$9DB6,$9575
	dw $0D33,$0911,$04EF,$808A,$8027,$739C,$D400,$001C
LogoPaletteBOS:		; the 16 colours of the Boston logo (TeamLogoSprites and the centre ice logo)
	dw $0000,$7FFF,$8000,$02FB,$8277,$037F,$0000,$1CE7
	dw $A529,$318C,$B9CE,$C631,$4E73,$5AD6,$E318,$6F7B
LogoPaletteNYI:		; the 16 colours of the New York Islanders logo (TeamLogoSprites and the centre ice logo)
	dw $0000,$7FFF,$E318,$4631,$3C00,$5800,$2000,$0000
	dw $35BF,$801F,$0019,$0016,$0013,$0010,$000D,$000B
LogoPaletteANA:		; the 16 colours of the Anaheim logo (TeamLogoSprites and the centre ice logo)
	dw $7C1F,$3A20,$29E0,$BE20,$4A52,$6739,$03E0,$837C
	dw $037D,$03E0,$FFFF,$DEF7,$83E0,$8000,$03E0,$83E0
LogoPaletteDAL:		; the 16 colours of the Dallas logo (TeamLogoSprites and the centre ice logo)
	dw $0000,$0F26,$0AC4,$8682,$8241,$0200,$0140,$7FFF
	dw $EB5A,$5EF7,$81D2,$8235,$0297,$82FA,$837C,$03FF
LogoPaletteMTL:		; the 16 colours of the Montreal logo (TeamLogoSprites and the centre ice logo)
	dw $0000,$0013,$0017,$0012,$000E,$7FFF,$EB5A,$5294
	dw $BDEF,$A94A,$1084,$8000,$6610,$6400,$4800,$3400
DATA8_9AEE1C:		; 16 colours, not packed, used by routines in bank $9F; not identified yet
	dw $0000,$49FF,$011C,$00FB,$00FA,$00D9,$00D9,$00D8
	dw $00B8,$00B7,$00B6,$00B6,$0095,$0095,$0094,$0094
DATA8_9AEE3C:		; 16 colours, not packed, used by routines in bank $9F; not identified yet
	dw $0000,$49FF,$011C,$00FB,$00FA,$00D9,$00D9,$00D8
	dw $00B8,$00B7,$00B6,$00B6,$0095,$0095,$0094,$0094
DATA8_9AEE5C:		; 16 colours, not packed, used by routines in bank $9F; not identified yet
	dw $7EEE,$71A8,$7C00,$7800,$7400,$7000,$7000,$6C00
	dw $6800,$6400,$6000,$5C00,$5800,$5400,$5000,$5000
DATA8_9AEE7C:		; 16 colours, not packed, used by routines in bank $9F; not identified yet
	dw $0000,$4000,$7000,$739C,$5108,$4084,$4E73,$011C
	dw $0094,$0000,$4800,$2D6B,$0000,$0000,$0000,$0000
LogoPaletteNJD:		; the 16 colours of the New Jersey logo (TeamLogoSprites and the centre ice logo)
	dw $0000,$001F,$001C,$0019,$0017,$0012,$000E,$000A
	dw $0000,$18C6,$A94A,$35AD,$C631,$56B5,$E318,$7FFF
LogoPaletteNYR:		; the 16 colours of the New York Rangers logo (TeamLogoSprites and the centre ice logo)
	dw $0000,$001D,$5CA0,$FFFF,$EE28,$0018,$0010,$4C40
	dw $3400,$65E5,$C942,$6B5A,$56B5,$C210,$2D6B,$1CE7
LogoPaletteOTT:		; the 16 colours of the Ottawa logo (TeamLogoSprites and the centre ice logo)
	dw $0000,$7FFF,$DAD6,$9D2D,$15D1,$9AD9,$8000,$001F
	dw $0019,$0011,$056E,$3DEF,$98C6,$8CA9,$FC1F,$7C1F
DATA8_9AEEFC:		; 16 colours: the logo colours of an all-star team (26 or 27 of the logo palette table in
			;   bank $9C)
	dw $0000,$0000,$0C9F,$845C,$001A,$0017,$0015,$0012
	dw $0010,$7FFF,$EF7B,$5EF7,$CA52,$39CE,$A94A,$18C6
DATA8_9AEF1C:		; 16 colours: the logo colours of an all-star team (26 or 27 of the logo palette table in
			;   bank $9C)
	dw $0000,$0000,$0C9F,$845C,$001A,$0017,$0015,$0012
	dw $0010,$7FFF,$EF7B,$5EF7,$CA52,$39CE,$A94A,$18C6
LogoPalettePHI:		; the 16 colours of the Philadelphia logo (TeamLogoSprites and the centre ice logo)
	dw $0000,$7FFF,$F39C,$E318,$5294,$C631,$35AD,$A94A
	dw $1CE7,$8C63,$0000,$0010,$0016,$0019,$001C,$001F
	dw $0000,$6F7B,$0421,$0842,$1084,$94A5,$9CE7,$A529
	dw $2F9F,$A73C,$1EDA,$9697,$8E35,$05F2,$8190,$831A
LogoPalettePIT:		; the 16 colours of the Pittsburgh logo (TeamLogoSprites and the centre ice logo)
	dw $0000,$0F3D,$0AFB,$86BA,$8698,$8256,$0214,$01F3
	dw $FFFF,$EB5A,$56B5,$C210,$318C,$A529,$14A5,$8000
LogoPaletteBUF:		; the 16 colours of the Buffalo logo (TeamLogoSprites and the centre ice logo)
	dw $0000,$7FFF,$F39C,$E739,$5AD6,$D294,$939F,$92FB
	dw $8297,$8256,$0235,$7F72,$6E6B,$5966,$4882,$B400
LogoPaletteQUE:		; the 16 colours of the Quebec logo (TeamLogoSprites and the centre ice logo)
	dw $0000,$4000,$5800,$7C00,$001F,$0018,$0010,$000D
	dw $108E,$A950,$4A52,$7FFF,$EF7B,$5AD6,$CA52,$2D6B
LogoPaletteCGY:		; the 16 colours of the Calgary logo (TeamLogoSprites and the centre ice logo)
	dw $0000,$0093,$829A,$8215,$033D,$00BA,$809F,$FFFF
	dw $EB5A,$56B5,$FC1F,$7C1F,$7C1F,$7C1F,$7C1F,$7C1F
LogoPaletteSJS:		; the 16 colours of the San Jose logo (TeamLogoSprites and the centre ice logo)
	dw $0000,$14A5
