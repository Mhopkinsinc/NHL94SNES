; Bank $8D, second 4 KB: SpriteFrames continued (see bank82_8000), tiles from data/gfx/SpriteFrames8D.bin.

org $8D913D
SpriteFrame840:
	db $04,$80
	dw $0010
	dw -15,13,-23,4
	dw $0100,$0100
	dw .tiles-SpriteFrame840
	db $0D,$03,$00,$00
	dw -14,-23,$0800 : db $FF
	dw 2,-23,$0802 : db $FF
	dw -15,-7,$0804 : db $FF
	dw 1,-7,$0806 : db $FF
.tiles:
	incbin "data/gfx/SpriteFrames8D.bin":4463..4975
SpriteFrame841:
	db $04,$80
	dw $000A
	dw -11,16,-9,11
	dw $00C0,$0080
	dw .tiles-SpriteFrame841
	db $0D,$0B,$00,$00
	dw -11,-4,$0800 : db $FF
	dw 5,-4,$0802 : db $FF
	dw -5,-12,$0804 : db $00
	dw 3,-12,$0805 : db $00
.tiles:
	incbin "data/gfx/SpriteFrames8D.bin":5025..5345
SpriteFrame842:
	db $04,$80
	dw $000A
	dw -10,18,0,18
	dw $00C0,$0080
	dw .tiles-SpriteFrame842
	db $0E,$10,$00,$00
	dw -10,3,$0800 : db $FF
	dw 6,3,$0802 : db $FF
	dw -5,-5,$0804 : db $00
	dw 3,-5,$0805 : db $00
.tiles:
	incbin "data/gfx/SpriteFrames8D.bin":5395..5715
SpriteFrame843:
	db $06,$80
	dw $000C
	dw -15,11,-38,3
	dw $00C0,$00C0
	dw .tiles-SpriteFrame843
	db $F3,$01,$00,$00
	dw -5,-12,$0800 : db $FF
	dw -10,-28,$0802 : db $FF
	dw 11,-12,$0804 : db $00
	dw -15,-44,$0805 : db $00
	dw -15,-36,$0814 : db $00
	dw 1,-36,$0815 : db $00
.tiles:
	incbin "data/gfx/SpriteFrames8D.bin":5779..6163
SpriteFrame844:
	db $05,$80
	dw $000E
	dw -18,12,-28,5
	dw $0100,$00C0
	dw .tiles-SpriteFrame844
	db $EC,$03,$00,$00
	dw -18,-28,$0800 : db $FF
	dw -13,-12,$0802 : db $FF
	dw 3,-12,$0804 : db $FF
	dw -2,-20,$0806 : db $00
	dw -8,4,$0807 : db $00
.tiles:
	incbin "data/gfx/SpriteFrames8D.bin":6220..6668
SpriteFrame845:
	db $07,$80
	dw $0010
	dw -36,16,-23,8
	dw $0100,$0100
	dw .tiles-SpriteFrame845
	db $DB,$01,$00,$00
	dw -20,-23,$0800 : db $FF
	dw -19,-7,$0802 : db $FF
	dw -3,-7,$0804 : db $FF
	dw -36,-23,$0806 : db $00
	dw -28,-23,$0807 : db $00
	dw 13,-7,$0816 : db $00
	dw 13,1,$0817 : db $00
.tiles:
	incbin "data/gfx/SpriteFrames8D.bin":6739..7251
SpriteFrame846:
	db $05,$80
	dw $000E
	dw -46,12,-1,16
	dw $0100,$00C0
	dw .tiles-SpriteFrame846
	db $D2,$04,$00,$00
	dw -30,2,$0800 : db $FF
	dw -14,2,$0802 : db $FF
	dw 2,1,$0804 : db $FF
	dw -46,-1,$0806 : db $00
	dw -38,-1,$0807 : db $00
.tiles:
	incbin "data/gfx/SpriteFrames8D.bin":7308..7756
SpriteFrame847:
	db $04,$80
	dw $000A
	dw -1,19,-37,1
	dw $00C0,$0080
	dw .tiles-SpriteFrame847
	db $00,$00,$02,$00
	dw 5,-37,$0800 : db $FF
	dw 1,-21,$0802 : db $FF
	dw -1,-5,$0804 : db $00
	dw 7,-5,$0805 : db $00
.tiles:
	incbin "data/gfx/SpriteFrames8D.bin":7806..8126
SpriteFrame848:
	db $03,$80
	dw $0009
	dw -14,3,-28,-2
	dw $00A0,$0080
	dw .tiles-SpriteFrame848
	db $00,$00,$00,$00
	dw -14,-28,$0800 : db $FF
	dw -10,-12,$0802 : db $FF
	dw 2,-20,$0804 : db $00
.tiles:
	incbin "data/gfx/SpriteFrames8D.bin":8169..8457
