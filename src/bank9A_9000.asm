; Bank $9A, second 4 KB: the end of DATA8_9A8E26, then DATA8_9A901F, a player photo, then DATA8_9A9218, a player
; photo, then DATA8_9A940F, a player photo, then DATA8_9A9601, a song from the TeamSongs table (laid out as in
; bank81_F000), then DATA8_9A97E5, a song from the TeamSongs table (laid out as in bank81_F000), then DATA8_9A99C9, a
; player photo, then DATA8_9A9BAD, a song from the TeamSongs table (laid out as in bank81_F000), then DATA8_9A9D91, a
; player photo, then the start of DATA8_9A9F70, a player photo.

org $9A9000
	incbin "../Extracted/data/DATA8_9A8E26.lin.huf":474..505
DATA8_9A901F:		; a player photo: 6 x 6 linear 4bpp tiles packed for DecompressHuffman, one entry of the photo table
			;   in bank $9D
	db $30,$FB
	db $00,$04,$80
	incbin "../Extracted/data/DATA8_9A901F.lin.huf":5..505
DATA8_9A9218:		; a player photo: 6 x 6 linear 4bpp tiles packed for DecompressHuffman, one entry of the photo table
			;   in bank $9D
	db $30,$FB
	db $00,$04,$80
	incbin "../Extracted/data/DATA8_9A9218.lin.huf":5..503
DATA8_9A940F:		; a player photo: 6 x 6 linear 4bpp tiles packed for DecompressHuffman, one entry of the photo table
			;   in bank $9D
	db $30,$FB
	db $00,$04,$80
	incbin "../Extracted/data/DATA8_9A940F.lin.huf":5..498
DATA8_9A9601:		; a song (see bank81_F000): header, track offsets ($0000 ends them), padding, then the tracks
	db $01,$78,$01,$00,$00,$00,$02,$00
	dw .left-DATA8_9A9601,.right-DATA8_9A9601,$0000
	db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	db $00,$DE,"TRAK"
.left:
	db $00,$E7,$05,"left",$00
	db $00,$DC,$0B,$00,$AB,$78,$0C,$00,$A6,$76,$0C,$18,$A8,$71,$0C,$00
	db $AB,$71,$0C,$18,$AB,$77,$15,$00,$A6,$76,$15,$30,$A6,$76,$0C,$00
	db $AB,$77,$0C,$18,$A8,$78,$0C,$00,$AB,$7C,$0C,$18,$A6,$7F,$12,$00
	db $AB,$7E,$12,$30,$A7,$76,$0C,$00,$AC,$78,$0C,$18,$A9,$71,$0C,$00
	db $AC,$71,$0C,$18,$AC,$77,$15,$00,$A7,$76,$15,$30,$A7,$76,$0C,$00
	db $AC,$77,$0C,$18,$A9,$78,$0C,$00,$AC,$7C,$0C,$18,$A7,$7F,$12,$00
	db $AC,$7E,$12,$30,$A8,$76,$0C,$00,$AD,$78,$0C,$18,$AA,$71,$0C,$00
	db $AD,$71,$0C,$18,$AD,$77,$15,$00,$A8,$76,$15,$30,$A8,$76,$0C,$00
	db $AD,$77,$0C,$18,$AA,$78,$0C,$00,$AD,$7C,$0C,$18,$A8,$7F,$12,$00
	db $AD,$7E,$12,$30,$A9,$76,$0C,$00,$AE,$78,$0C,$18,$AB,$71,$0C,$00
	db $AE,$71,$0C,$18,$AE,$77,$15,$00,$A9,$76,$15,$30,$A9,$76,$0C,$00
	db $AE,$77,$0C,$18,$AB,$78,$0C,$00,$AE,$7C,$0C,$18,$AE,$7E,$12,$00
	db $A9,$7F,$12,$12,$D9,$00,$00,$00,$00,$00,$00,$00,$00,$A6,$00,$00
	db $00,$DE,"TRAK"
.right:
	db $00,$E7,$06,"right",$00
	db $00,$DC,$0C,$00,$A3,$76,$0C,$00,$93,$79,$0C,$18,$A4,$73,$0C,$00
	db $93,$77,$0C,$18,$A3,$71,$15,$00,$93,$77,$15,$30,$A3,$75,$0C,$00
	db $93,$78,$0C,$18,$93,$77,$0C,$00,$A4,$7B,$0C,$18,$93,$7B,$12,$00
	db $A3,$78,$12,$30,$A4,$76,$0C,$00,$94,$79,$0C,$18,$A5,$73,$0C,$00
	db $94,$77,$0C,$18,$A4,$71,$15,$00,$94,$77,$15,$30,$A4,$75,$0C,$00
	db $94,$78,$0C,$18,$94,$77,$0C,$00,$A5,$7B,$0C,$18,$94,$7B,$12,$00
	db $A4,$78,$12,$30,$A5,$76,$0C,$00,$95,$79,$0C,$18,$A6,$73,$0C,$00
	db $95,$77,$0C,$18,$A5,$71,$15,$00,$95,$77,$15,$30,$A5,$75,$0C,$00
	db $95,$78,$0C,$18,$95,$77,$0C,$00,$A6,$7B,$0C,$18,$95,$7B,$12,$00
	db $A5,$78,$12,$30,$A6,$76,$0C,$00,$96,$79,$0C,$18,$A7,$73,$0C,$00
	db $96,$77,$0C,$18,$A6,$71,$15,$00,$96,$77,$15,$30,$A6,$75,$0C,$00
	db $96,$78,$0C,$18,$96,$77,$0C,$00,$A7,$7B,$0C,$18,$A6,$78,$12,$00
	db $96,$7B,$12,$12,$D9,$00,$00,$00,$00,$00,$00,$00,$00
DATA8_9A97E5:		; a song (see bank81_F000): header, track offsets ($0000 ends them), padding, then the tracks
	db $01,$78,$01,$00,$00,$00,$02,$00
	dw .left-DATA8_9A97E5,.right-DATA8_9A97E5,$0000
	db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	db $00,$DE,"TRAK"
.left:
	db $00,$E7,$05,"left",$00
	db $00,$DC,$0B,$00,$B0,$7C,$11,$00,$AB,$7C,$12,$18,$B0,$7C,$12,$00
	db $AD,$7C,$12,$18,$B0,$7C,$20,$00,$AB,$7C,$1F,$30,$AB,$7C,$0C,$00
	db $B0,$7C,$0D,$18,$B0,$7C,$0E,$00,$AD,$7C,$0E,$18,$AB,$7C,$1B,$00
	db $B0,$7C,$1B,$30,$AC,$7C,$12,$00,$B1,$7C,$11,$18,$B1,$7C,$12,$00
	db $AE,$7C,$12,$18,$B1,$7C,$20,$00,$AC,$7C,$1F,$30,$AC,$7C,$0C,$00
	db $B1,$7C,$0D,$18,$B1,$7C,$0E,$00,$AE,$7C,$0E,$18,$AC,$7C,$1B,$00
	db $B1,$7C,$1B,$30,$AD,$7C,$12,$00,$B2,$7C,$11,$18,$B2,$7C,$12,$00
	db $AF,$7C,$12,$18,$B2,$7C,$20,$00,$AD,$7C,$1F,$30,$AD,$7C,$0C,$00
	db $B2,$7C,$0D,$18,$B2,$7C,$0E,$00,$AF,$7C,$0E,$18,$AD,$7C,$1B,$00
	db $B2,$7C,$1B,$30,$AE,$7C,$12,$00,$B3,$7C,$11,$18,$B3,$7C,$12,$00
	db $B0,$7C,$12,$18,$B3,$7C,$20,$00,$AE,$7C,$1F,$30,$AE,$7C,$0C,$00
	db $B3,$7C,$0D,$18,$B3,$7C,$0E,$00,$B0,$7C,$0E,$18,$B3,$7C,$1B,$00
	db $AE,$7C,$1B,$1B,$D9,$00,$00,$00,$00,$00,$00,$00,$00,$9D,$00,$00
	db $00,$DE,"TRAK"
.right:
	db $00,$E7,$06,"right",$00
	db $00,$DC,$0C,$00,$A8,$7C,$11,$00,$98,$7C,$10,$18,$98,$7C,$11,$00
	db $A9,$7C,$11,$18,$A8,$7C,$1F,$00,$98,$7C,$20,$30,$98,$7C,$0D,$00
	db $A8,$7C,$0C,$18,$98,$7C,$0E,$00,$A9,$7C,$0E,$18,$A8,$7C,$1B,$00
	db $98,$7C,$1C,$30,$A9,$7C,$11,$00,$99,$7C,$10,$18,$99,$7C,$11,$00
	db $AA,$7C,$11,$18,$A9,$7C,$1F,$00,$99,$7C,$20,$30,$99,$7C,$0D,$00
	db $A9,$7C,$0C,$18,$99,$7C,$0E,$00,$AA,$7C,$0E,$18,$A9,$7C,$1B,$00
	db $99,$7C,$1C,$30,$AA,$7C,$11,$00,$9A,$7C,$10,$18,$9A,$7C,$11,$00
	db $AB,$7C,$11,$18,$AA,$7C,$1F,$00,$9A,$7C,$20,$30,$9A,$7C,$0D,$00
	db $AA,$7C,$0C,$18,$9A,$7C,$0E,$00,$AB,$7C,$0E,$18,$AA,$7C,$1B,$00
	db $9A,$7C,$1C,$30,$AB,$7C,$11,$00,$9B,$7C,$10,$18,$9B,$7C,$11,$00
	db $AC,$7C,$11,$18,$AB,$7C,$1F,$00,$9B,$7C,$20,$30,$9B,$7C,$0D,$00
	db $AB,$7C,$0C,$18,$9B,$7C,$0E,$00,$AC,$7C,$0E,$18,$AB,$7C,$1B,$00
	db $9B,$7C,$1C,$1C,$D9,$00,$00,$00,$00,$00,$00,$00,$00
DATA8_9A99C9:		; a player photo: 6 x 6 linear 4bpp tiles packed for DecompressHuffman, one entry of the photo table
			;   in bank $9D
	db $30,$FB
	db $00,$04,$80
	incbin "../Extracted/data/DATA8_9A99C9.lin.huf":5..483
	db $00
DATA8_9A9BAD:		; a song (see bank81_F000): header, track offsets ($0000 ends them), padding, then the tracks
	db $01,$78,$01,$00,$00,$00,$02,$00
	dw .left-DATA8_9A9BAD,.right-DATA8_9A9BAD,$0000
	db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	db $00,$DE,"TRAK"
.left:
	db $00,$E7,$05,"left",$00
	db $00,$DC,$0B,$00,$AB,$6E,$0B,$00,$B0,$6E,$0A,$18,$A6,$6E,$08,$00
	db $AB,$6E,$0C,$18,$B0,$6E,$19,$00,$AB,$6E,$1A,$30,$AB,$6E,$0D,$00
	db $B0,$6E,$0B,$18,$A6,$6E,$06,$00,$AB,$6E,$09,$18,$B0,$6E,$17,$00
	db $AB,$6E,$17,$30,$AC,$6E,$0B,$00,$B1,$6E,$0A,$18,$A7,$6E,$08,$00
	db $AC,$6E,$0C,$18,$B1,$6E,$19,$00,$AC,$6E,$1A,$30,$AC,$6E,$0D,$00
	db $B1,$6E,$0B,$18,$A7,$6E,$06,$00,$AC,$6E,$09,$18,$B1,$6E,$17,$00
	db $AC,$6E,$17,$30,$AD,$6E,$0B,$00,$B2,$6E,$0A,$18,$A8,$6E,$08,$00
	db $AD,$6E,$0C,$18,$B2,$6E,$19,$00,$AD,$6E,$1A,$30,$AD,$6E,$0D,$00
	db $B2,$6E,$0B,$18,$A8,$6E,$06,$00,$AD,$6E,$09,$18,$B2,$6E,$17,$00
	db $AD,$6E,$17,$30,$AE,$6E,$0B,$00,$B3,$6E,$0A,$18,$A9,$6E,$08,$00
	db $AE,$6E,$0C,$18,$B3,$6E,$19,$00,$AE,$6E,$1A,$30,$AE,$6E,$0D,$00
	db $B3,$6E,$0B,$18,$A9,$6E,$06,$00,$AE,$6E,$09,$18,$B3,$6E,$17,$00
	db $AE,$6E,$17,$17,$D9,$00,$00,$00,$00,$00,$00,$00,$00,$9B,$00,$00
	db $00,$DE,"TRAK"
.right:
	db $00,$E7,$06,"right",$00
	db $00,$DC,$0C,$00,$A8,$6E,$0B,$00,$98,$6E,$0C,$18,$A3,$6E,$08,$00
	db $93,$6E,$0D,$18,$A8,$6E,$1A,$00,$98,$6E,$1B,$30,$A8,$6E,$0D,$00
	db $98,$6E,$0E,$18,$A3,$6E,$06,$00,$93,$6E,$0B,$18,$A8,$6E,$17,$00
	db $98,$6E,$18,$30,$A9,$6E,$0B,$00,$99,$6E,$0C,$18,$A4,$6E,$08,$00
	db $94,$6E,$0D,$18,$A9,$6E,$1A,$00,$99,$6E,$1B,$30,$A9,$6E,$0D,$00
	db $99,$6E,$0E,$18,$A4,$6E,$06,$00,$94,$6E,$0B,$18,$A9,$6E,$17,$00
	db $99,$6E,$18,$30,$AA,$6E,$0B,$00,$9A,$6E,$0C,$18,$A5,$6E,$08,$00
	db $95,$6E,$0D,$18,$AA,$6E,$1A,$00,$9A,$6E,$1B,$30,$AA,$6E,$0D,$00
	db $9A,$6E,$0E,$18,$A5,$6E,$06,$00,$95,$6E,$0B,$18,$AA,$6E,$17,$00
	db $9A,$6E,$18,$30,$AB,$6E,$0B,$00,$9B,$6E,$0C,$18,$A6,$6E,$08,$00
	db $96,$6E,$0D,$18,$AB,$6E,$1A,$00,$9B,$6E,$1B,$30,$AB,$6E,$0D,$00
	db $9B,$6E,$0E,$18,$A6,$6E,$06,$00,$96,$6E,$0B,$18,$AB,$6E,$17,$00
	db $9B,$6E,$18,$18,$D9,$00,$00,$00,$00,$00,$00,$00,$00
DATA8_9A9D91:		; a player photo: 6 x 6 linear 4bpp tiles packed for DecompressHuffman, one entry of the photo table
			;   in bank $9D
	db $30,$FB
	db $00,$04,$80
	incbin "../Extracted/data/DATA8_9A9D91.lin.huf":5..479
DATA8_9A9F70:		; a player photo: 6 x 6 linear 4bpp tiles packed for DecompressHuffman, one entry of the photo table
			;   in bank $9D
	db $30,$FB
	db $00,$04,$80
	incbin "../Extracted/data/DATA8_9A9F70.lin.huf":5..144
