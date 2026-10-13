; Bank $8E, third 4 KB: SpriteFrames continued (see bank82_8000), tiles from data/gfx/SpriteFrames8E.bin.

org $8EA3DB
SpriteFrame919:
	db $09,$80
	dw $001B
	dw -3,14,-92,5
	dw $01C0,$01A0
	dw .tiles-SpriteFrame919
	db $08,$00,$5D,$00
	dw -3,-92,$0800 : db $FF
	dw -3,-76,$0802 : db $FF
	dw -3,-60,$0804 : db $FF
	dw -3,-44,$0806 : db $FF
	dw -3,-28,$0808 : db $FF
	dw -3,-12,$080A : db $FF
	dw 13,-92,$080C : db $00
	dw 13,-36,$080D : db $00
	dw 5,4,$081C : db $00
.tiles:
	incbin "data/gfx/SpriteFrames8E.bin":9264..10128
SpriteFrame920:
	db $0C,$80
	dw $001E
	dw -3,14,-91,5
	dw $0200,$01C0
	dw .tiles-SpriteFrame920
	db $08,$00,$5D,$00
	dw -3,-91,$0800 : db $FF
	dw -3,-75,$0802 : db $FF
	dw -3,-59,$0804 : db $FF
	dw -3,-43,$0806 : db $FF
	dw -3,-27,$0808 : db $FF
	dw -3,-11,$080A : db $FF
	dw 13,-91,$080C : db $00
	dw 13,-83,$080D : db $00
	dw 13,-51,$081C : db $00
	dw 13,-43,$081D : db $00
	dw 13,-35,$080E : db $00
	dw 5,5,$080F : db $00
.tiles:
	incbin "data/gfx/SpriteFrames8E.bin":10234..11194
SpriteFrame921:
	db $07,$80
	dw $0019
	dw -3,14,-89,5
	dw $01A0,$0180
	dw .tiles-SpriteFrame921
	db $08,$00,$5D,$00
	dw -3,-89,$0800 : db $FF
	dw -3,-73,$0802 : db $FF
	dw -3,-57,$0804 : db $FF
	dw -3,-41,$0806 : db $FF
	dw -3,-25,$0808 : db $FF
	dw -3,-9,$080A : db $FF
	dw 13,-25,$080C : db $00
.tiles:
	incbin "data/gfx/SpriteFrames8E.bin":11265..12065
SpriteFrame922:
	db $08,$80
	dw $001A
	dw -3,13,-89,6
	dw $01C0,$0180
	dw .tiles-SpriteFrame922
	db $00,$00,$00,$00
	dw -3,-89,$0800 : db $FF
	dw -3,-73,$0802 : db $FF
	dw -3,-57,$0804 : db $FF
	dw -3,-41,$0806 : db $FF
	dw -3,-25,$0808 : db $FF
	dw -3,-9,$080A : db $FF
	dw 13,-89,$080C : db $00
	dw 13,-49,$080D : db $00
.tiles:
	incbin "data/gfx/SpriteFrames8E.bin":12143..12975
