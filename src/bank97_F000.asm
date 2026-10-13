; Bank $97, last 4 KB: the end of DATA8_97EDBC, then DATA8_97F023, a player photo, then DATA8_97F28A, a player photo,
; then DATA8_97F4F1, a song from the TeamSongs table (laid out as in bank81_F000), then DATA8_97F757, a player photo,
; then DATA8_97F9BC, a player photo, then DATA8_97FC21, a song from the TeamSongs table (laid out as in bank81_F000),
; then CenterIceTilesTBL, the Tampa Bay centre ice logo tiles.

org $97F000
	incbin "../Extracted/data/DATA8_97EDBC.lin.huf":580..615
DATA8_97F023:		; a player photo: 6 x 6 linear 4bpp tiles packed for DecompressHuffman, one entry of the photo table
			;   in bank $9D
	db $30,$FB
	db $00,$04,$80
	incbin "../Extracted/data/DATA8_97F023.lin.huf":5..615
DATA8_97F28A:		; a player photo: 6 x 6 linear 4bpp tiles packed for DecompressHuffman, one entry of the photo table
			;   in bank $9D
	db $30,$FB
	db $00,$04,$80
	incbin "../Extracted/data/DATA8_97F28A.lin.huf":5..615
DATA8_97F4F1:		; a song (see bank81_F000): header, track offsets ($0000 ends them), padding, then the tracks
	db $01,$78,$01,$00,$00,$00,$02,$00
	dw .left-DATA8_97F4F1,.right-DATA8_97F4F1,$0000
	db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	db $01,$5A,"TRAK"
.left:
	db $00,$E7,$05,"left",$00
	db $00,$DC,$0B,$01,$A4,$6E,$02,$0B,$A8,$6E,$02,$0B,$A9,$6E,$01,$0C
	db $AB,$6E,$24,$00,$A8,$6E,$27,$15,$8B,$6E,$06,$15,$89,$6E,$0A,$0B
	db $A4,$6E,$01,$0A,$93,$6E,$03,$00,$A8,$6E,$01,$0B,$A9,$6E,$01,$0B
	db $AB,$6E,$23,$00,$A8,$6E,$25,$14,$8B,$6E,$05,$16,$89,$6E,$06,$0B
	db $A4,$6E,$02,$09,$87,$6E,$02,$01,$A8,$6E,$02,$09,$A9,$6E,$02,$0C
	db $A8,$6E,$08,$00,$AB,$6E,$0E,$15,$A8,$6E,$10,$00,$A4,$6E,$0C,$17
	db $9F,$6E,$0C,$00,$A4,$6E,$0D,$15,$A8,$6E,$0E,$00,$A4,$6E,$0D,$16
	db $91,$6E,$06,$00,$A6,$6E,$25,$0B,$A1,$6E,$01,$09,$90,$6E,$05,$08
	db $A1,$6E,$01,$0E,$9F,$6E,$05,$00,$A3,$6E,$05,$0A,$A8,$6E,$02,$00
	db $A3,$6E,$02,$0B,$A3,$6E,$03,$00,$A8,$6E,$05,$0A,$A6,$6E,$02,$0C
	db $A4,$6E,$11,$00,$9F,$6E,$11,$16,$98,$6E,$0A,$09,$A4,$6E,$02,$0D
	db $A8,$6E,$0D,$00,$A4,$6E,$0C,$14,$AB,$6E,$0B,$00,$A8,$6E,$0C,$01
	db $8B,$6E,$0A,$14,$AB,$6E,$02,$00,$A8,$6E,$02,$0C,$A4,$6E,$20,$00
	db $A9,$6E,$26,$0C,$95,$6E,$0C,$16,$94,$6E,$0C,$15,$A8,$6E,$06,$00
	db $A4,$6E,$0A,$0B,$A9,$6E,$06,$0B,$AB,$6E,$17,$00,$A8,$6E,$1E,$16
	db $87,$6E,$1D,$15,$A8,$6E,$18,$00,$AC,$6E,$19,$18,$87,$6E,$1D,$13
	db $A9,$6E,$19,$00,$AD,$6E,$19,$1A,$87,$6E,$1C,$14,$AB,$6E,$22,$00
	db $AF,$6E,$1D,$19,$87,$6E,$0A,$17,$B0,$6E,$0D,$17,$B2,$6E,$04,$14
	db $B0,$6E,$04,$00,$B3,$6E,$05,$0F,$B0,$6E,$04,$00,$B3,$6E,$04,$0E
	db $B0,$6E,$05,$00,$B3,$6E,$05,$0E,$B4,$6E,$42,$00,$B0,$6E,$43,$43
	db $D9,$00,$00,$00,$00,$00,$00,$00,$00,$66,$00,$00
	db $00,$E4,"TRAK"
.right:
	db $00,$E7,$06,"right",$00
	db $00,$DC,$0C,$23,$A4,$6E,$22,$00,$8C,$6E,$07,$3F,$87,$6E,$02,$16
	db $A4,$6E,$22,$00,$8C,$6E,$07,$54,$A4,$6E,$05,$00,$8C,$6E,$08,$15
	db $9F,$6E,$0A,$00,$8B,$6E,$07,$17,$95,$6E,$06,$00,$89,$6E,$06,$15
	db $9F,$6E,$09,$00,$87,$6E,$08,$16,$85,$6E,$08,$0B,$9D,$6E,$01,$09
	db $84,$6E,$05,$08,$9D,$6E,$01,$0E,$8E,$6E,$03,$00,$82,$6E,$0A,$0A
	db $9F,$6E,$02,$0B,$9F,$6E,$02,$00,$82,$6E,$02,$0A,$9F,$6E,$01,$0C
	db $98,$6E,$0C,$00,$8C,$6E,$0A,$2C,$9F,$6E,$0B,$00,$8B,$6E,$0A,$14
	db $A4,$6E,$0B,$15,$A4,$6E,$01,$00,$89,$6E,$0A,$0C,$A1,$6E,$10,$0C
	db $89,$6E,$09,$16,$88,$6E,$0C,$15,$A0,$6E,$06,$00,$88,$6E,$0A,$16
	db $A4,$6E,$1D,$00,$87,$6E,$0B,$2B,$A4,$6E,$1E,$2B,$A4,$6E,$18,$00
	db $93,$6E,$15,$2E,$A9,$6E,$1F,$00,$93,$6E,$1F,$30,$98,$6E,$81,$06
	db $17,$B0,$6E,$03,$14,$8C,$6E,$05,$0F,$8C,$6E,$05,$0E,$8C,$6E,$04
	db $0E,$AB,$6E,$42,$00,$8C,$6E,$44,$44,$D9,$00,$00,$00,$00,$00,$00
	db $00,$00,$0C
DATA8_97F757:		; a player photo: 6 x 6 linear 4bpp tiles packed for DecompressHuffman, one entry of the photo table
			;   in bank $9D
	db $30,$FB
	db $00,$04,$80
	incbin "../Extracted/data/DATA8_97F757.lin.huf":5..613
DATA8_97F9BC:		; a player photo: 6 x 6 linear 4bpp tiles packed for DecompressHuffman, one entry of the photo table
			;   in bank $9D
	db $30,$FB
	db $00,$04,$80
	incbin "../Extracted/data/DATA8_97F9BC.lin.huf":5..613
DATA8_97FC21:		; a song (see bank81_F000): header, track offsets ($0000 ends them), padding, then the tracks
	db $01,$78,$01,$00,$00,$00,$02,$00
	dw .left-DATA8_97FC21,.right-DATA8_97FC21,$0000
	db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	db $01,$1E,"TRAK"
.left:
	db $00,$E7,$05,"left",$00
	db $00,$DC,$0B,$00,$A4,$6E,$0B,$00,$9F,$6E,$0B,$27,$A4,$6E,$0C,$00
	db $9F,$6E,$0D,$23,$9F,$6E,$0E,$00,$A4,$6E,$0F,$22,$9F,$6E,$12,$00
	db $A4,$6E,$14,$1F,$A5,$6E,$0C,$00,$A0,$6E,$0D,$1F,$A5,$6E,$0A,$00
	db $A0,$6E,$0C,$1E,$A5,$6E,$09,$00,$A0,$6E,$0A,$1D,$A5,$6E,$17,$00
	db $A0,$6E,$1A,$1C,$A1,$6E,$0D,$00,$A6,$6E,$0B,$1E,$A6,$6E,$09,$00
	db $A1,$6E,$0A,$1C,$A6,$6E,$0B,$00,$A1,$6E,$0C,$1B,$A6,$6E,$0F,$00
	db $A1,$6E,$0E,$1C,$A7,$6E,$0C,$00,$A2,$6E,$0E,$1C,$A7,$6E,$0B,$00
	db $A2,$6E,$0B,$1B,$A2,$6E,$0C,$00,$A7,$6E,$0A,$1B,$A7,$6E,$10,$00
	db $A2,$6E,$14,$1A,$A3,$6E,$09,$00,$A8,$6E,$09,$1A,$A3,$6E,$09,$00
	db $A8,$6E,$09,$1B,$A3,$6E,$0A,$00,$A8,$6E,$0A,$19,$A8,$6E,$0A,$00
	db $A3,$6E,$09,$1A,$A9,$6E,$08,$00,$A4,$6E,$0A,$18,$A4,$6E,$08,$00
	db $A9,$6E,$08,$19,$A4,$6E,$09,$00,$A9,$6E,$09,$18,$A4,$6E,$08,$00
	db $A9,$6E,$08,$17,$AA,$6E,$07,$00,$A5,$6E,$07,$17,$A5,$6E,$07,$00
	db $AA,$6E,$07,$16,$AA,$6E,$07,$00,$A5,$6E,$06,$16,$A5,$6E,$05,$00
	db $AA,$6E,$06,$14,$A6,$6E,$06,$00,$AB,$6E,$06,$14,$AB,$6E,$07,$00
	db $A6,$6E,$06,$13,$A6,$6E,$07,$00,$AB,$6E,$07,$11,$AB,$6E,$07,$00
	db $A6,$6E,$07,$07,$D9,$00,$00,$00,$00,$00,$00,$00,$00,$9F,$00,$00
	db $01,$1E,"TRAK"
.right:
	db $00,$E7,$06,"right",$00
	db $00,$DC,$0C,$00,$9C,$6E,$0B,$00,$8C,$6E,$0C,$27,$9C,$6E,$0D,$00
	db $8C,$6E,$0C,$23,$8C,$6E,$0D,$00,$9C,$6E,$0E,$22,$8C,$6E,$19,$00
	db $9C,$6E,$15,$1F,$9D,$6E,$0C,$00,$8D,$6E,$0F,$1F,$8D,$6E,$0E,$00
	db $9D,$6E,$0B,$1E,$8D,$6E,$0B,$00,$9D,$6E,$0A,$1D,$8D,$6E,$16,$00
	db $9D,$6E,$14,$1C,$8E,$6E,$0D,$00,$9E,$6E,$0D,$1E,$8E,$6E,$0C,$00
	db $9E,$6E,$0B,$1C,$8E,$6E,$0B,$00,$9E,$6E,$0C,$1B,$9E,$6E,$0F,$00
	db $8E,$6E,$18,$1C,$8F,$6E,$0C,$00,$9F,$6E,$0C,$1C,$8F,$6E,$0C,$00
	db $9F,$6E,$0C,$1B,$9F,$6E,$0B,$00,$8F,$6E,$0B,$1B,$9F,$6E,$0D,$00
	db $8F,$6E,$0C,$1A,$90,$6E,$0E,$00,$A0,$6E,$09,$1A,$A0,$6E,$09,$00
	db $90,$6E,$0B,$1B,$A0,$6E,$0A,$00,$90,$6E,$0A,$19,$90,$6E,$09,$00
	db $A0,$6E,$09,$1A,$A1,$6E,$0A,$00,$91,$6E,$0A,$18,$91,$6E,$09,$00
	db $A1,$6E,$08,$19,$91,$6E,$07,$00,$A1,$6E,$08,$18,$91,$6E,$08,$00
	db $A1,$6E,$09,$17,$A2,$6E,$07,$00,$92,$6E,$08,$17,$A2,$6E,$07,$00
	db $92,$6E,$08,$16,$92,$6E,$08,$00,$A2,$6E,$06,$16,$92,$6E,$08,$00
	db $A2,$6E,$06,$14,$93,$6E,$07,$00,$A3,$6E,$06,$14,$93,$6E,$08,$00
	db $A3,$6E,$06,$13,$93,$6E,$07,$00,$A3,$6E,$07,$11,$A3,$6E,$08,$00
	db $93,$6E,$07,$08,$D9,$00,$00,$00,$00,$00,$00,$00,$00
CenterIceTilesTBL:	; the Tampa Bay centre ice logo: linear 4bpp tiles packed for DecompressHuffman (team 21 of
			;   the centre ice table in bank $9C)
	db $30,$FB
	db $00,$03,$C0
	incbin "../Extracted/data/CenterIceTBL.lin.huf":5..363
	db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
