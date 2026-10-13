; Bank $8C, sixth 4 KB: SpriteFrames continued (see bank82_8000), tiles from Extracted/data/SpriteFrames8C.bin.

org $8CD0F7
SpriteFrame803:
	db $05,$80
	dw $000B
	dw -7,12,-30,3
	dw $00C0,$00A0
	dw .tiles-SpriteFrame803
	db $02,$02,$00,$00
	dw -6,-30,$0800 : db $FF
	dw -7,-14,$0802 : db $FF
	dw 9,-14,$0804 : db $00
	dw 9,-6,$0805 : db $00
	dw 0,2,$0814 : db $00
.tiles:
	incbin "../Extracted/data/SpriteFrames8C.bin":20784..21136
SpriteFrame804:
	db $05,$80
	dw $000E
	dw -9,16,-32,4
	dw $0100,$00C0
	dw .tiles-SpriteFrame804
	db $02,$03,$00,$00
	dw -8,-32,$0800 : db $FF
	dw -9,-16,$0802 : db $FF
	dw 7,-16,$0804 : db $FF
	dw 0,0,$0806 : db $00
	dw 8,0,$0807 : db $00
.tiles:
	incbin "../Extracted/data/SpriteFrames8C.bin":21193..21641
SpriteFrame805:
	db $06,$80
	dw $000C
	dw -11,10,-37,2
	dw $00C0,$00C0
	dw .tiles-SpriteFrame805
	db $FF,$00,$00,$00
	dw -5,-37,$0800 : db $FF
	dw -5,-21,$0802 : db $FF
	dw -5,-5,$0804 : db $00
	dw 3,-5,$0805 : db $00
	dw -13,-30,$0814 : db $00
	dw -13,-22,$0815 : db $00
.tiles:
	incbin "../Extracted/data/SpriteFrames8C.bin":21705..22089
SpriteFrame806:
	db $07,$80
	dw $000D
	dw -10,8,-31,3
	dw $00E0,$00C0
	dw .tiles-SpriteFrame806
	db $01,$01,$00,$00
	dw -10,-31,$0800 : db $FF
	dw -9,-15,$0802 : db $FF
	dw 6,-31,$0804 : db $00
	dw 6,-23,$0805 : db $00
	dw 7,-15,$0814 : db $00
	dw -5,1,$0815 : db $00
	dw 3,1,$0806 : db $00
.tiles:
	incbin "../Extracted/data/SpriteFrames8C.bin":22160..22576
SpriteFrame807:
	db $07,$80
	dw $000D
	dw -10,11,-30,4
	dw $00E0,$00C0
	dw .tiles-SpriteFrame807
	db $01,$00,$00,$00
	dw -10,-30,$0800 : db $FF
	dw -10,-14,$0802 : db $FF
	dw 6,-22,$0804 : db $00
	dw 6,-14,$0805 : db $00
	dw 6,-6,$0814 : db $00
	dw -5,2,$0815 : db $00
	dw 3,2,$0806 : db $00
.tiles:
	incbin "../Extracted/data/SpriteFrames8C.bin":22647..23063
SpriteFrame808:
	db $04,$80
	dw $000A
	dw -8,8,-30,5
	dw $00C0,$0080
	dw .tiles-SpriteFrame808
	db $01,$00,$00,$00
	dw -6,-10,$0800 : db $FF
	dw -8,-26,$0802 : db $FF
	dw 8,-18,$0804 : db $00
	dw -3,-34,$0805 : db $00
.tiles:
	incbin "../Extracted/data/SpriteFrames8C.bin":23113..23433
SpriteFrame809:
	db $08,$80
	dw $0011
	dw -11,11,-47,2
	dw $0120,$0100
	dw .tiles-SpriteFrame809
	db $00,$00,$00,$00
	dw -8,-47,$0800 : db $FF
	dw -11,-31,$0802 : db $FF
	dw -9,-15,$0804 : db $FF
	dw 5,-31,$0806 : db $00
	dw 5,-23,$0807 : db $00
	dw 7,-7,$0816 : db $00
	dw -10,1,$0817 : db $00
	dw -2,1,$0808 : db $00
.tiles:
	incbin "../Extracted/data/SpriteFrames8C.bin":23511..24055
SpriteFrame810:
	db $07,$80
	dw $0010
	dw -11,10,-44,1
	dw $0100,$0100
	dw .tiles-SpriteFrame810
	db $FF,$FF,$00,$00
	dw -8,-44,$0800 : db $FF
	dw -11,-28,$0802 : db $FF
	dw -10,-12,$0804 : db $FF
	dw 5,-28,$0806 : db $00
	dw 5,-20,$0807 : db $00
	dw 6,-12,$0816 : db $00
	dw 6,-4,$0817 : db $00
.tiles:
	incbin "../Extracted/data/SpriteFrames8C.bin":24126..24638
