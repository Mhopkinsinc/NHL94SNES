; Bank $98, seventh 4 KB: the end of DATA8_98DF46, then DATA8_98E18A, a player photo, then DATA8_98E3CD, a player
; photo, then DATA8_98E610, a player photo, then DATA8_98E853, a player photo, then DATA8_98EA95, a player photo, then
; DATA8_98ECD6, a player photo, then the start of DATA8_98EF17, a player photo.

org $98E000
	db $06,$15,$A8,$6E,$03,$00,$AB,$6E,$06,$17,$A6,$6E,$15,$00
	db $AB,$6E,$13,$29,$A7,$6E,$07,$00,$AC,$6E,$06,$15,$A7,$6E,$06,$00
	db $A4,$6E,$06,$15,$A7,$6E,$0B,$00,$AC,$6E,$0A,$28,$A7,$6E,$07,$00
	db $AC,$6E,$09,$15,$A9,$6E,$06,$00,$AC,$6E,$07,$15,$A7,$6E,$10,$00
	db $AC,$6E,$10,$29,$AD,$6E,$06,$00,$A8,$6E,$08,$14,$A8,$6E,$08,$00
	db $A5,$6E,$07,$16,$AD,$6E,$08,$00,$A8,$6E,$09,$27,$AD,$6E,$09,$00
	db $A8,$6E,$09,$13,$AA,$6E,$08,$00,$AD,$6E,$08,$13,$AD,$6E,$0B,$00
	db $A8,$6E,$0B,$0B,$D9,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	db $01,$0E,"TRAK"
.right:
	db $00,$E7,$06,"right",$00
	db $00,$DC,$0C,$01,$A1,$6E,$08,$00,$9D,$6E,$08,$13,$9D,$6E,$07,$00
	db $8C,$6E,$0A,$16,$A1,$6E,$0B,$00,$9D,$6E,$0A,$2B,$A1,$6E,$07,$00
	db $91,$6E,$09,$15,$A2,$6E,$08,$00,$91,$6E,$08,$18,$A1,$6E,$17,$00
	db $91,$6E,$17,$2B,$A2,$6E,$08,$00,$9E,$6E,$07,$16,$9E,$6E,$06,$00
	db $8D,$6E,$06,$15,$A2,$6E,$0C,$00,$9E,$6E,$0B,$2A,$A2,$6E,$07,$00
	db $9E,$6E,$08,$16,$A3,$6E,$05,$00,$9E,$6E,$06,$16,$A2,$6E,$17,$00
	db $9E,$6E,$16,$29,$A3,$6E,$08,$00,$9F,$6E,$08,$14,$9F,$6E,$07,$00
	db $8E,$6E,$0B,$16,$A3,$6E,$0C,$00,$9F,$6E,$0B,$29,$A3,$6E,$06,$00
	db $9F,$6E,$06,$15,$A4,$6E,$05,$00,$9F,$6E,$03,$17,$A3,$6E,$15,$00
	db $9F,$6E,$14,$29,$A4,$6E,$08,$00,$A0,$6E,$07,$15,$A0,$6E,$06,$00
	db $8F,$6E,$05,$15,$A4,$6E,$0A,$00,$A0,$6E,$09,$28,$A4,$6E,$06,$00
	db $A0,$6E,$06,$15,$A5,$6E,$06,$00,$A0,$6E,$06,$15,$A4,$6E,$0F,$00
	db $A0,$6E,$10,$29,$A5,$6E,$07,$00,$A1,$6E,$07,$14,$A1,$6E,$07,$00
	db $90,$6E,$08,$16,$A5,$6E,$09,$00,$A1,$6E,$08,$27,$A5,$6E,$06,$00
	db $A1,$6E,$09,$13,$A6,$6E,$09,$00,$A1,$6E,$09,$13,$A5,$6E,$0B,$00
	db $A1,$6E,$0B,$0B,$D9,$00,$00,$00,$00,$00,$00,$00,$00
DATA8_98E18A:		; a player photo: 6 x 6 linear 4bpp tiles packed for DecompressHuffman, one entry of the photo table
			;   in bank $9D
	db $30,$FB
	db $00,$04,$80
	incbin "../Extracted/data/DATA8_98E18A.lin.huf":5..579
DATA8_98E3CD:		; a player photo: 6 x 6 linear 4bpp tiles packed for DecompressHuffman, one entry of the photo table
			;   in bank $9D
	db $30,$FB
	db $00,$04,$80
	incbin "../Extracted/data/DATA8_98E3CD.lin.huf":5..579
DATA8_98E610:		; a player photo: 6 x 6 linear 4bpp tiles packed for DecompressHuffman, one entry of the photo table
			;   in bank $9D
	db $30,$FB
	db $00,$04,$80
	incbin "../Extracted/data/DATA8_98E610.lin.huf":5..579
DATA8_98E853:		; a player photo: 6 x 6 linear 4bpp tiles packed for DecompressHuffman, one entry of the photo table
			;   in bank $9D
	db $30,$FB
	db $00,$04,$80
	incbin "../Extracted/data/DATA8_98E853.lin.huf":5..578
DATA8_98EA95:		; a player photo: 6 x 6 linear 4bpp tiles packed for DecompressHuffman, one entry of the photo table
			;   in bank $9D
	db $30,$FB
	db $00,$04,$80
	incbin "../Extracted/data/DATA8_98EA95.lin.huf":5..577
DATA8_98ECD6:		; a player photo: 6 x 6 linear 4bpp tiles packed for DecompressHuffman, one entry of the photo table
			;   in bank $9D
	db $30,$FB
	db $00,$04,$80
	incbin "../Extracted/data/DATA8_98ECD6.lin.huf":5..577
DATA8_98EF17:		; a player photo: 6 x 6 linear 4bpp tiles packed for DecompressHuffman, one entry of the photo table
			;   in bank $9D
	db $30,$FB
	db $00,$04,$80
	incbin "../Extracted/data/DATA8_98EF17.lin.huf":5..233
