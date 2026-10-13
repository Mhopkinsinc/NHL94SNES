; Bank $8E, second 4 KB: SpriteFrames continued (see bank82_8000), tiles from Extracted/data/SpriteFrames8E.bin.

org $8E90E5
SpriteFrame910:
	db $04,$80
	dw $000A
	dw -24,-1,-29,1
	dw $00C0,$0080
	dw .tiles-SpriteFrame910
	db $00,$00,$D8,$DD
	dw -24,-29,$0800 : db $FF
	dw -14,-13,$0802 : db $FF
	dw -8,-29,$0804 : db $00
	dw -8,-21,$0805 : db $00
.tiles:
	incbin "../Extracted/data/SpriteFrames8E.bin":4375..4695
SpriteFrame911:
	db $03,$80
	dw $0009
	dw -33,-5,-30,-10
	dw $00A0,$0080
	dw .tiles-SpriteFrame911
	db $00,$00,$D6,$D8
	dw -33,-25,$0800 : db $FF
	dw -17,-25,$0802 : db $FF
	dw -30,-33,$0804 : db $00
.tiles:
	incbin "../Extracted/data/SpriteFrames8E.bin":4738..5026
SpriteFrame912:
	db $04,$80
	dw $000A
	dw -33,-2,-30,0
	dw $00C0,$0080
	dw .tiles-SpriteFrame912
	db $00,$00,$DF,$E3
	dw -17,-30,$0800 : db $FF
	dw -16,-14,$0802 : db $FF
	dw -33,-30,$0804 : db $00
	dw -25,-30,$0805 : db $00
.tiles:
	incbin "../Extracted/data/SpriteFrames8E.bin":5076..5396
SpriteFrame913:
	db $03,$80
	dw $0009
	dw -33,-5,-30,-10
	dw $00A0,$0080
	dw .tiles-SpriteFrame913
	db $00,$00,$D6,$D8
	dw -33,-25,$0800 : db $FF
	dw -17,-25,$0802 : db $FF
	dw -30,-33,$0804 : db $00
.tiles:
	incbin "../Extracted/data/SpriteFrames8E.bin":5439..5727
SpriteFrame914:
	db $06,$80
	dw $0009
	dw -41,-20,-24,-2
	dw $00A0,$0080
	dw .tiles-SpriteFrame914
	db $00,$00,$00,$00
	dw -41,-24,$0800 : db $FF
	dw -25,-24,$0802 : db $00
	dw -25,-16,$0803 : db $00
	dw -36,-8,$0812 : db $00
	dw -28,-8,$0813 : db $00
	dw -20,-8,$0804 : db $00
.tiles:
	incbin "../Extracted/data/SpriteFrames8E.bin":5791..6079
SpriteFrame915:
	db $02,$80
	dw $0008
	dw -32,-17,-27,-2
	dw $0080,$0080
	dw .tiles-SpriteFrame915
	db $00,$00,$00,$00
	dw -32,-27,$0800 : db $FF
	dw -31,-11,$0802 : db $FF
.tiles:
	incbin "../Extracted/data/SpriteFrames8E.bin":6115..6371
SpriteFrame916:
	db $08,$80
	dw $001A
	dw -3,14,-90,4
	dw $01C0,$0180
	dw .tiles-SpriteFrame916
	db $04,$00,$5D,$00
	dw -3,-90,$0800 : db $FF
	dw -3,-74,$0802 : db $FF
	dw -3,-58,$0804 : db $FF
	dw -3,-42,$0806 : db $FF
	dw -3,-26,$0808 : db $FF
	dw -3,-10,$080A : db $FF
	dw 13,-58,$080C : db $00
	dw 13,-42,$080D : db $00
.tiles:
	incbin "../Extracted/data/SpriteFrames8E.bin":6449..7281
SpriteFrame917:
	db $08,$80
	dw $001A
	dw -3,14,-89,5
	dw $01C0,$0180
	dw .tiles-SpriteFrame917
	db $07,$00,$5D,$00
	dw -3,-89,$0800 : db $FF
	dw -3,-73,$0802 : db $FF
	dw -3,-57,$0804 : db $FF
	dw -3,-41,$0806 : db $FF
	dw -3,-25,$0808 : db $FF
	dw -3,-9,$080A : db $FF
	dw 13,-59,$080C : db $00
	dw 13,-41,$080D : db $00
.tiles:
	incbin "../Extracted/data/SpriteFrames8E.bin":7359..8191
SpriteFrame918:
	db $0A,$80
	dw $001C
	dw -3,14,-88,8
	dw $01C0,$01C0
	dw .tiles-SpriteFrame918
	db $07,$00,$5D,$00
	dw -3,-88,$0800 : db $FF
	dw -3,-72,$0802 : db $FF
	dw -3,-56,$0804 : db $FF
	dw -3,-40,$0806 : db $FF
	dw -3,-24,$0808 : db $FF
	dw -3,-8,$080A : db $FF
	dw 13,-88,$080C : db $00
	dw 13,-48,$080D : db $00
	dw 13,-24,$081C : db $00
	dw 5,8,$081D : db $00
.tiles:
	incbin "../Extracted/data/SpriteFrames8E.bin":8283..9179
