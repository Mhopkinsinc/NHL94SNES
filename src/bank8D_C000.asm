; Bank $8D, fifth 4 KB: SpriteFrames continued (see bank82_8000), tiles from Extracted/data/SpriteFrames8D.bin.

org $8DC1B2
SpriteFrame867:
	db $05,$80
	dw $0014
	dw -18,28,-29,0
	dw $0140,$0140
	dw .tiles-SpriteFrame867
	db $1C,$FE,$00,$00
	dw -18,-29,$0800 : db $FF
	dw -2,-29,$0802 : db $FF
	dw -18,-13,$0804 : db $FF
	dw -2,-13,$0806 : db $FF
	dw 14,-13,$0808 : db $FF
.tiles:
	incbin "../Extracted/data/SpriteFrames8D.bin":16875..17515
SpriteFrame868:
	db $07,$80
	dw $0013
	dw -19,23,-25,-1
	dw $0140,$0120
	dw .tiles-SpriteFrame868
	db $15,$FD,$00,$00
	dw -19,-25,$0800 : db $FF
	dw -3,-25,$0802 : db $FF
	dw -19,-9,$0804 : db $FF
	dw -3,-9,$0806 : db $FF
	dw 17,-25,$0808 : db $00
	dw 17,-17,$0809 : db $00
	dw 13,-9,$0818 : db $00
.tiles:
	incbin "../Extracted/data/SpriteFrames8D.bin":17586..18194
SpriteFrame869:
	db $05,$80
	dw $000E
	dw -14,10,-32,0
	dw $0100,$00C0
	dw .tiles-SpriteFrame869
	db $FA,$FE,$00,$00
	dw -12,-32,$0800 : db $FF
	dw -14,-16,$0802 : db $FF
	dw 2,-16,$0804 : db $FF
	dw 4,-24,$0806 : db $00
	dw -9,0,$0807 : db $00
.tiles:
	incbin "../Extracted/data/SpriteFrames8D.bin":18251..18699
SpriteFrame870:
	db $04,$80
	dw $000A
	dw -15,13,-23,0
	dw $00C0,$0080
	dw .tiles-SpriteFrame870
	db $F8,$ED,$00,$FD
	dw -15,-15,$0800 : db $FF
	dw 1,-15,$0802 : db $FF
	dw -14,-23,$0804 : db $00
	dw -6,-23,$0805 : db $00
.tiles:
	incbin "../Extracted/data/SpriteFrames8D.bin":18749..19069
SpriteFrame871:
	db $05,$80
	dw $0011
	dw -23,12,-39,0
	dw $0120,$0100
	dw .tiles-SpriteFrame871
	db $EA,$FF,$00,$00
	dw -17,-15,$0800 : db $FF
	dw -1,-15,$0802 : db $FF
	dw -19,-31,$0804 : db $FF
	dw -3,-31,$0806 : db $FF
	dw -23,-39,$0808 : db $00
.tiles:
	incbin "../Extracted/data/SpriteFrames8D.bin":19126..19670
SpriteFrame872:
	db $05,$80
	dw $0011
	dw -13,14,-40,0
	dw $0120,$0100
	dw .tiles-SpriteFrame872
	db $F5,$FF,$00,$00
	dw -11,-40,$0800 : db $FF
	dw -12,-24,$0802 : db $FF
	dw 4,-24,$0804 : db $FF
	dw -13,-8,$0806 : db $FF
	dw 3,-8,$0808 : db $00
.tiles:
	incbin "../Extracted/data/SpriteFrames8D.bin":19727..20271
SpriteFrame873:
	db $04,$80
	dw $0010
	dw -15,12,-28,0
	dw $0100,$0100
	dw .tiles-SpriteFrame873
	db $0C,$00,$00,$00
	dw -14,-28,$0800 : db $FF
	dw 2,-28,$0802 : db $FF
	dw -15,-12,$0804 : db $FF
	dw 1,-12,$0806 : db $FF
.tiles:
	incbin "../Extracted/data/SpriteFrames8D.bin":20321..20833
