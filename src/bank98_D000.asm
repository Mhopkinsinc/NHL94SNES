; Bank $98, sixth 4 KB: the end of DATA8_98CF54, then DATA8_98D19D, a player photo, then DATA8_98D3E6, a player photo,
; then DATA8_98D62E, a player photo, then DATA8_98D876, a player photo, then DATA8_98DABC, a player photo, then
; DATA8_98DD01, a player photo, then the start of DATA8_98DF46, a song from the TeamSongs table (laid out as in
; bank81_F000).

org $98D000
	incbin "../Extracted/data/DATA8_98CF54.lin.huf":172..585
DATA8_98D19D:		; a player photo: 6 x 6 linear 4bpp tiles packed for DecompressHuffman, one entry of the photo table
			;   in bank $9D
	db $30,$FB
	db $00,$04,$80
	incbin "../Extracted/data/DATA8_98D19D.lin.huf":5..585
DATA8_98D3E6:		; a player photo: 6 x 6 linear 4bpp tiles packed for DecompressHuffman, one entry of the photo table
			;   in bank $9D
	db $30,$FB
	db $00,$04,$80
	incbin "../Extracted/data/DATA8_98D3E6.lin.huf":5..584
DATA8_98D62E:		; a player photo: 6 x 6 linear 4bpp tiles packed for DecompressHuffman, one entry of the photo table
			;   in bank $9D
	db $30,$FB
	db $00,$04,$80
	incbin "../Extracted/data/DATA8_98D62E.lin.huf":5..584
DATA8_98D876:		; a player photo: 6 x 6 linear 4bpp tiles packed for DecompressHuffman, one entry of the photo table
			;   in bank $9D
	db $30,$FB
	db $00,$04,$80
	incbin "../Extracted/data/DATA8_98D876.lin.huf":5..582
DATA8_98DABC:		; a player photo: 6 x 6 linear 4bpp tiles packed for DecompressHuffman, one entry of the photo table
			;   in bank $9D
	db $30,$FB
	db $00,$04,$80
	incbin "../Extracted/data/DATA8_98DABC.lin.huf":5..581
DATA8_98DD01:		; a player photo: 6 x 6 linear 4bpp tiles packed for DecompressHuffman, one entry of the photo table
			;   in bank $9D
	db $30,$FB
	db $00,$04,$80
	incbin "../Extracted/data/DATA8_98DD01.lin.huf":5..581
DATA8_98DF46:		; a song (see bank81_F000): header, track offsets ($0000 ends them), padding, then the tracks
	db $01,$78,$01,$00,$00,$00,$02,$00
	dw .left-DATA8_98DF46,.right-DATA8_98DF46,$0000
	db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	db $01,$0E,"TRAK"
.left:
	db $00,$E7,$05,"left",$00
	db $00,$DC,$0B,$01,$A4,$6E,$07,$00,$A9,$6E,$06,$13,$A1,$6E,$08,$00
	db $A4,$6E,$09,$16,$A9,$6E,$0C,$00,$A4,$6E,$0C,$2B,$A4,$6E,$09,$00
	db $A9,$6E,$07,$15,$A9,$6E,$07,$00,$A6,$6E,$08,$18,$A9,$6E,$16,$00
	db $A4,$6E,$17,$2B,$A5,$6E,$08,$00,$AA,$6E,$08,$16,$A5,$6E,$06,$00
	db $A2,$6E,$06,$15,$AA,$6E,$0C,$00,$A5,$6E,$0C,$2A,$A5,$6E,$08,$00
	db $AA,$6E,$09,$16,$A7,$6E,$06,$00,$AA,$6E,$07,$16,$A5,$6E,$17,$00
	db $AA,$6E,$18,$29,$A6,$6E,$08,$00,$AB,$6E,$07,$14,$A6,$6E,$09,$00
	db $A3,$6E,$08,$16,$A6,$6E,$0C,$00,$AB,$6E,$0B,$29,$A6,$6E,$07,$00
	db $AB,$6E
