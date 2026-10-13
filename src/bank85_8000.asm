; Bank $85, first 4 KB: SpriteFrames continued (see bank82_8000), tiles from data/gfx/SpriteFrames85.bin.

org $858000
SpriteFrame237:
	db $04,$80
	dw $000A
	dw -17,5,-17,14
	dw $00C0,$0080
	dw .tiles-SpriteFrame237
	db $F8,$0C,$03,$04
	dw -17,-17,$0800 : db $FF
	dw -17,-1,$0802 : db $FF
	dw -1,-10,$0804 : db $00
	dw -1,-2,$0805 : db $00
.tiles:
	incbin "data/gfx/SpriteFrames85.bin":50..370
SpriteFrame238:
	db $05,$80
	dw $000E
	dw -33,4,-23,4
	dw $0100,$00C0
	dw .tiles-SpriteFrame238
	db $E2,$03,$03,$04
	dw -33,-11,$0800 : db $FF
	dw -17,-11,$0802 : db $FF
	dw -16,-27,$0804 : db $FF
	dw -1,-11,$0806 : db $00
	dw -1,-3,$0807 : db $00
.tiles:
	incbin "data/gfx/SpriteFrames85.bin":427..875
SpriteFrame239:
	db $04,$80
	dw $000D
	dw -19,9,-25,7
	dw $00E0,$00C0
	dw .tiles-SpriteFrame239
	db $EF,$07,$03,$04
	dw -5,-25,$0800 : db $FF
	dw -19,-9,$0802 : db $FF
	dw -3,-9,$0804 : db $FF
	dw -17,7,$0806 : db $00
.tiles:
	incbin "data/gfx/SpriteFrames85.bin":925..1341
SpriteFrame240:
	db $05,$80
	dw $000E
	dw -20,8,-26,4
	dw $0100,$00C0
	dw .tiles-SpriteFrame240
	db $EE,$FC,$03,$04
	dw -20,-26,$0800 : db $FF
	dw -18,-10,$0802 : db $FF
	dw -2,-10,$0804 : db $FF
	dw -4,-26,$0806 : db $00
	dw -4,-18,$0807 : db $00
.tiles:
	incbin "data/gfx/SpriteFrames85.bin":1398..1846
SpriteFrame241:
	db $03,$80
	dw $0009
	dw -9,9,-26,3
	dw $00A0,$0080
	dw .tiles-SpriteFrame241
	db $F8,$F8,$03,$04
	dw -8,-26,$0800 : db $FF
	dw -9,-10,$0802 : db $FF
	dw 7,-2,$0804 : db $00
.tiles:
	incbin "data/gfx/SpriteFrames85.bin":1889..2177
SpriteFrame242:
	db $08,$80
	dw $000D
	dw -6,32,-20,3
	dw $00E0,$00C0
	dw .tiles-SpriteFrame242
	db $1D,$FA,$03,$04
	dw -3,-20,$0800 : db $FF
	dw 13,-20,$0802 : db $FF
	dw 29,-20,$0804 : db $00
	dw 29,-12,$C803 : db $00
	dw -6,-4,$0805 : db $00
	dw 2,-4,$0814 : db $00
	dw 10,-4,$0815 : db $00
	dw 18,-4,$0806 : db $00
.tiles:
	incbin "data/gfx/SpriteFrames85.bin":2255..2671
SpriteFrame243:
	db $05,$80
	dw $000E
	dw -8,34,-19,3
	dw $0100,$00C0
	dw .tiles-SpriteFrame243
	db $1F,$02,$05,$04
	dw -8,-12,$0800 : db $FF
	dw 8,-12,$0802 : db $FF
	dw 24,-12,$0804 : db $FF
	dw 0,-20,$0806 : db $00
	dw 8,-20,$0807 : db $00
.tiles:
	incbin "data/gfx/SpriteFrames85.bin":2728..3176
SpriteFrame244:
	db $04,$80
	dw $000A
	dw -4,18,-16,14
	dw $00C0,$0080
	dw .tiles-SpriteFrame244
	db $0F,$0D,$04,$04
	dw -4,-16,$0800 : db $FF
	dw -4,0,$0802 : db $FF
	dw 12,0,$0804 : db $00
	dw 12,8,$0805 : db $00
.tiles:
	incbin "data/gfx/SpriteFrames85.bin":3226..3546
SpriteFrame245:
	db $02,$80
	dw $0008
	dw -4,11,-14,16
	dw $0080,$0080
	dw .tiles-SpriteFrame245
	db $01,$0E,$03,$04
	dw -4,-14,$0800 : db $FF
	dw -3,2,$0802 : db $FF
.tiles:
	incbin "data/gfx/SpriteFrames85.bin":3582..3838
SpriteFrame246:
	db $03,$80
	dw $000C
	dw -27,4,-20,5
	dw $00C0,$00C0
	dw .tiles-SpriteFrame246
	db $E8,$04,$03,$04
	dw -27,-10,$0800 : db $FF
	dw -11,-10,$0802 : db $FF
	dw -12,-26,$0804 : db $FF
.tiles:
	incbin "data/gfx/SpriteFrames85.bin":3881..4265
