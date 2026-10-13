; Bank $88, fifth 4 KB: SpriteFrames continued (see bank82_8000), tiles from Extracted/data/SpriteFrames88.bin.

org $88C09C
SpriteFrame505:
	db $02,$80
	dw $0008
	dw -9,7,-23,4
	dw $0080,$0080
	dw .tiles-SpriteFrame505
	db $FF,$01,$04,$05
	dw -9,-23,$0800 : db $FF
	dw -8,-7,$0802 : db $FF
.tiles:
	incbin "../Extracted/data/SpriteFrames88.bin":16576..16832
SpriteFrame506:
	db $04,$80
	dw $000A
	dw -10,6,-24,7
	dw $00C0,$0080
	dw .tiles-SpriteFrame506
	db $02,$05,$01,$05
	dw -9,-24,$0800 : db $FF
	dw -10,-8,$0802 : db $FF
	dw 6,-8,$0804 : db $00
	dw 6,0,$0805 : db $00
.tiles:
	incbin "../Extracted/data/SpriteFrames88.bin":16882..17202
SpriteFrame507:
	db $04,$80
	dw $000A
	dw -11,7,-25,6
	dw $00C0,$0080
	dw .tiles-SpriteFrame507
	db $F8,$03,$03,$03
	dw -11,-25,$0800 : db $FF
	dw -9,-9,$0802 : db $FF
	dw 7,-9,$0804 : db $00
	dw 7,-1,$0805 : db $00
.tiles:
	incbin "../Extracted/data/SpriteFrames88.bin":17252..17572
SpriteFrame508:
	db $06,$80
	dw $000C
	dw -14,6,-25,5
	dw $00C0,$00C0
	dw .tiles-SpriteFrame508
	db $F6,$04,$03,$03
	dw -13,-25,$0800 : db $FF
	dw -14,-9,$0802 : db $FF
	dw 3,-25,$0804 : db $00
	dw 3,-17,$0805 : db $00
	dw 2,-9,$0814 : db $00
	dw 2,-1,$0815 : db $00
.tiles:
	incbin "../Extracted/data/SpriteFrames88.bin":17636..18020
SpriteFrame509:
	db $03,$80
	dw $0009
	dw -18,5,-25,5
	dw $00A0,$0080
	dw .tiles-SpriteFrame509
	db $FA,$FF,$02,$03
	dw -10,-25,$0800 : db $FF
	dw -10,-9,$0802 : db $FF
	dw -18,-11,$0804 : db $00
.tiles:
	incbin "../Extracted/data/SpriteFrames88.bin":18063..18351
SpriteFrame510:
	db $04,$80
	dw $000A
	dw -17,6,-24,5
	dw $00C0,$0080
	dw .tiles-SpriteFrame510
	db $F7,$00,$04,$05
	dw -10,-24,$0800 : db $FF
	dw -17,-8,$0802 : db $FF
	dw -1,-8,$0804 : db $00
	dw -1,0,$0805 : db $00
.tiles:
	incbin "../Extracted/data/SpriteFrames88.bin":18401..18721
SpriteFrame511:
	db $04,$80
	dw $000A
	dw -17,6,-24,5
	dw $00C0,$0080
	dw .tiles-SpriteFrame511
	db $FC,$FD,$03,$04
	dw -7,-24,$0800 : db $FF
	dw -17,-8,$0802 : db $FF
	dw -1,-8,$0804 : db $00
	dw -1,0,$0805 : db $00
.tiles:
	incbin "../Extracted/data/SpriteFrames88.bin":18771..19091
SpriteFrame512:
	db $03,$80
	dw $0006
	dw 0,23,-16,-2
	dw $0080,$0040
	dw .tiles-SpriteFrame512
	db $00,$FF,$00,$FF
	dw 0,-16,$0200 : db $FF
	dw 16,-16,$0202 : db $00
	dw 16,-8,$0203 : db $00
.tiles:
	incbin "../Extracted/data/SpriteFrames88.bin":19134..19326
SpriteFrame513:
	db $04,$80
	dw $0010
	dw 0,31,-24,7
	dw $0100,$0100
	dw .tiles-SpriteFrame513
	db $00,$FF,$00,$FF
	dw 0,-24,$0200 : db $FF
	dw 16,-24,$0202 : db $FF
	dw 0,-8,$0204 : db $FF
	dw 16,-8,$0206 : db $FF
.tiles:
	incbin "../Extracted/data/SpriteFrames88.bin":19376..19888
SpriteFrame514:
	db $06,$80
	dw $0012
	dw 0,31,-16,24
	dw $0140,$0100
	dw .tiles-SpriteFrame514
	db $00,$FF,$00,$FF
	dw 0,-16,$0200 : db $FF
	dw 16,-16,$0202 : db $FF
	dw 0,0,$0204 : db $FF
	dw 9,16,$0206 : db $FF
	dw 16,0,$0208 : db $00
	dw 16,8,$0209 : db $00
.tiles:
	incbin "../Extracted/data/SpriteFrames88.bin":19952..20528
