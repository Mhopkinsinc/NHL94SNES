; Bank $8A, sixth 4 KB: SpriteFrames continued (see bank82_8000), tiles from data/gfx/SpriteFrames8A.bin.

org $8AD0E5
SpriteFrame660:
	db $05,$80
	dw $000B
	dw -13,8,-25,3
	dw $00C0,$00A0
	dw .tiles-SpriteFrame660
	db $F7,$FA,$F7,$FA
	dw -9,-25,$0800 : db $FF
	dw -13,-9,$0802 : db $FF
	dw 7,-25,$0804 : db $00
	dw 3,-9,$0805 : db $00
	dw 3,-1,$0814 : db $00
.tiles:
	incbin "data/gfx/SpriteFrames8A.bin":20766..21118
SpriteFrame661:
	db $05,$80
	dw $000E
	dw -12,14,-25,6
	dw $0100,$00C0
	dw .tiles-SpriteFrame661
	db $F5,$F7,$F3,$F0
	dw -12,-25,$0800 : db $FF
	dw 4,-25,$0802 : db $FF
	dw -11,-9,$0804 : db $FF
	dw 5,-9,$0806 : db $00
	dw 5,-1,$0807 : db $00
.tiles:
	incbin "data/gfx/SpriteFrames8A.bin":21175..21623
SpriteFrame662:
	db $08,$80
	dw $000E
	dw -12,11,-32,2
	dw $0100,$00C0
	dw .tiles-SpriteFrame662
	db $FD,$E8,$08,$EB
	dw -9,-13,$0800 : db $FF
	dw -12,-29,$0802 : db $FF
	dw 7,-13,$0804 : db $00
	dw 7,-5,$0805 : db $00
	dw 4,-29,$0814 : db $00
	dw 4,-21,$0815 : db $00
	dw -11,-37,$0806 : db $00
	dw -3,-37,$0807 : db $00
.tiles:
	incbin "data/gfx/SpriteFrames8A.bin":21701..22149
SpriteFrame663:
	db $06,$80
	dw $000C
	dw -7,18,-24,5
	dw $00C0,$00C0
	dw .tiles-SpriteFrame663
	db $0D,$F7,$13,$EF
	dw 0,-24,$0800 : db $FF
	dw -7,-8,$0802 : db $FF
	dw 16,-24,$0804 : db $00
	dw 16,-16,$0805 : db $00
	dw 9,-8,$0814 : db $00
	dw 17,-8,$0815 : db $00
.tiles:
	incbin "data/gfx/SpriteFrames8A.bin":22213..22597
SpriteFrame664:
	db $04,$80
	dw $0010
	dw -5,28,-26,5
	dw $0100,$0100
	dw .tiles-SpriteFrame664
	db $10,$EF,$19,$EF
	dw 3,-26,$0800 : db $FF
	dw 19,-26,$0802 : db $FF
	dw -5,-10,$0804 : db $FF
	dw 11,-10,$0806 : db $FF
.tiles:
	incbin "data/gfx/SpriteFrames8A.bin":22647..23159
SpriteFrame665:
	db $05,$80
	dw $0011
	dw -4,31,-21,5
	dw $0120,$0100
	dw .tiles-SpriteFrame665
	db $15,$04,$1A,$F5
	dw 0,-21,$0800 : db $FF
	dw 16,-21,$0802 : db $FF
	dw -4,-5,$0804 : db $FF
	dw 12,-5,$0806 : db $FF
	dw 28,-5,$0808 : db $00
.tiles:
	incbin "data/gfx/SpriteFrames8A.bin":23216..23760
SpriteFrame666:
	db $04,$80
	dw $000D
	dw 2,48,-11,8
	dw $00E0,$00C0
	dw .tiles-SpriteFrame666
	db $22,$FD,$2B,$FE
	dw 33,-11,$0800 : db $FF
	dw 17,-9,$0802 : db $FF
	dw 1,-6,$0804 : db $FF
	dw 33,5,$0806 : db $00
.tiles:
	incbin "data/gfx/SpriteFrames8A.bin":23810..24226
SpriteFrame667:
	db $05,$80
	dw $0011
	dw -6,28,-22,7
	dw $0120,$0100
	dw .tiles-SpriteFrame667
	db $0E,$04,$16,$F4
	dw -3,-22,$0800 : db $FF
	dw 13,-22,$0802 : db $FF
	dw -6,-6,$0804 : db $FF
	dw 10,-6,$0806 : db $FF
	dw 26,-6,$0808 : db $00
.tiles:
	incbin "data/gfx/SpriteFrames8A.bin":24283..24827
