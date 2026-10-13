; Bank $87, fourth 4 KB: SpriteFrames continued (see bank82_8000), tiles from data/gfx/SpriteFrames87.bin.

org $87B063
SpriteFrame424:
	db $0A,$80
	dw $001C
	dw -46,7,-42,3
	dw $01C0,$01C0
	dw .tiles-SpriteFrame424
	db $01,$02,$04,$04
	dw -30,-42,$0800 : db $FF
	dw -37,-26,$0802 : db $FF
	dw -21,-26,$0804 : db $FF
	dw -46,-10,$0806 : db $FF
	dw -30,-10,$0808 : db $FF
	dw -14,-10,$080A : db $FF
	dw -14,-42,$080C : db $00
	dw -14,-34,$080D : db $00
	dw 2,-10,$081C : db $00
	dw 2,-2,$081D : db $00
.tiles:
	incbin "data/gfx/SpriteFrames87.bin":12479..13375
SpriteFrame425:
	db $07,$80
	dw $001C
	dw -41,2,-42,1
	dw $01C0,$01C0
	dw .tiles-SpriteFrame425
	db $E4,$01,$E6,$03
	dw -36,-42,$0800 : db $FF
	dw -20,-42,$0802 : db $FF
	dw -37,-26,$0804 : db $FF
	dw -21,-26,$0806 : db $FF
	dw -41,-10,$0808 : db $FF
	dw -25,-10,$080A : db $FF
	dw -9,-10,$080C : db $FF
.tiles:
	incbin "data/gfx/SpriteFrames87.bin":13446..14342
SpriteFrame426:
	db $0A,$80
	dw $001C
	dw -44,13,-37,2
	dw $01C0,$01C0
	dw .tiles-SpriteFrame426
	db $E4,$01,$E8,$03
	dw -44,-13,$0800 : db $FF
	dw -28,-13,$0802 : db $FF
	dw -12,-13,$0804 : db $FF
	dw 4,-13,$0806 : db $FF
	dw -36,-29,$0808 : db $FF
	dw -20,-29,$080A : db $FF
	dw -32,-37,$080C : db $00
	dw -24,-37,$080D : db $00
	dw -16,-37,$081C : db $00
	dw -8,-37,$081D : db $00
.tiles:
	incbin "data/gfx/SpriteFrames87.bin":14434..15330
SpriteFrame427:
	db $08,$80
	dw $001D
	dw -42,10,-38,2
	dw $01E0,$01C0
	dw .tiles-SpriteFrame427
	db $E5,$01,$E7,$03
	dw -42,-13,$0800 : db $FF
	dw -26,-13,$0802 : db $FF
	dw -10,-13,$0804 : db $FF
	dw -36,-29,$0806 : db $FF
	dw -20,-29,$0808 : db $FF
	dw -32,-45,$080A : db $FF
	dw -16,-45,$080C : db $FF
	dw 6,-5,$080E : db $00
.tiles:
	incbin "data/gfx/SpriteFrames87.bin":15408..16336
SpriteFrame428:
	db $04,$80
	dw $000A
	dw -3,18,-63,-32
	dw $00C0,$0080
	dw .tiles-SpriteFrame428
	db $01,$02,$03,$04
	dw 3,-63,$0200 : db $FF
	dw 3,-47,$0202 : db $FF
	dw -5,-58,$0204 : db $00
	dw -5,-50,$0205 : db $00
.tiles:
	incbin "data/gfx/SpriteFrames87.bin":16386..16706
