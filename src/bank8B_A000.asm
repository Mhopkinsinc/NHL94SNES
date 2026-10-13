; Bank $8B, third 4 KB: SpriteFrames continued (see bank82_8000), tiles from data/gfx/SpriteFrames8B.bin.

org $8BA12E
SpriteFrame703:
	db $05,$80
	dw $000B
	dw -12,24,-16,4
	dw $00C0,$00A0
	dw .tiles-SpriteFrame703
	db $15,$04,$18,$01
	dw -12,-11,$0800 : db $FF
	dw 4,-11,$0802 : db $FF
	dw 20,-3,$0804 : db $00
	dw 1,-19,$0805 : db $00
	dw 9,-19,$0814 : db $00
.tiles:
	incbin "data/gfx/SpriteFrames8B.bin":8551..8903
SpriteFrame704:
	db $04,$80
	dw $000D
	dw -16,30,-7,9
	dw $00E0,$00C0
	dw .tiles-SpriteFrame704
	db $0C,$02,$0C,$01
	dw -16,-7,$0800 : db $FF
	dw 0,-7,$0802 : db $FF
	dw 16,-7,$0804 : db $FF
	dw 4,9,$0806 : db $00
.tiles:
	incbin "data/gfx/SpriteFrames8B.bin":8953..9369
SpriteFrame705:
	db $05,$80
	dw $000E
	dw -14,14,-21,5
	dw $0100,$00C0
	dw .tiles-SpriteFrame705
	db $0C,$00,$0E,$F7
	dw -14,-21,$0800 : db $FF
	dw 2,-21,$0802 : db $FF
	dw -9,-5,$0804 : db $FF
	dw 7,-5,$0806 : db $00
	dw 7,3,$0807 : db $00
.tiles:
	incbin "data/gfx/SpriteFrames8B.bin":9426..9874
SpriteFrame706:
	db $04,$80
	dw $000A
	dw -14,15,-9,10
	dw $00C0,$0080
	dw .tiles-SpriteFrame706
	db $0D,$0A,$0F,$07
	dw -14,-5,$0800 : db $FF
	dw 2,-5,$0802 : db $FF
	dw -6,-13,$0804 : db $00
	dw 2,-13,$0805 : db $00
.tiles:
	incbin "data/gfx/SpriteFrames8B.bin":9924..10244
SpriteFrame707:
	db $04,$80
	dw $000A
	dw -16,18,-9,7
	dw $00C0,$0080
	dw .tiles-SpriteFrame707
	db $01,$04,$01,$04
	dw -16,-8,$0800 : db $FF
	dw 0,-8,$0802 : db $FF
	dw 16,0,$0804 : db $00
	dw -2,-16,$0805 : db $00
.tiles:
	incbin "data/gfx/SpriteFrames8B.bin":10294..10614
SpriteFrame708:
	db $04,$80
	dw $000D
	dw -19,10,-23,2
	dw $00E0,$00C0
	dw .tiles-SpriteFrame708
	db $F2,$FC,$EF,$F4
	dw -19,-23,$0800 : db $FF
	dw -3,-23,$0802 : db $FF
	dw -13,-7,$0804 : db $FF
	dw 3,-7,$0806 : db $00
.tiles:
	incbin "data/gfx/SpriteFrames8B.bin":10664..11080
SpriteFrame709:
	db $06,$80
	dw $000C
	dw -21,11,-16,6
	dw $00C0,$00C0
	dw .tiles-SpriteFrame709
	db $F2,$04,$F0,$00
	dw -21,-16,$0800 : db $FF
	dw -5,-16,$0802 : db $FF
	dw -17,0,$0804 : db $00
	dw -9,0,$0805 : db $00
	dw -1,0,$0814 : db $00
	dw 7,0,$0815 : db $00
.tiles:
	incbin "data/gfx/SpriteFrames8B.bin":11144..11528
SpriteFrame710:
	db $05,$80
	dw $000B
	dw -26,11,-7,10
	dw $00C0,$00A0
	dw .tiles-SpriteFrame710
	db $F3,$05,$F3,$05
	dw -26,-7,$0800 : db $FF
	dw -10,-7,$0802 : db $FF
	dw 6,-7,$0804 : db $00
	dw 6,1,$0805 : db $00
	dw -13,9,$0814 : db $00
.tiles:
	incbin "data/gfx/SpriteFrames8B.bin":11585..11937
SpriteFrame711:
	db $04,$80
	dw $000A
	dw -13,7,-23,1
	dw $00C0,$0080
	dw .tiles-SpriteFrame711
	db $F8,$03,$F5,$F8
	dw -11,-23,$0800 : db $FF
	dw -13,-7,$0802 : db $FF
	dw 3,-7,$0804 : db $00
	dw 3,1,$0805 : db $00
.tiles:
	incbin "data/gfx/SpriteFrames8B.bin":11987..12307
