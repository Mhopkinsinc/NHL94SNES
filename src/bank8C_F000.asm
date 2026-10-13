; Bank $8C, last 4 KB: the last SpriteFrames frames of the bank (see bank82_8000), tiles from
; Extracted/data/SpriteFrames8C.bin, then a player photo from Extracted/data/DATA8_8CFDEC.lin.huf.

org $8CF171
SpriteFrame822:
	db $06,$80
	dw $000C
	dw -6,18,-37,1
	dw $00C0,$00C0
	dw .tiles-SpriteFrame822
	db $00,$FF,$00,$00
	dw -3,-37,$0800 : db $FF
	dw -4,-21,$0802 : db $FF
	dw -6,-5,$0804 : db $00
	dw 2,-5,$0805 : db $00
	dw 10,-5,$0814 : db $00
	dw 18,-5,$0815 : db $00
.tiles:
	incbin "../Extracted/data/SpriteFrames8C.bin":29105..29489
SpriteFrame823:
	db $03,$80
	dw $0009
	dw -9,6,-31,2
	dw $00A0,$0080
	dw .tiles-SpriteFrame823
	db $00,$00,$00,$00
	dw -8,-31,$0800 : db $FF
	dw -9,-15,$0802 : db $FF
	dw -4,1,$0804 : db $00
.tiles:
	incbin "../Extracted/data/SpriteFrames8C.bin":29532..29820
SpriteFrame824:
	db $05,$80
	dw $0008
	dw -9,6,-35,1
	dw $0080,$0080
	dw .tiles-SpriteFrame824
	db $00,$00,$00,$00
	dw -9,-19,$0800 : db $FF
	dw -1,-35,$0802 : db $00
	dw -1,-27,$0803 : db $00
	dw -8,-3,$0812 : db $00
	dw 0,-3,$0813 : db $00
.tiles:
	incbin "../Extracted/data/SpriteFrames8C.bin":29877..30133
SpriteFrame825:
	db $04,$80
	dw $000A
	dw -6,7,-32,1
	dw $00C0,$0080
	dw .tiles-SpriteFrame825
	db $00,$00,$00,$00
	dw -6,-32,$0800 : db $FF
	dw -5,-16,$0802 : db $FF
	dw -3,0,$0804 : db $00
	dw 5,0,$0805 : db $00
.tiles:
	incbin "../Extracted/data/SpriteFrames8C.bin":30183..30503
SpriteFrame826:
	db $03,$80
	dw $0009
	dw -5,6,-30,6
	dw $00A0,$0080
	dw .tiles-SpriteFrame826
	db $00,$00,$00,$00
	dw -4,-30,$0800 : db $FF
	dw -5,-14,$0802 : db $FF
	dw -1,2,$0804 : db $00
.tiles:
	incbin "../Extracted/data/SpriteFrames8C.bin":30546..30834
SpriteFrame827:
	db $04,$80
	dw $000A
	dw -5,10,-31,6
	dw $00C0,$0080
	dw .tiles-SpriteFrame827
	db $00,$00,$00,$00
	dw -4,-31,$0800 : db $FF
	dw -5,-15,$0802 : db $FF
	dw -4,1,$0804 : db $00
	dw 4,1,$0805 : db $00
.tiles:
	incbin "../Extracted/data/SpriteFrames8C.bin":30884..31204
SpriteFrame828:
	db $03,$80
	dw $0009
	dw -5,10,-30,6
	dw $00A0,$0080
	dw .tiles-SpriteFrame828
	db $00,$00,$00,$00
	dw -4,-30,$0800 : db $FF
	dw -5,-14,$0802 : db $FF
	dw 0,2,$0804 : db $00
.tiles:
	incbin "../Extracted/data/SpriteFrames8C.bin":31247..31535
SpriteFrame829:
	db $03,$80
	dw $0009
	dw -9,7,-30,1
	dw $00A0,$0080
	dw .tiles-SpriteFrame829
	db $00,$00,$00,$00
	dw -9,-30,$0800 : db $FF
	dw -5,-14,$0802 : db $FF
	dw 7,-22,$0804 : db $00
.tiles:
	incbin "../Extracted/data/SpriteFrames8C.bin":31578..31866
SpriteFrame830:
	db $04,$80
	dw $000A
	dw -9,7,-31,1
	dw $00C0,$0080
	dw .tiles-SpriteFrame830
	db $FE,$00,$00,$00
	dw -9,-31,$0800 : db $FF
	dw -5,-15,$0802 : db $FF
	dw 7,-23,$0804 : db $00
	dw -5,1,$0805 : db $00
.tiles:
	incbin "../Extracted/data/SpriteFrames8C.bin":31916..32236
DATA8_8CFDEC:		; a player photo: 6 x 6 linear 4bpp tiles packed for DecompressHuffman, one entry of the per-team photo
			;   table in bank $9D (the first photo of the Ottawa team)
	db $30,$FB
	db $00,$04,$80
	incbin "../Extracted/data/DATA8_8CFDEC.lin.huf":5..532
