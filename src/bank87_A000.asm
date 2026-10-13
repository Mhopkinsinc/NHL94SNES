; Bank $87, third 4 KB: SpriteFrames continued (see bank82_8000), tiles from data/gfx/SpriteFrames87.bin.

org $87A078
SpriteFrame410:
	db $01,$80
	dw $0004
	dw -8,4,-6,6
	dw $0040,$0040
	dw .tiles-SpriteFrame410
	db $00,$00,$00,$00
	dw -8,-6,$0000 : db $FF
.tiles:
	incbin "data/gfx/SpriteFrames87.bin":8341..8469
SpriteFrame411:
	db $04,$80
	dw $0005
	dw -11,8,-10,10
	dw $0060,$0040
	dw .tiles-SpriteFrame411
	db $00,$00,$00,$00
	dw -11,-10,$0000 : db $FF
	dw -7,-10,$4000 : db $FF
	dw -9,6,$0002 : db $00
	dw -1,6,$4002 : db $00
.tiles:
	incbin "data/gfx/SpriteFrames87.bin":8519..8679
SpriteFrame412:
	db $01,$80
	dw $0004
	dw -6,6,-6,6
	dw $0040,$0040
	dw .tiles-SpriteFrame412
	db $00,$00,$00,$00
	dw -6,-6,$0000 : db $FF
.tiles:
	incbin "data/gfx/SpriteFrames87.bin":8708..8836
SpriteFrame413:
	db $01,$80
	dw $0004
	dw -5,7,-5,5
	dw $0040,$0040
	dw .tiles-SpriteFrame413
	db $00,$00,$00,$00
	dw -5,-5,$0000 : db $FF
.tiles:
	incbin "data/gfx/SpriteFrames87.bin":8865..8993
SpriteFrame414:
	db $02,$00
	dw $0002
	dw -5,5,-4,3
	dw $0040,$0000
	dw .tiles-SpriteFrame414
	db $00,$00,$00,$00
	dw -5,-4,$0000 : db $00
	dw 3,-4,$0001 : db $00
.tiles:
	incbin "data/gfx/SpriteFrames87.bin":9029..9093
SpriteFrame415:
	db $03,$80
	dw $0006
	dw -5,20,-16,3
	dw $0080,$0040
	dw .tiles-SpriteFrame415
	db $00,$00,$00,$00
	dw -5,-9,$0000 : db $FF
	dw 11,-16,$0002 : db $00
	dw 19,-16,$0003 : db $00
.tiles:
	incbin "data/gfx/SpriteFrames87.bin":9136..9328
SpriteFrame416:
	db $03,$80
	dw $0006
	dw -5,11,-19,3
	dw $0080,$0040
	dw .tiles-SpriteFrame416
	db $00,$00,$00,$00
	dw -3,-19,$0000 : db $FF
	dw -5,-3,$0002 : db $00
	dw 3,-3,$0003 : db $00
.tiles:
	incbin "data/gfx/SpriteFrames87.bin":9371..9563
SpriteFrame417:
	db $03,$80
	dw $0006
	dw -5,7,-18,3
	dw $0080,$0040
	dw .tiles-SpriteFrame417
	db $00,$00,$00,$00
	dw -4,-18,$0000 : db $FF
	dw -5,-2,$0002 : db $00
	dw 3,-2,$0003 : db $00
.tiles:
	incbin "data/gfx/SpriteFrames87.bin":9606..9798
SpriteFrame418:
	db $02,$80
	dw $0005
	dw -5,3,-20,3
	dw $0060,$0040
	dw .tiles-SpriteFrame418
	db $00,$00,$00,$00
	dw -5,-12,$0000 : db $FF
	dw -5,-20,$0002 : db $00
.tiles:
	incbin "data/gfx/SpriteFrames87.bin":9834..9994
SpriteFrame419:
	db $03,$80
	dw $0006
	dw -8,3,-18,3
	dw $0080,$0040
	dw .tiles-SpriteFrame419
	db $00,$00,$00,$00
	dw -8,-18,$0000 : db $FF
	dw -5,-2,$0002 : db $00
	dw 3,-2,$0003 : db $00
.tiles:
	incbin "data/gfx/SpriteFrames87.bin":10037..10229
SpriteFrame420:
	db $03,$80
	dw $0006
	dw -13,3,-19,3
	dw $0080,$0040
	dw .tiles-SpriteFrame420
	db $00,$00,$00,$00
	dw -13,-19,$0000 : db $FF
	dw -5,-3,$0002 : db $00
	dw 3,-3,$0003 : db $00
.tiles:
	incbin "data/gfx/SpriteFrames87.bin":10272..10464
SpriteFrame421:
	db $04,$00
	dw $0004
	dw -22,3,-16,3
	dw $0080,$0000
	dw .tiles-SpriteFrame421
	db $00,$00,$00,$00
	dw -22,-16,$0000 : db $00
	dw -14,-16,$0001 : db $00
	dw -6,-4,$0002 : db $00
	dw 2,-4,$0003 : db $00
.tiles:
	incbin "data/gfx/SpriteFrames87.bin":10514..10642
SpriteFrame422:
	db $0A,$80
	dw $0016
	dw -40,5,-44,3
	dw $0180,$0140
	dw .tiles-SpriteFrame422
	db $01,$02,$03,$04
	dw -32,-44,$0800 : db $FF
	dw -34,-28,$0802 : db $FF
	dw -40,-12,$0804 : db $FF
	dw -24,-12,$0806 : db $FF
	dw -16,-44,$0808 : db $00
	dw -16,-36,$0809 : db $00
	dw -18,-28,$0818 : db $00
	dw -18,-20,$0819 : db $00
	dw -8,-4,$080A : db $00
	dw 0,-4,$080B : db $00
.tiles:
	incbin "data/gfx/SpriteFrames87.bin":10734..11438
SpriteFrame423:
	db $09,$80
	dw $001B
	dw -42,12,-42,3
	dw $01C0,$01A0
	dw .tiles-SpriteFrame423
	db $01,$02,$03,$04
	dw -29,-42,$0800 : db $FF
	dw -35,-26,$0802 : db $FF
	dw -19,-26,$0804 : db $FF
	dw -42,-10,$0806 : db $FF
	dw -26,-10,$0808 : db $FF
	dw -10,-10,$080A : db $FF
	dw -13,-42,$080C : db $00
	dw -13,-34,$080D : db $00
	dw 6,-2,$081C : db $00
.tiles:
	incbin "data/gfx/SpriteFrames87.bin":11523..12387
