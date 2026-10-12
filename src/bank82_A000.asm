; Bank $82, third 4 KB: SpriteFrames continued (see bank82_8000), tiles from Extracted/data/SpriteFrames82.bin.

org $82A092
SpriteFrame12:
	db $03,$80
	dw $000C
	dw -5,21,-23,6
	dw $00C0,$00C0
	dw .tiles-SpriteFrame12
	db $12,$03,$00,$00
	dw -1,-23,$0800 : db $FF
	dw -5,-7,$0802 : db $FF
	dw 11,-7,$0804 : db $FF
.tiles:
	incbin "../Extracted/data/SpriteFrames82.bin":4477..4861
SpriteFrame13:
	db $04,$80
	dw $000D
	dw -11,22,-25,3
	dw $00E0,$00C0
	dw .tiles-SpriteFrame13
	db $14,$FF,$00,$00
	dw -5,-25,$0800 : db $FF
	dw -11,-9,$0802 : db $FF
	dw 5,-9,$0804 : db $FF
	dw 21,-1,$0806 : db $00
.tiles:
	incbin "../Extracted/data/SpriteFrames82.bin":4911..5327
SpriteFrame14:
	db $03,$80
	dw $000C
	dw -9,19,-24,4
	dw $00C0,$00C0
	dw .tiles-SpriteFrame14
	db $10,$03,$00,$00
	dw -5,-24,$0800 : db $FF
	dw -9,-8,$0802 : db $FF
	dw 7,-8,$0804 : db $FF
.tiles:
	incbin "../Extracted/data/SpriteFrames82.bin":5370..5754
SpriteFrame15:
	db $04,$80
	dw $000A
	dw -9,16,-25,6
	dw $00C0,$0080
	dw .tiles-SpriteFrame15
	db $0B,$06,$00,$00
	dw -6,-25,$0800 : db $FF
	dw -9,-9,$0802 : db $FF
	dw 7,-1,$0804 : db $00
	dw 15,-1,$0805 : db $00
.tiles:
	incbin "../Extracted/data/SpriteFrames82.bin":5804..6124
SpriteFrame16:
	db $03,$80
	dw $0009
	dw -6,16,-23,11
	dw $00A0,$0080
	dw .tiles-SpriteFrame16
	db $0F,$08,$00,$00
	dw -6,-23,$0800 : db $FF
	dw -6,-7,$0802 : db $FF
	dw 10,6,$0804 : db $00
.tiles:
	incbin "../Extracted/data/SpriteFrames82.bin":6167..6455
SpriteFrame17:
	db $04,$80
	dw $000A
	dw -6,18,-24,9
	dw $00C0,$0080
	dw .tiles-SpriteFrame17
	db $0D,$0A,$00,$00
	dw -6,-24,$0800 : db $FF
	dw -6,-8,$0802 : db $FF
	dw 10,3,$0804 : db $00
	dw 18,3,$0805 : db $00
.tiles:
	incbin "../Extracted/data/SpriteFrames82.bin":6505..6825
SpriteFrame18:
	db $04,$80
	dw $000D
	dw -12,19,-24,9
	dw $00E0,$00C0
	dw .tiles-SpriteFrame18
	db $11,$06,$00,$00
	dw -6,-24,$0800 : db $FF
	dw -12,-8,$0802 : db $FF
	dw 4,-8,$0804 : db $FF
	dw 13,8,$0806 : db $00
.tiles:
	incbin "../Extracted/data/SpriteFrames82.bin":6875..7291
SpriteFrame19:
	db $03,$80
	dw $000C
	dw -9,19,-24,9
	dw $00C0,$00C0
	dw .tiles-SpriteFrame19
	db $10,$06,$00,$00
	dw -9,-24,$0800 : db $FF
	dw -9,-8,$0802 : db $FF
	dw 7,-2,$0804 : db $FF
.tiles:
	incbin "../Extracted/data/SpriteFrames82.bin":7334..7718
SpriteFrame20:
	db $03,$80
	dw $0009
	dw -7,7,-23,16
	dw $00A0,$0080
	dw .tiles-SpriteFrame20
	db $FE,$0D,$00,$00
	dw -6,-23,$0800 : db $FF
	dw -7,-7,$0802 : db $FF
	dw 0,9,$0804 : db $00
.tiles:
	incbin "../Extracted/data/SpriteFrames82.bin":7761..8049
SpriteFrame21:
	db $05,$80
	dw $000B
	dw -7,9,-23,18
	dw $00C0,$00A0
	dw .tiles-SpriteFrame21
	db $01,$0E,$00,$00
	dw -7,-23,$0800 : db $FF
	dw -7,-7,$0802 : db $FF
	dw 9,-7,$0804 : db $00
	dw -1,9,$0805 : db $00
	dw -1,17,$0814 : db $00
.tiles:
	incbin "../Extracted/data/SpriteFrames82.bin":8106..8458
