; Bank $84, fourth 4 KB: SpriteFrames continued (see bank82_8000), tiles from data/gfx/SpriteFrames84.bin.

org $84B1AA
SpriteFrame189:
	db $05,$80
	dw $000E
	dw -6,9,-53,4
	dw $0100,$00C0
	dw .tiles-SpriteFrame189
	db $01,$FF,$00,$00
	dw -6,-37,$0800 : db $FF
	dw -5,-21,$0802 : db $FF
	dw -2,-5,$0804 : db $FF
	dw -1,-53,$0806 : db $00
	dw -1,-45,$0807 : db $00
.tiles:
	incbin "data/gfx/SpriteFrames84.bin":12771..13219
SpriteFrame190:
	db $08,$80
	dw $000E
	dw -9,10,-48,5
	dw $0100,$00C0
	dw .tiles-SpriteFrame190
	db $00,$FF,$00,$00
	dw -9,-32,$0800 : db $FF
	dw -9,-16,$0802 : db $FF
	dw -9,-48,$0804 : db $00
	dw -9,-40,$0805 : db $00
	dw -9,0,$0814 : db $00
	dw -1,0,$0815 : db $00
	dw 7,-29,$0806 : db $00
	dw 7,-1,$0807 : db $00
.tiles:
	incbin "data/gfx/SpriteFrames84.bin":13297..13745
SpriteFrame191:
	db $05,$80
	dw $000E
	dw -8,9,-52,5
	dw $0100,$00C0
	dw .tiles-SpriteFrame191
	db $01,$00,$00,$00
	dw -8,-36,$0800 : db $FF
	dw -4,-20,$0802 : db $FF
	dw -6,-4,$0804 : db $FF
	dw -8,-52,$0806 : db $00
	dw -8,-44,$0807 : db $00
.tiles:
	incbin "data/gfx/SpriteFrames84.bin":13802..14250
SpriteFrame192:
	db $07,$80
	dw $0010
	dw -10,10,-44,6
	dw $0100,$0100
	dw .tiles-SpriteFrame192
	db $FF,$01,$00,$00
	dw -8,-44,$0800 : db $FF
	dw -10,-28,$0802 : db $FF
	dw -10,-12,$0804 : db $FF
	dw 6,-28,$0806 : db $00
	dw 6,-20,$0807 : db $00
	dw 6,-4,$0816 : db $00
	dw -8,4,$0817 : db $00
.tiles:
	incbin "data/gfx/SpriteFrames84.bin":14321..14833
SpriteFrame193:
	db $09,$80
	dw $0012
	dw -11,10,-47,4
	dw $0140,$0100
	dw .tiles-SpriteFrame193
	db $00,$01,$00,$00
	dw -11,-47,$0800 : db $FF
	dw -11,-31,$0802 : db $FF
	dw -11,-15,$0804 : db $FF
	dw -11,1,$0806 : db $00
	dw -3,1,$0807 : db $00
	dw 5,-32,$0816 : db $00
	dw 5,-24,$0817 : db $00
	dw 5,-11,$0808 : db $00
	dw 5,-3,$0809 : db $00
.tiles:
	incbin "data/gfx/SpriteFrames84.bin":14918..15494
SpriteFrame194:
	db $04,$80
	dw $000D
	dw -9,8,-43,4
	dw $00E0,$00C0
	dw .tiles-SpriteFrame194
	db $00,$00,$00,$00
	dw -7,-43,$0800 : db $FF
	dw -9,-27,$0802 : db $FF
	dw -9,-11,$0804 : db $FF
	dw 7,-27,$0806 : db $00
.tiles:
	incbin "data/gfx/SpriteFrames84.bin":15544..15960
SpriteFrame195:
	db $04,$80
	dw $0010
	dw -7,9,-54,3
	dw $0100,$0100
	dw .tiles-SpriteFrame195
	db $00,$00,$00,$00
	dw -3,-54,$0800 : db $FF
	dw -6,-38,$0802 : db $FF
	dw -6,-22,$0804 : db $FF
	dw -7,-6,$0806 : db $FF
.tiles:
	incbin "data/gfx/SpriteFrames84.bin":16010..16522
