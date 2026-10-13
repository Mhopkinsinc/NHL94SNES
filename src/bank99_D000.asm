; Bank $99, sixth 4 KB: the end of DATA8_99CEDE, then DATA8_99D102, a player photo, then DATA8_99D325, a player photo,
; then DATA8_99D545, a player photo, then DATA8_99D765, a song from the TeamSongs table (laid out as in bank81_F000),
; then DATA8_99D981, a player photo, then DATA8_99DB9B, a player photo, then DATA8_99DDB5, a player photo, then the
; start of DATA8_99DFCF, a player photo.

org $99D000
	db $00,$00,$00,$96,$00,$00
	db $00,$FE,"TRAK"
.right:
	db $00,$E7,$06,"right",$00
	db $00,$DC,$0C,$00,$A3,$6E,$13,$00,$93,$6E,$13,$2A,$A3,$6E,$15,$00
	db $93,$6E,$15,$26,$93,$6E,$17,$00,$A3,$6E,$17,$23,$93,$6E,$0A,$00
	db $A3,$6E,$0E,$10,$93,$6E,$09,$00,$A3,$6E,$0C,$11,$94,$6E,$11,$00
	db $A4,$6E,$10,$21,$94,$6E,$10,$00,$A4,$6E,$0F,$1D,$A4,$6E,$12,$00
	db $94,$6E,$10,$1E,$94,$6E,$08,$00,$A4,$6E,$0A,$10,$94,$6E,$0A,$00
	db $A4,$6E,$09,$0F,$95,$6E,$11,$00,$A5,$6E,$10,$1E,$A5,$6E,$0F,$00
	db $95,$6E,$10,$1B,$95,$6E,$12,$00,$A5,$6E,$14,$1C,$95,$6E,$07,$00
	db $A5,$6E,$0A,$0E,$95,$6E,$08,$00,$A5,$6E,$0B,$10,$96,$6E,$0C,$00
	db $A6,$6E,$0D,$1C,$96,$6E,$0D,$00,$A6,$6E,$0C,$1B,$96,$6E,$0B,$00
	db $A6,$6E,$10,$1A,$96,$6E,$07,$00,$A6,$6E,$0A,$0D,$96,$6E,$07,$00
	db $A6,$6E,$07,$0E,$97,$6E,$0E,$00,$A7,$6E,$0E,$19,$97,$6E,$0C,$00
	db $A7,$6E,$0F,$1B,$A7,$6E,$10,$00,$97,$6E,$0E,$1A,$A7,$6E,$08,$00
	db $97,$6E,$07,$0D,$97,$6E,$07,$00,$A7,$6E,$09,$0D,$98,$6E,$11,$00
	db $A8,$6E,$14,$1A,$98,$6E,$0D,$00,$A8,$6E,$10,$19,$A8,$6E,$12,$00
	db $98,$6E,$12,$12,$D9,$00,$00,$00,$00,$00,$00,$00,$00
DATA8_99D102:		; a player photo: 6 x 6 linear 4bpp tiles packed for DecompressHuffman, one entry of the photo table
			;   in bank $9D
	db $30,$FB
	db $00,$04,$80
	incbin "../Extracted/data/DATA8_99D102.lin.huf":5..547
DATA8_99D325:		; a player photo: 6 x 6 linear 4bpp tiles packed for DecompressHuffman, one entry of the photo table
			;   in bank $9D
	db $30,$FB
	db $00,$04,$80
	incbin "../Extracted/data/DATA8_99D325.lin.huf":5..543
	db $00
DATA8_99D545:		; a player photo: 6 x 6 linear 4bpp tiles packed for DecompressHuffman, one entry of the photo table
			;   in bank $9D
	db $30,$FB
	db $00,$04,$80
	incbin "../Extracted/data/DATA8_99D545.lin.huf":5..544
DATA8_99D765:		; a song (see bank81_F000): header, track offsets ($0000 ends them), padding, then the tracks
	db $01,$78,$01,$00,$00,$00,$02,$00
	dw .left-DATA8_99D765,.right-DATA8_99D765,$0000
	db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	db $01,$0E,"TRAK"
.left:
	db $00,$E7,$05,"left",$00
	db $00,$DC,$0B,$00,$9F,$6E,$1D,$1E,$A4,$6E,$02,$0B,$A4,$6E,$03,$0B
	db $A8,$6E,$03,$0C,$AB,$6E,$0A,$0B,$A8,$6E,$0A,$0B,$A4,$6E,$0B,$0D
	db $A3,$6E,$06,$17,$AD,$6E,$05,$00,$A9,$6E,$05,$0E,$AB,$6E,$07,$00
	db $A9,$6E,$07,$23,$A3,$6E,$03,$00,$9F,$6E,$03,$0A,$A3,$6E,$03,$00
	db $9F,$6E,$03,$0A,$A3,$6E,$03,$00,$A6,$6E,$03,$0C,$A9,$6E,$0A,$00
	db $A6,$6E,$0A,$0B,$A6,$6E,$09,$00,$A3,$6E,$06,$0B,$9F,$6E,$0A,$00
	db $A3,$6E,$0A,$0C,$9F,$6E,$03,$00,$A4,$6E,$05,$17,$AD,$6E,$06,$00
	db $A9,$6E,$06,$0D,$A8,$6E,$07,$00,$AB,$6E,$07,$17,$9F,$6E,$08,$0D
	db $9F,$6E,$03,$00,$A4,$6E,$03,$0A,$9F,$6E,$03,$00,$A4,$6E,$03,$0B
	db $A8,$6E,$03,$00,$A4,$6E,$03,$0B,$AB,$6E,$0B,$00,$A8,$6E,$0B,$0C
	db $A8,$6E,$09,$00,$A4,$6E,$09,$0A,$A4,$6E,$0B,$00,$9F,$6E,$0B,$0C
	db $A3,$6E,$06,$00,$9F,$6E,$06,$17,$AD,$6E,$06,$00,$A9,$6E,$07,$0D
	db $AB,$6E,$08,$00,$A9,$6E,$08,$20,$A3,$6E,$04,$0A,$A3,$6E,$05,$0B
	db $A6,$6E,$04,$0B,$A9,$6E,$09,$0A,$A6,$6E,$09,$0A,$A3,$6E,$0B,$0C
	db $A4,$6E,$05,$17,$AB,$6E,$07,$00,$A6,$6E,$07,$0D,$B0,$6E,$11,$00
	db $AB,$6E,$12,$12,$D9,$00,$00,$00,$00,$00,$00,$00,$00,$8F,$00,$00
	db $00,$E6,"TRAK"
.right:
	db $00,$E7,$06,"right",$00
	db $00,$DC,$0C,$1E,$98,$6E,$03,$0B,$98,$6E,$04,$0B,$9C,$6E,$02,$0C
	db $9F,$6E,$0A,$0B,$9C,$6E,$0A,$0B,$98,$6E,$0B,$0D,$97,$6E,$06,$17
	db $A4,$6E,$06,$00,$95,$6E,$04,$0E,$A3,$6E,$08,$00,$93,$6E,$06,$23
	db $93,$6E,$04,$0A,$93,$6E,$04,$0A,$9F,$6E,$03,$00,$97,$6E,$04,$0C
	db $A3,$6E,$0A,$00,$9F,$6E,$0A,$0B,$9D,$6E,$08,$0B,$97,$6E,$0A,$0C
	db $98,$6E,$04,$17,$A4,$6E,$06,$00,$8C,$6E,$06,$0D,$A4,$6E,$07,$00
	db $8C,$6E,$06,$24,$98,$6E,$03,$0A,$98,$6E,$04,$0B,$9F,$6E,$02,$00
	db $9C,$6E,$04,$0B,$A4,$6E,$0B,$00,$9F,$6E,$0B,$0C,$9F,$6E,$09,$00
	db $9C,$6E,$09,$0A,$9C,$6E,$0B,$00,$98,$6E,$0B,$0C,$97,$6E,$05,$17
	db $A4,$6E,$07,$00,$A1,$6E,$06,$0D,$A3,$6E,$08,$00,$9F,$6E,$08,$20
	db $97,$6E,$04,$0A,$97,$6E,$05,$0B,$9A,$6E,$04,$0B,$9D,$6E,$09,$0A
	db $9A,$6E,$09,$0A,$97,$6E,$0B,$0C,$98,$6E,$05,$17,$A3,$6E,$05,$00
	db $93,$6E,$09,$0D,$A8,$6E,$12,$00,$98,$6E,$12,$12,$D9,$00,$00,$00
	db $00,$00,$00,$00,$00
DATA8_99D981:		; a player photo: 6 x 6 linear 4bpp tiles packed for DecompressHuffman, one entry of the photo table
			;   in bank $9D
	db $30,$FB
	db $00,$04,$80
	incbin "../Extracted/data/DATA8_99D981.lin.huf":5..538
DATA8_99DB9B:		; a player photo: 6 x 6 linear 4bpp tiles packed for DecompressHuffman, one entry of the photo table
			;   in bank $9D
	db $30,$FB
	db $00,$04,$80
	incbin "../Extracted/data/DATA8_99DB9B.lin.huf":5..537
	db $00
DATA8_99DDB5:		; a player photo: 6 x 6 linear 4bpp tiles packed for DecompressHuffman, one entry of the photo table
			;   in bank $9D
	db $30,$FB
	db $00,$04,$80
	incbin "../Extracted/data/DATA8_99DDB5.lin.huf":5..538
DATA8_99DFCF:		; a player photo: 6 x 6 linear 4bpp tiles packed for DecompressHuffman, one entry of the photo table
			;   in bank $9D
	db $30,$FB
	db $00,$04,$80
	incbin "../Extracted/data/DATA8_99DFCF.lin.huf":5..49
