; Bank $9A, fourth 4 KB: the end of DATA8_9AAF99, then DATA8_9AB13D, a player photo, then DATA8_9AB2DF, a song from
; the TeamSongs table (laid out as in bank81_F000), then CenterIceTilesANA, the Anaheim centre ice logo tiles, then
; DATA8_9AB610, a Huffman-packed block, then DATA8_9AB7A1, a packed 32 x 28 map, then DATA8_9AB931, a song from the
; TeamSongs table (laid out as in bank81_F000), then DATA8_9ABA95, a packed 32 x 28 map, then CenterIceTilesNJD, the
; New Jersey centre ice logo tiles, then DATA8_9ABD3D, a 76 x 2 map, then CenterIceTilesWPG, the Winnipeg centre ice
; logo tiles, then the start of CenterIceTilesBOS, the Boston centre ice logo tiles.

org $9AB000
	db $1A
	db $9B,$74,$0C,$18,$9C,$72,$0C,$18,$97,$6E,$0D,$18,$99,$73,$0A,$17
	db $9B,$74,$0B,$17,$9D,$6E,$0C,$16,$98,$73,$0C,$17,$9A,$73,$0C,$15
	db $9C,$74,$0B,$17,$9D,$70,$0C,$16,$98,$73,$0C,$16,$9A,$74,$0B,$15
	db $9C,$74,$0D,$15,$9E,$74,$0A,$14,$99,$74,$0A,$15,$9B,$74,$0B,$14
	db $9D,$6B,$0B,$14,$9E,$74,$09,$14,$99,$74,$0A,$14,$9B,$74,$0B,$13
	db $9D,$68,$0F,$15,$9E,$74,$0E,$32,$A5,$74,$09,$09,$AA,$6F,$09,$09
	db $AE,$72,$0A,$0C,$B1,$6F,$08,$1A,$AE,$6F,$0A,$0B,$AE,$73,$60,$00
	db $B1,$73,$60,$00,$AA,$74,$61,$62,$D9,$00,$00,$00,$00,$00,$00,$00
	db $00,$9C,$00,$00
	db $00,$BA,"TRAK"
.right:
	db $00,$E7,$06,"right",$00
	db $00,$DC,$0C,$08,$8F,$7C,$13,$1F,$8A,$7D,$11,$1D,$8C,$77,$0F,$1E
	db $8E,$75,$0F,$1C,$8F,$7F,$0E,$1D,$8A,$7F,$0B,$1B,$8C,$74,$0F,$1C
	db $8E,$71,$0E,$1A,$90,$79,$0F,$1A,$8B,$72,$0E,$1A,$8D,$7D,$0D,$1A
	db $8F,$7F,$0C,$18,$90,$79,$0C,$18,$8B,$75,$0D,$18,$8D,$7A,$0A,$17
	db $8F,$7F,$0B,$17,$91,$74,$0C,$16,$8C,$7A,$0C,$17,$8E,$7A,$0C,$15
	db $90,$7C,$0B,$17,$91,$77,$0C,$16,$8C,$7A,$0C,$16,$8E,$7B,$0B,$15
	db $90,$7D,$0D,$15,$92,$7D,$0A,$14,$8D,$7F,$0A,$15,$8F,$7F,$0B,$14
	db $91,$71,$0B,$14,$92,$7F,$09,$14,$8D,$7F,$0A,$14,$8F,$7D,$0B,$13
	db $91,$6E,$0F,$15,$92,$7F,$0E,$32,$99,$7D,$09,$09,$9E,$76,$09,$09
	db $A2,$79,$0A,$0C,$A5,$76,$08,$1A,$A2,$76,$0A,$0B,$92,$7B,$61,$62
	db $D9,$00,$00,$00,$00,$00,$00,$00,$00
DATA8_9AB13D:		; a player photo: 6 x 6 linear 4bpp tiles packed for DecompressHuffman, one entry of the photo table
			;   in bank $9D
	db $30,$FB
	db $00,$04,$80
	incbin "data/gfx/DATA8_9AB13D.lin.huf":5..418
DATA8_9AB2DF:		; a song (see bank81_F000): header, track offsets ($0000 ends them), padding, then the tracks
	db $01,$78,$01,$00,$00,$00,$02,$00
	dw .left-DATA8_9AB2DF,.right-DATA8_9AB2DF,$0000
	db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	db $00,$C6,"TRAK"
.left:
	db $00,$E7,$05,"left",$00
	db $00,$DC,$0B,$00,$B0,$23,$13,$00,$AB,$23,$16,$18,$AB,$23,$0A,$00
	db $A8,$23,$0A,$18,$A4,$23,$0F,$00,$98,$23,$10,$18,$A4,$23,$0B,$00
	db $98,$23,$0A,$18,$B0,$23,$12,$00,$AB,$23,$14,$18,$AB,$23,$09,$00
	db $A8,$23,$0A,$18,$A4,$23,$0A,$00,$98,$23,$0B,$18,$A4,$23,$09,$00
	db $98,$23,$08,$18,$B1,$23,$10,$00,$AC,$23,$12,$18,$AC,$23,$09,$00
	db $A9,$23,$09,$18,$A5,$23,$09,$18,$A5,$23,$09,$18,$B1,$23,$12,$00
	db $AC,$23,$12,$18,$AC,$23,$08,$00,$A9,$23,$08,$18,$A5,$23,$08,$00
	db $99,$23,$0A,$18,$A5,$23,$07,$00,$99,$23,$08,$18,$B2,$23,$11,$00
	db $AD,$23,$0F,$18,$AA,$23,$0C,$00,$AD,$23,$0C,$18,$A6,$23,$09,$18
	db $A6,$23,$07,$18,$B2,$23,$13,$00,$AD,$23,$14,$18,$AA,$23,$0D,$00
	db $AD,$23,$0D,$18,$A6,$23,$09,$18,$A6,$23,$09,$09,$D9,$00,$00,$00
	db $00,$00,$00,$00,$00,$8A,$00,$00
	db $00,$AE,"TRAK"
.right:
	db $00,$E7,$06,"right",$00
	db $00,$DC,$0C,$00,$A8,$6E,$15,$00,$98,$6E,$15,$18,$A4,$6E,$0A,$00
	db $98,$6E,$09,$18,$8C,$6E,$12,$18,$8C,$6E,$0A,$18,$A8,$6E,$13,$00
	db $98,$6E,$14,$18,$A4,$6E,$09,$00,$98,$6E,$0A,$18,$8C,$6E,$0C,$18
	db $8C,$6E,$08,$18,$A9,$6E,$11,$00,$99,$6E,$13,$18,$A5,$6E,$08,$00
	db $99,$6E,$0A,$18,$8D,$6E,$0C,$18,$8D,$6E,$08,$18,$A9,$6E,$11,$00
	db $99,$6E,$13,$18,$A5,$6E,$08,$00,$99,$6E,$0A,$18,$8D,$6E,$0D,$18
	db $8D,$6E,$07,$18,$AA,$6E,$10,$00,$9A,$6E,$12,$18,$A6,$6E,$0C,$00
	db $9A,$6E,$0D,$18,$8E,$6E,$0A,$18,$8E,$6E,$07,$18,$AA,$6E,$13,$00
	db $9A,$6E,$14,$18,$A6,$6E,$0C,$00,$9A,$6E,$0D,$18,$8E,$6E,$0A,$18
	db $8E,$6E,$07,$07,$D9,$00,$00,$00,$00,$00,$00,$00,$00
CenterIceTilesANA:	; the Anaheim centre ice logo: linear 4bpp tiles packed for DecompressHuffman (team 0 of
			;   the centre ice table in bank $9C)
	db $30,$FB
	db $00,$03,$60
	incbin "data/gfx/CenterIceANA.lin.huf":5..405
DATA8_9AB610:		; packed for DecompressHuffman, unpacked into a RAM buffer by screen setups in bank $9D; not identified yet
	db $30,$FB
	db $00,$06,$40
	incbin "data/gfx/DATA8_9AB610.huf":5..401
DATA8_9AB7A1:		; a 32 x 28 map packed for DecompressHuffman (width, height, $0308, then the map words), read
			;   by a screen setup in bank $9D; not identified yet
	db $30,$FB
	db $00,$07,$06
	incbin "data/gfx/DATA8_9AB7A1.map.huf":5..400
DATA8_9AB931:		; a song (see bank81_F000): header, track offsets ($0000 ends them), padding, then the tracks
	db $01,$78,$01,$00,$00,$00,$02,$00
	dw .left-DATA8_9AB931,.right-DATA8_9AB931,$0000
	db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	db $00,$9E,"TRAK"
.left:
	db $00,$E7,$05,"left",$00
	db $00,$DC,$0B,$01,$9F,$75,$05,$06,$A4,$75,$05,$06,$A8,$75,$07,$08
	db $AB,$75,$06,$12,$A8,$75,$07,$08,$AB,$75,$43,$44,$A8,$75,$39,$00
	db $A4,$75,$39,$4B,$A0,$75,$05,$06,$A5,$75,$05,$06,$A9,$75,$07,$08
	db $AC,$75,$06,$12,$A9,$75,$07,$08,$AC,$75,$43,$44,$A9,$75,$39,$00
	db $A5,$75,$39,$50,$A1,$75,$05,$06,$A6,$75,$05,$06,$AA,$75,$07,$08
	db $AD,$75,$06,$12,$AA,$75,$07,$08,$AD,$75,$43,$44,$AA,$75,$39,$00
	db $A6,$75,$39,$4E,$A2,$75,$05,$06,$A7,$75,$05,$06,$AB,$75,$07,$08
	db $AE,$75,$06,$12,$AB,$75,$07,$08,$AE,$75,$43,$44,$AB,$75,$39,$00
	db $A7,$75,$39,$39,$D9,$00,$00,$00,$00,$00,$00,$00,$00,$8E,$00,$00
	db $00,$9E,"TRAK"
.right:
	db $00,$E7,$06,"right",$00
	db $00,$DC,$0C,$01,$93,$75,$05,$06,$98,$75,$05,$06,$9C,$75,$07,$08
	db $9F,$75,$06,$12,$9C,$75,$07,$08,$9F,$75,$43,$44,$9F,$75,$37,$00
	db $98,$75,$2D,$4B,$94,$75,$05,$06,$99,$75,$05,$06,$9D,$75,$07,$08
	db $A0,$75,$06,$12,$9D,$75,$07,$08,$A0,$75,$43,$44,$A0,$75,$37,$00
	db $99,$75,$2D,$50,$95,$75,$05,$06,$9A,$75,$05,$06,$9E,$75,$07,$08
	db $A1,$75,$06,$12,$9E,$75,$07,$08,$A1,$75,$43,$44,$A1,$75,$37,$00
	db $9A,$75,$2D,$4E,$96,$75,$05,$06,$9B,$75,$05,$06,$9F,$75,$07,$08
	db $A2,$75,$06,$12,$9F,$75,$07,$08,$A2,$75,$43,$44,$A2,$75,$37,$00
	db $9B,$75,$2D,$37,$D9,$00,$00,$00,$00,$00,$00,$00,$00
DATA8_9ABA95:		; a 32 x 28 map packed for DecompressLZ (width, height, $0308, then the map words), read
			;   by screen setups in banks $9B and $9D; not identified yet
	db $10,$FB
	db $00,$07,$06
	incbin "data/gfx/DATA8_9ABA95.map.lz":5..352
CenterIceTilesNJD:	; the New Jersey centre ice logo: linear 4bpp tiles packed for DecompressHuffman (team 12 of
			;   the centre ice table in bank $9C)
	db $30,$FB
	db $00,$03,$20
	incbin "data/gfx/CenterIceNJD.lin.huf":5..328
DATA8_9ABD3D:		; a map, not packed: width, height and a word, then the map words (76 x 2); not identified yet
	dw $004C,$0002,$0308
	dw $0001,$0002,$0003,$0004,$0005,$0006,$0007,$0002
	dw $0003,$0008,$0003,$0008,$0009,$000A,$000B,$000C
	dw $000D,$000E,$000D,$000F,$0010,$000D,$000E,$0011
	dw $0012,$0013,$000C,$0005,$0014,$0015,$0002,$0005
	dw $0014,$0003,$0016,$0017,$0018,$0019,$001A,$000D
	dw $000D,$000D,$000D,$001B,$000D,$001C,$0010,$001D
	dw $001E,$001F,$0020,$0421,$0422,$0423,$0424,$0425
	dw $0424,$0425,$0426,$0427,$0428,$0429,$0428,$0429
	dw $042A,$0422,$0428,$0425,$0428,$0425,$000E,$000E
	dw $000E,$002B,$000E,$000E,$002C,$002D,$8003,$8004
	dw $8005,$8006,$8007,$8002,$8003,$8008,$800B,$002E
	dw $002F,$0030,$800B,$800C,$800D,$0031,$8014,$800F
	dw $8010,$8007,$0032,$801B,$800D,$0033,$0034,$8005
	dw $8014,$002C,$0035,$0036,$0037,$0038,$0039,$003A
	dw $8016,$003B,$003C,$8005,$8014,$003D,$003E,$8011
	dw $8012,$801C,$8010,$003F,$0040,$0041,$0042,$0443
	dw $0444,$0445,$0446,$0447,$0448,$0449,$044A,$044B
	dw $0448,$0449,$0446,$0449,$0000,$044C,$0446,$0449
	dw $0448,$0449,$000E,$000E,$004D,$004E,$000E,$000E
CenterIceTilesWPG:	; the Winnipeg centre ice logo: linear 4bpp tiles packed for DecompressHuffman (team 25 of
			;   the centre ice table in bank $9C)
	db $30,$FB
	db $00,$03,$A0
	incbin "data/gfx/CenterIceWPG.lin.huf":5..302
CenterIceTilesBOS:	; the Boston centre ice logo: linear 4bpp tiles packed for DecompressHuffman (team 1 of
			;   the centre ice table in bank $9C)
	db $30,$FB
	db $00,$03,$20
	incbin "data/gfx/CenterIceBOS.lin.huf":5..95
