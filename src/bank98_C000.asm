; Bank $98, fifth 4 KB: the end of DATA8_98BF41, then DATA8_98C18E, a player photo, then DATA8_98C3DB, a player photo,
; then DATA8_98C628, a player photo, then DATA8_98C874, a song from the DefaultSongs table (laid out as in
; bank81_F000), then DATA8_98CAC0, a player photo, then DATA8_98CD0A, a player photo, then the start of DATA8_98CF54,
; a player photo.

org $98C000
	incbin "data/gfx/DATA8_98BF41.lin.huf":191..589
DATA8_98C18E:		; a player photo: 6 x 6 linear 4bpp tiles packed for DecompressHuffman, one entry of the photo table
			;   in bank $9D
	db $30,$FB
	db $00,$04,$80
	incbin "data/gfx/DATA8_98C18E.lin.huf":5..589
DATA8_98C3DB:		; a player photo: 6 x 6 linear 4bpp tiles packed for DecompressHuffman, one entry of the photo table
			;   in bank $9D
	db $30,$FB
	db $00,$04,$80
	incbin "data/gfx/DATA8_98C3DB.lin.huf":5..589
DATA8_98C628:		; a player photo: 6 x 6 linear 4bpp tiles packed for DecompressHuffman, one entry of the photo table
			;   in bank $9D
	db $30,$FB
	db $00,$04,$80
	incbin "data/gfx/DATA8_98C628.lin.huf":5..588
DATA8_98C874:		; a song (see bank81_F000): header, track offsets ($0000 ends them), padding, then the tracks
	db $01,$A0,$01,$00,$00,$00,$02,$00
	dw .left-DATA8_98C874,.right-DATA8_98C874,$0000
	db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	db $01,$76,"TRAK"
.left:
	db $00,$E7,$05,"left",$00
	db $00,$DC,$0B,$01,$A7,$63,$07,$03,$AB,$6F,$06,$02,$B0,$70,$04,$13
	db $B0,$6A,$03,$08,$AB,$71,$04,$12,$AB,$58,$03,$08,$B0,$71,$04,$00
	db $A7,$6F,$03,$12,$B0,$6B,$03,$09,$AB,$70,$04,$12,$AB,$66,$02,$08
	db $A9,$73,$05,$01,$AC,$6B,$04,$12,$AC,$6A,$02,$09,$A4,$6B,$0A,$00
	db $AC,$7E,$06,$09,$AE,$75,$07,$09,$AC,$79,$04,$08,$8C,$68,$18,$02
	db $AB,$66,$0B,$00,$A7,$6F,$0C,$1C,$AB,$74,$09,$00,$A7,$71,$08,$11
	db $AB,$69,$03,$0A,$AB,$79,$0C,$00,$A6,$76,$0D,$12,$A9,$69,$03,$08
	db $A9,$74,$06,$09,$AB,$68,$08,$09,$A9,$68,$06,$09,$A7,$79,$09,$00
	db $A4,$6D,$09,$12,$A7,$69,$02,$09,$A7,$79,$05,$09,$A9,$6A,$06,$09
	db $A7,$73,$05,$08,$A6,$75,$09,$01,$A3,$6D,$08,$12,$A6,$66,$02,$08
	db $A6,$73,$06,$09,$A7,$70,$06,$09,$A6,$65,$07,$09,$A4,$7F,$0D,$19
	db $A7,$63,$07,$03,$AB,$6F,$06,$02,$B0,$70,$04,$13,$B0,$6A,$03,$08
	db $AB,$71,$04,$12,$AB,$58,$03,$08,$B0,$71,$04,$00,$A7,$6F,$03,$12
	db $B0,$6B,$03,$09,$AB,$70,$04,$12,$AB,$66,$02,$08,$A9,$73,$05,$01
	db $AC,$6B,$04,$12,$AC,$6A,$02,$09,$A4,$6B,$0A,$00,$AC,$7E,$06,$09
	db $AE,$75,$07,$09,$AC,$79,$04,$08,$8C,$68,$18,$02,$AB,$66,$0B,$00
	db $A7,$6F,$0C,$1C,$AB,$74,$09,$00,$A7,$71,$08,$11,$AB,$69,$03,$0A
	db $AB,$79,$0C,$00,$A6,$76,$0D,$12,$A9,$69,$03,$08,$A9,$74,$06,$09
	db $AB,$68,$08,$09,$A9,$68,$06,$09,$A7,$79,$09,$00,$A4,$6D,$09,$12
	db $A7,$69,$02,$09,$A7,$79,$05,$09,$A9,$6A,$06,$09,$A7,$73,$05,$08
	db $A6,$75,$09,$01,$A3,$6D,$08,$12,$A6,$66,$02,$08,$A6,$73,$06,$09
	db $A7,$70,$06,$09,$A6,$65,$07,$09,$A4,$7F,$0D,$0D,$D9,$00,$00,$00
	db $00,$00,$00,$00,$00,$7D,$00,$00
	db $00,$AE,"TRAK"
.right:
	db $00,$E7,$06,"right",$00
	db $00,$DC,$0C,$04,$8C,$6E,$17,$1D,$93,$78,$14,$1A,$8C,$74,$16,$12
	db $A7,$74,$02,$09,$93,$78,$15,$1A,$91,$75,$17,$01,$A4,$7F,$04,$1B
	db $98,$70,$14,$1C,$A4,$68,$0D,$1C,$A4,$7E,$09,$00,$93,$76,$13,$1B
	db $8E,$75,$15,$1A,$93,$75,$14,$1B,$8C,$7A,$17,$1B,$93,$7C,$14,$1B
	db $8E,$75,$16,$1A,$93,$7A,$14,$1B,$8C,$7E,$0D,$1C,$8C,$6E,$17,$1D
	db $93,$78,$14,$1A,$8C,$74,$16,$12,$A7,$74,$02,$09,$93,$78,$15,$1A
	db $91,$75,$17,$01,$A4,$7F,$04,$1B,$98,$70,$14,$1C,$A4,$68,$0D,$1C
	db $A4,$7E,$09,$00,$93,$76,$13,$1B,$8E,$75,$15,$1A,$93,$75,$14,$1B
	db $8C,$7A,$17,$1B,$93,$7C,$14,$1B,$8E,$75,$16,$1A,$93,$7A,$14,$1B
	db $8C,$7E,$0D,$0D,$D9,$00,$00,$00,$00,$00,$00,$00,$00
DATA8_98CAC0:		; a player photo: 6 x 6 linear 4bpp tiles packed for DecompressHuffman, one entry of the photo table
			;   in bank $9D
	db $30,$FB
	db $00,$04,$80
	incbin "data/gfx/DATA8_98CAC0.lin.huf":5..585
	db $00
DATA8_98CD0A:		; a player photo: 6 x 6 linear 4bpp tiles packed for DecompressHuffman, one entry of the photo table
			;   in bank $9D
	db $30,$FB
	db $00,$04,$80
	incbin "data/gfx/DATA8_98CD0A.lin.huf":5..586
DATA8_98CF54:		; a player photo: 6 x 6 linear 4bpp tiles packed for DecompressHuffman, one entry of the photo table
			;   in bank $9D
	db $30,$FB
	db $00,$04,$80
	incbin "data/gfx/DATA8_98CF54.lin.huf":5..172
