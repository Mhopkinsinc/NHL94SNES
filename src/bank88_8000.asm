; Bank $88, first 4 KB: SpriteFrames continued (see bank82_8000), tiles from data/gfx/SpriteFrames88.bin.

org $888000
SpriteFrame468:
	db $05,$80
	dw $0011
	dw -28,15,-25,4
	dw $0120,$0100
	dw .tiles-SpriteFrame468
	db $E6,$00,$03,$04
	dw -28,-25,$0800 : db $FF
	dw -12,-25,$0802 : db $FF
	dw 4,-25,$0804 : db $FF
	dw -9,-9,$0806 : db $FF
	dw 7,-1,$0808 : db $00
.tiles:
	incbin "data/gfx/SpriteFrames88.bin":57..601
SpriteFrame469:
	db $05,$80
	dw $0011
	dw -19,13,-30,4
	dw $0120,$0100
	dw .tiles-SpriteFrame469
	db $EF,$FE,$06,$02
	dw -18,-30,$0800 : db $FF
	dw -2,-30,$0802 : db $FF
	dw -19,-14,$0804 : db $FF
	dw -3,-14,$0806 : db $FF
	dw 6,2,$0808 : db $00
.tiles:
	incbin "data/gfx/SpriteFrames88.bin":658..1202
SpriteFrame470:
	db $05,$80
	dw $000E
	dw -13,8,-37,7
	dw $0100,$00C0
	dw .tiles-SpriteFrame470
	db $FD,$08,$05,$04
	dw -7,-8,$0800 : db $FF
	dw -13,-24,$0802 : db $FF
	dw -12,-40,$0804 : db $FF
	dw 3,-24,$0806 : db $00
	dw 3,-16,$0807 : db $00
.tiles:
	incbin "data/gfx/SpriteFrames88.bin":1259..1707
SpriteFrame471:
	db $07,$80
	dw $0010
	dw -27,12,-27,2
	dw $0100,$0100
	dw .tiles-SpriteFrame471
	db $E7,$FE,$03,$04
	dw -5,-13,$0800 : db $FF
	dw -27,-29,$0802 : db $FF
	dw -11,-29,$0804 : db $FF
	dw -23,-5,$0806 : db $00
	dw -15,-5,$0807 : db $00
	dw 11,-13,$0816 : db $00
	dw 11,-5,$0817 : db $00
.tiles:
	incbin "data/gfx/SpriteFrames88.bin":1778..2290
SpriteFrame472:
	db $05,$80
	dw $0011
	dw -12,14,-41,4
	dw $0120,$0100
	dw .tiles-SpriteFrame472
	db $F5,$FC,$06,$06
	dw -12,-41,$0800 : db $FF
	dw -10,-25,$0802 : db $FF
	dw 6,-25,$0804 : db $FF
	dw -11,-9,$0806 : db $FF
	dw 5,-1,$0808 : db $00
.tiles:
	incbin "data/gfx/SpriteFrames88.bin":2347..2891
SpriteFrame473:
	db $0A,$80
	dw $0013
	dw -28,15,-27,7
	dw $0140,$0120
	dw .tiles-SpriteFrame473
	db $E7,$04,$05,$06
	dw -28,-26,$0800 : db $FF
	dw -12,-27,$0802 : db $FF
	dw -12,-11,$0804 : db $FF
	dw -28,1,$0806 : db $00
	dw -20,1,$0807 : db $00
	dw -12,5,$0816 : db $00
	dw -4,5,$0817 : db $00
	dw 4,-21,$0808 : db $00
	dw 12,-21,$0809 : db $00
	dw 4,0,$0818 : db $00
.tiles:
	incbin "data/gfx/SpriteFrames88.bin":2983..3591
SpriteFrame474:
	db $04,$80
	dw $0010
	dw -26,7,-25,5
	dw $0100,$0100
	dw .tiles-SpriteFrame474
	db $E7,$FD,$FF,$07
	dw -26,-25,$0800 : db $FF
	dw -10,-25,$0802 : db $FF
	dw -24,-9,$0804 : db $FF
	dw -8,-9,$0806 : db $FF
.tiles:
	incbin "data/gfx/SpriteFrames88.bin":3641..4153
