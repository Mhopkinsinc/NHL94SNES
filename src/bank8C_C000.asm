; Bank $8C, fifth 4 KB: SpriteFrames continued (see bank82_8000), tiles from data/gfx/SpriteFrames8C.bin.

org $8CC168
SpriteFrame795:
	db $07,$80
	dw $000D
	dw -11,13,-39,2
	dw $00E0,$00C0
	dw .tiles-SpriteFrame795
	db $00,$00,$00,$00
	dw -9,-23,$0800 : db $FF
	dw -11,-7,$0802 : db $FF
	dw 9,-39,$0804 : db $00
	dw 9,-31,$0805 : db $00
	dw 7,-23,$0814 : db $00
	dw 7,-15,$0815 : db $00
	dw 5,-7,$0806 : db $00
.tiles:
	incbin "data/gfx/SpriteFrames8C.bin":16815..17231
SpriteFrame796:
	db $05,$80
	dw $000B
	dw -9,14,-29,3
	dw $00C0,$00A0
	dw .tiles-SpriteFrame796
	db $00,$00,$00,$00
	dw -9,-24,$0800 : db $FF
	dw -9,-8,$0802 : db $FF
	dw 7,-29,$0804 : db $00
	dw 7,-21,$0805 : db $00
	dw 7,-9,$0814 : db $00
.tiles:
	incbin "data/gfx/SpriteFrames8C.bin":17288..17640
SpriteFrame797:
	db $05,$80
	dw $0011
	dw -10,18,-36,2
	dw $0120,$0100
	dw .tiles-SpriteFrame797
	db $01,$00,$00,$00
	dw -10,-13,$0800 : db $FF
	dw 6,-13,$0802 : db $FF
	dw -10,-29,$0804 : db $FF
	dw 6,-29,$0806 : db $FF
	dw 14,-37,$0808 : db $00
.tiles:
	incbin "data/gfx/SpriteFrames8C.bin":17697..18241
SpriteFrame798:
	db $04,$80
	dw $0010
	dw -11,19,-25,2
	dw $0100,$0100
	dw .tiles-SpriteFrame798
	db $00,$FF,$00,$00
	dw -11,-25,$0800 : db $FF
	dw 5,-25,$0802 : db $FF
	dw -8,-9,$0804 : db $FF
	dw 8,-9,$0806 : db $FF
.tiles:
	incbin "data/gfx/SpriteFrames8C.bin":18291..18803
SpriteFrame799:
	db $04,$80
	dw $000D
	dw -7,20,-29,3
	dw $00E0,$00C0
	dw .tiles-SpriteFrame799
	db $01,$00,$00,$00
	dw -7,-29,$0800 : db $FF
	dw -7,-13,$0802 : db $FF
	dw 9,-14,$0804 : db $FF
	dw 9,2,$0806 : db $00
.tiles:
	incbin "data/gfx/SpriteFrames8C.bin":18853..19269
SpriteFrame800:
	db $07,$80
	dw $000D
	dw -9,15,-34,2
	dw $00E0,$00C0
	dw .tiles-SpriteFrame800
	db $01,$00,$00,$00
	dw -7,-34,$0800 : db $FF
	dw -9,-18,$0802 : db $FF
	dw 7,-18,$0804 : db $00
	dw 7,-10,$0805 : db $00
	dw -7,-2,$0814 : db $00
	dw 1,-2,$0815 : db $00
	dw 9,-2,$0806 : db $00
.tiles:
	incbin "data/gfx/SpriteFrames8C.bin":19340..19756
SpriteFrame801:
	db $04,$80
	dw $000D
	dw -8,16,-36,2
	dw $00E0,$00C0
	dw .tiles-SpriteFrame801
	db $FF,$01,$00,$00
	dw -8,-28,$0800 : db $FF
	dw -8,-12,$0802 : db $FF
	dw 8,-36,$0804 : db $FF
	dw 8,-10,$0806 : db $00
.tiles:
	incbin "data/gfx/SpriteFrames8C.bin":19806..20222
SpriteFrame802:
	db $05,$80
	dw $000E
	dw -8,16,-28,2
	dw $0100,$00C0
	dw .tiles-SpriteFrame802
	db $FF,$02,$00,$00
	dw -8,-28,$0800 : db $FF
	dw 8,-28,$0802 : db $FF
	dw -6,-12,$0804 : db $FF
	dw 10,-12,$0806 : db $00
	dw 10,-4,$0807 : db $00
.tiles:
	incbin "data/gfx/SpriteFrames8C.bin":20279..20727
