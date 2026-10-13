; Bank $8E, fourth 4 KB: SpriteFrames continued (see bank82_8000), tiles from Extracted/data/SpriteFrames8E.bin.

org $8EB2AF
SpriteFrame923:
	db $0A,$80
	dw $001B
	dw -3,14,-89,7
	dw $01C0,$01A0
	dw .tiles-SpriteFrame923
	db $00,$00,$00,$00
	dw -3,-89,$0800 : db $FF
	dw -3,-73,$0802 : db $FF
	dw -3,-57,$0804 : db $FF
	dw -3,-41,$0806 : db $FF
	dw -3,-25,$0808 : db $FF
	dw -3,-9,$080A : db $FF
	dw 13,-89,$080C : db $00
	dw 13,-49,$080D : db $00
	dw -3,7,$081C : db $00
	dw 5,7,$081C : db $00
.tiles:
	incbin "../Extracted/data/SpriteFrames8E.bin":13067..13931
SpriteFrame924:
	db $12,$80
	dw $0023
	dw -3,16,-89,7
	dw $0440,$0020
	dw .tiles-SpriteFrame924
	db $00,$00,$00,$00
	dw -3,-89,$0800 : db $FF
	dw -3,-73,$0802 : db $FF
	dw -3,-57,$0804 : db $FF
	dw -3,-41,$0806 : db $FF
	dw -3,-25,$0808 : db $FF
	dw -3,-9,$080A : db $FF
	dw 13,-89,$080C : db $00
	dw 13,-81,$080D : db $00
	dw 13,-73,$081C : db $00
	dw 13,-65,$081D : db $00
	dw 13,-57,$080E : db $00
	dw 13,-49,$080F : db $00
	dw 13,-41,$081E : db $00
	dw 13,-33,$081F : db $00
	dw 13,-25,$0820 : db $00
	dw 13,-17,$0821 : db $00
	dw -3,7,$0830 : db $00
	dw 5,7,$0830 : db $00
.tiles:
	incbin "../Extracted/data/SpriteFrames8E.bin":14079..15199
SpriteFrame925:
	db $0E,$80
	dw $001E
	dw -3,15,-89,7
	dw $0200,$01C0
	dw .tiles-SpriteFrame925
	db $FF,$00,$FF,$00
	dw -3,-89,$0800 : db $FF
	dw -3,-73,$0802 : db $FF
	dw -3,-57,$0804 : db $FF
	dw -3,-41,$0806 : db $FF
	dw -3,-25,$0808 : db $FF
	dw -3,-9,$080A : db $FF
	dw 13,-73,$080C : db $00
	dw 13,-57,$080D : db $00
	dw 13,-49,$880D : db $00
	dw 13,-33,$081C : db $00
	dw 13,-25,$081D : db $00
	dw 13,-17,$080E : db $00
	dw -3,7,$080F : db $00
	dw 5,7,$080F : db $00
.tiles:
	incbin "../Extracted/data/SpriteFrames8E.bin":15319..16279
SpriteFrame926:
	db $0C,$80
	dw $001D
	dw -3,17,-89,7
	dw $01E0,$01C0
	dw .tiles-SpriteFrame926
	db $FF,$00,$FF,$00
	dw -3,-89,$0800 : db $FF
	dw -3,-73,$0802 : db $FF
	dw -3,-57,$0804 : db $FF
	dw -3,-41,$0806 : db $FF
	dw -3,-25,$0808 : db $FF
	dw -3,-9,$080A : db $FF
	dw 13,-57,$080C : db $00
	dw 13,-33,$080D : db $00
	dw 13,-25,$081C : db $00
	dw 13,-17,$081D : db $00
	dw -3,7,$080E : db $00
	dw 5,7,$080E : db $00
.tiles:
	incbin "../Extracted/data/SpriteFrames8E.bin":16385..17313
