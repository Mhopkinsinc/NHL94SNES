; Bank $8E, first 4 KB: SpriteFrames continued (see bank82_8000), tiles from data/gfx/SpriteFrames8E.bin.

org $8E8000
SpriteFrame899:
	db $06,$80
	dw $0009
	dw -41,-20,-24,-2
	dw $00A0,$0080
	dw .tiles-SpriteFrame899
	db $00,$00,$00,$00
	dw -41,-24,$0800 : db $FF
	dw -25,-24,$0802 : db $00
	dw -25,-16,$0803 : db $00
	dw -36,-8,$0812 : db $00
	dw -28,-8,$0813 : db $00
	dw -20,-8,$0804 : db $00
.tiles:
	incbin "data/gfx/SpriteFrames8E.bin":64..352
SpriteFrame900:
	db $02,$80
	dw $0008
	dw -18,-1,-28,2
	dw $0080,$0080
	dw .tiles-SpriteFrame900
	db $00,$00,$E9,$E6
	dw -18,-28,$0800 : db $FF
	dw -14,-12,$0802 : db $FF
.tiles:
	incbin "data/gfx/SpriteFrames8E.bin":388..644
SpriteFrame901:
	db $05,$80
	dw $000B
	dw -32,-4,-23,-2
	dw $00C0,$00A0
	dw .tiles-SpriteFrame901
	db $00,$00,$E6,$E2
	dw -32,-23,$0800 : db $FF
	dw -16,-23,$0802 : db $FF
	dw -32,-7,$0804 : db $00
	dw -24,-7,$0805 : db $00
	dw -15,-7,$0814 : db $00
.tiles:
	incbin "data/gfx/SpriteFrames8E.bin":701..1053
SpriteFrame902:
	db $05,$80
	dw $000B
	dw -19,5,-28,2
	dw $00C0,$00A0
	dw .tiles-SpriteFrame902
	db $00,$00,$F4,$ED
	dw -19,-28,$0800 : db $FF
	dw -14,-12,$0802 : db $FF
	dw -3,-28,$0804 : db $00
	dw -3,-20,$0805 : db $00
	dw 2,-12,$0814 : db $00
.tiles:
	incbin "data/gfx/SpriteFrames8E.bin":1110..1462
SpriteFrame903:
	db $04,$80
	dw $000A
	dw -32,-4,-28,-4
	dw $00C0,$0080
	dw .tiles-SpriteFrame903
	db $00,$00,$EF,$E7
	dw -32,-22,$0800 : db $FF
	dw -16,-28,$0802 : db $FF
	dw -16,-12,$0804 : db $00
	dw -16,-4,$0805 : db $00
.tiles:
	incbin "data/gfx/SpriteFrames8E.bin":1512..1832
SpriteFrame904:
	db $06,$80
	dw $0009
	dw -41,-20,-24,-2
	dw $00A0,$0080
	dw .tiles-SpriteFrame904
	db $00,$00,$00,$00
	dw -41,-24,$0800 : db $FF
	dw -25,-24,$0802 : db $00
	dw -25,-16,$0803 : db $00
	dw -36,-8,$0812 : db $00
	dw -28,-8,$0813 : db $00
	dw -20,-8,$0804 : db $00
.tiles:
	incbin "data/gfx/SpriteFrames8E.bin":1896..2184
SpriteFrame905:
	db $05,$80
	dw $000B
	dw -15,2,-33,1
	dw $00C0,$00A0
	dw .tiles-SpriteFrame905
	db $00,$00,$F8,$EE
	dw -15,-33,$0800 : db $FF
	dw -14,-17,$0802 : db $FF
	dw 2,-9,$0804 : db $00
	dw -11,-1,$0805 : db $00
	dw -3,-1,$0814 : db $00
.tiles:
	incbin "data/gfx/SpriteFrames8E.bin":2241..2593
SpriteFrame906:
	db $05,$80
	dw $000B
	dw -30,-1,-40,-5
	dw $00C0,$00A0
	dw .tiles-SpriteFrame906
	db $00,$00,$FA,$E4
	dw -30,-29,$0800 : db $FF
	dw -14,-19,$0802 : db $FF
	dw -22,-13,$0804 : db $00
	dw -6,-40,$0805 : db $00
	dw -14,-32,$0814 : db $00
.tiles:
	incbin "data/gfx/SpriteFrames8E.bin":2650..3002
SpriteFrame907:
	db $06,$80
	dw $000F
	dw -14,15,-31,2
	dw $0100,$00E0
	dw .tiles-SpriteFrame907
	db $00,$00,$09,$DE
	dw -14,-31,$0800 : db $FF
	dw 2,-31,$0802 : db $FF
	dw -12,-15,$0804 : db $FF
	dw 4,-15,$0806 : db $00
	dw 4,-7,$0807 : db $00
	dw -10,1,$0816 : db $00
.tiles:
	incbin "data/gfx/SpriteFrames8E.bin":3066..3546
SpriteFrame908:
	db $04,$80
	dw $000D
	dw -31,-2,-29,-5
	dw $00E0,$00C0
	dw .tiles-SpriteFrame908
	db $00,$00,$FA,$DF
	dw -31,-29,$0800 : db $FF
	dw -15,-29,$0802 : db $FF
	dw -20,-13,$0804 : db $FF
	dw -4,-13,$0806 : db $00
.tiles:
	incbin "data/gfx/SpriteFrames8E.bin":3596..4012
SpriteFrame909:
	db $05,$80
	dw $0008
	dw -38,-19,-24,-3
	dw $0080,$0080
	dw .tiles-SpriteFrame909
	db $00,$00,$00,$00
	dw -38,-24,$0800 : db $FF
	dw -22,-24,$0802 : db $00
	dw -22,-16,$0803 : db $00
	dw -38,-8,$0812 : db $00
	dw -30,-8,$0813 : db $00
.tiles:
	incbin "data/gfx/SpriteFrames8E.bin":4069..4325
