; Bank $99, fourth 4 KB: the end of DATA8_99AE67, then DATA8_99B097, a player photo, then DATA8_99B2C7, a player
; photo, then DATA8_99B4F7, a player photo, then DATA8_99B726, a 12 x 23 map, then DATA8_99B954, a player photo, then
; DATA8_99BB80, a song from the TeamSongs table (laid out as in bank81_F000), then DATA8_99BDAC, a player photo, then
; the start of DATA8_99BFD5, a player photo.

org $99B000
	incbin "../Extracted/data/DATA8_99AE67.lin.huf":409..560
DATA8_99B097:		; a player photo: 6 x 6 linear 4bpp tiles packed for DecompressHuffman, one entry of the photo table
			;   in bank $9D
	db $30,$FB
	db $00,$04,$80
	incbin "../Extracted/data/DATA8_99B097.lin.huf":5..560
DATA8_99B2C7:		; a player photo: 6 x 6 linear 4bpp tiles packed for DecompressHuffman, one entry of the photo table
			;   in bank $9D
	db $30,$FB
	db $00,$04,$80
	incbin "../Extracted/data/DATA8_99B2C7.lin.huf":5..560
DATA8_99B4F7:		; a player photo: 6 x 6 linear 4bpp tiles packed for DecompressHuffman, one entry of the photo table
			;   in bank $9D
	db $30,$FB
	db $00,$04,$80
	incbin "../Extracted/data/DATA8_99B4F7.lin.huf":5..559
DATA8_99B726:		; a map, not packed: width, height and a word, then the map words (12 x 23), which a routine in
			;   bank $9D copies column by column into a map buffer; not identified yet
	dw $000C,$0017,$0308
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0801,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$4801
	dw $0802,$0803,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$4803,$4802,$0804,$8803,$0801,$0000
	dw $0000,$0000,$0000,$0000,$0000,$4801,$C803,$4804
	dw $0000,$0000,$0805,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0805,$0000,$0000,$0000,$0000,$0802,$0803
	dw $0000,$0000,$0000,$0000,$4803,$4802,$0000,$0000
	dw $0000,$0000,$8802,$8803,$0801,$0000,$0000,$4801
	dw $C803,$C802,$0000,$0000,$0801,$0000,$0805,$0000
	dw $0805,$0000,$0000,$0805,$0000,$0805,$0000,$4801
	dw $0802,$0803,$8801,$0000,$0805,$0000,$0000,$0805
	dw $0000,$C801,$4803,$4802,$0804,$8803,$0000,$0000
	dw $0805,$0000,$0000,$0805,$0000,$0000,$C803,$4804
	dw $0000,$0000,$0000,$0000,$0802,$0803,$4803,$4802
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $8802,$8803,$C803,$C802,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0805,$0000,$0000,$0805
	dw $0000,$0000,$0000,$0000,$8804,$0803,$0000,$0000
	dw $0805,$0000,$0000,$0805,$0000,$0000,$4803,$C804
	dw $8802,$8803,$0801,$0000,$0805,$0000,$0000,$0805
	dw $0000,$4801,$C803,$C802,$8801,$0000,$0805,$0000
	dw $0805,$0000,$0000,$0805,$0000,$0805,$0000,$C801
	dw $0000,$0000,$0802,$0803,$8801,$0000,$0000,$C801
	dw $4803,$4802,$0000,$0000,$0000,$0000,$8802,$8803
	dw $0000,$0000,$0000,$0000,$C803,$C802,$0000,$0000
	dw $0000,$0000,$0805,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0805,$0000,$0000,$8804,$0803,$8801,$0000
	dw $0000,$0000,$0000,$0000,$0000,$C801,$4803,$C804
	dw $8802,$8803,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$C803,$C802,$8801,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$C801
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000
DATA8_99B954:		; a player photo: 6 x 6 linear 4bpp tiles packed for DecompressHuffman, one entry of the photo table
			;   in bank $9D
	db $30,$FB
	db $00,$04,$80
	incbin "../Extracted/data/DATA8_99B954.lin.huf":5..556
DATA8_99BB80:		; a song (see bank81_F000): header, track offsets ($0000 ends them), padding, then the tracks
	db $01,$78,$01,$00,$00,$00,$02,$00
	dw .left-DATA8_99BB80,.right-DATA8_99BB80,$0000
	db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	db $01,$2A,"TRAK"
.left:
	db $00,$E7,$05,"left",$00
	db $00,$DC,$0B,$01,$AD,$6E,$0C,$13,$AD,$6E,$0D,$13,$AD,$6E,$0C,$13
	db $AD,$6E,$04,$08,$AB,$6E,$04,$0A,$A9,$6E,$03,$09,$A6,$6E,$0E,$11
	db $A6,$6E,$0D,$08,$8E,$6E,$10,$0A,$A6,$6E,$03,$0A,$A6,$6E,$03,$01
	db $8E,$6E,$04,$07,$A6,$6E,$03,$02,$8E,$6E,$05,$09,$A2,$6E,$0B,$00
	db $A6,$6E,$0C,$13,$A2,$6E,$02,$00,$A6,$6E,$03,$08,$A2,$6E,$02,$00
	db $A6,$6E,$03,$0A,$A6,$6E,$03,$00,$A9,$6E,$03,$09,$A6,$6E,$09,$00
	db $A9,$6E,$0A,$0A,$8A,$6E,$0F,$08,$AB,$6E,$4E,$0B,$8C,$6E,$0C,$09
	db $A8,$6E,$02,$09,$8C,$6E,$0B,$09,$A8,$6E,$0C,$0A,$8C,$6E,$0A,$09
	db $A8,$6E,$02,$0A,$8C,$6E,$11,$09,$A4,$6E,$02,$0A,$AD,$6E,$0A,$00
	db $A9,$6E,$0A,$13,$AD,$6E,$0A,$00,$A9,$6E,$0A,$13,$A9,$6E,$0B,$00
	db $AD,$6E,$0B,$14,$A9,$6E,$02,$00,$AD,$6E,$04,$08,$AB,$6E,$03,$00
	db $A4,$6E,$04,$0A,$A9,$6E,$02,$00,$A4,$6E,$03,$09,$A6,$6E,$0C,$0B
	db $8E,$6E,$0D,$08,$A6,$6E,$0F,$0C,$8E,$6E,$0F,$07,$A6,$6E,$04,$0A
	db $A6,$6E,$03,$01,$8E,$6E,$03,$07,$A6,$6E,$02,$00,$A1,$6E,$03,$0B
	db $A2,$6E,$03,$00,$A6,$6E,$04,$13,$A2,$6E,$06,$00,$A6,$6E,$06,$09
	db $A6,$6E,$06,$00,$A2,$6E,$05,$0A,$A4,$6E,$07,$00,$A8,$6E,$06,$0B
	db $A4,$6E,$0E,$00,$A8,$6E,$0D,$13,$A4,$6E,$2A,$00,$A9,$6E,$2A,$2A
	db $D9,$00,$00,$00,$00,$00,$00,$00,$00,$97,$00,$00
	db $00,$DA,"TRAK"
.right:
	db $00,$E7,$06,"right",$00
	db $00,$DC,$0C,$01,$91,$6E,$0C,$13,$91,$6E,$0C,$13,$91,$6E,$0A,$13
	db $91,$6E,$07,$08,$90,$6E,$07,$0A,$8E,$6E,$03,$09,$8E,$6E,$14,$40
	db $9D,$6E,$0B,$00,$8A,$6E,$0B,$13,$9D,$6E,$02,$00,$8A,$6E,$02,$08
	db $9D,$6E,$02,$00,$8A,$6E,$03,$0A,$A2,$6E,$02,$00,$9D,$6E,$02,$09
	db $A2,$6E,$08,$00,$9D,$6E,$06,$26,$A4,$6E,$01,$12,$A4,$6E,$0C,$13
	db $A4,$6E,$02,$1D,$A4,$6E,$0A,$00,$91,$6E,$0C,$13,$A4,$6E,$0A,$00
	db $91,$6E,$0B,$13,$A4,$6E,$0C,$00,$91,$6E,$0B,$14,$A4,$6E,$03,$00
	db $91,$6E,$08,$08,$90,$6E,$07,$0A,$8E,$6E,$0E,$09,$A1,$6E,$0D,$13
	db $A1,$6E,$0E,$13,$A1,$6E,$04,$0A,$A1,$6E,$03,$08,$8E,$6E,$06,$0B
	db $9D,$6E,$03,$00,$8A,$6E,$03,$13,$9D,$6E,$05,$00,$8A,$6E,$05,$09
	db $9D,$6E,$04,$00,$8A,$6E,$06,$0A,$9F,$6E,$06,$00,$8C,$6E,$06,$0B
	db $9F,$6E,$0B,$00,$8C,$6E,$10,$13,$A1,$6E,$2A,$00,$91,$6E,$2B,$2B
	db $D9,$00,$00,$00,$00,$00,$00,$00,$00
DATA8_99BDAC:		; a player photo: 6 x 6 linear 4bpp tiles packed for DecompressHuffman, one entry of the photo table
			;   in bank $9D
	db $30,$FB
	db $00,$04,$80
	incbin "../Extracted/data/DATA8_99BDAC.lin.huf":5..553
DATA8_99BFD5:		; a player photo: 6 x 6 linear 4bpp tiles packed for DecompressHuffman, one entry of the photo table
			;   in bank $9D
	db $30,$FB
	db $00,$04,$80
	incbin "../Extracted/data/DATA8_99BFD5.lin.huf":5..43
