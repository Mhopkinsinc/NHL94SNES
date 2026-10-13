; Bank $84, last 4 KB: the last SpriteFrames frames of the bank (see bank82_8000), tiles from
; data/gfx/SpriteFrames84.bin. Then the centre ice logo tiles of the Dallas home team (see bank82_F000), from
; data/gfx/CenterIceDAL.lin.huf, and the last bytes of the bank.

org $84F045
SpriteFrame223:
	db $04,$80
	dw $000A
	dw -9,7,-33,2
	dw $00C0,$0080
	dw .tiles-SpriteFrame223
	db $01,$00,$00,$00
	dw -9,-33,$0800 : db $FF
	dw -5,-17,$0802 : db $FF
	dw -5,-1,$0804 : db $00
	dw 3,-1,$0805 : db $00
.tiles:
	incbin "data/gfx/SpriteFrames84.bin":28791..29111
SpriteFrame224:
	db $03,$80
	dw $0006
	dw -11,12,-39,-31
	dw $0080,$0040
	dw .tiles-SpriteFrame224
	db $00,$01,$00,$00
	dw -11,-39,$0200 : db $FF
	dw 5,-39,$0202 : db $00
	dw 5,-31,$0203 : db $00
.tiles:
	incbin "data/gfx/SpriteFrames84.bin":29154..29346
SpriteFrame225:
	db $01,$80
	dw $0004
	dw -2,10,-39,-30
	dw $0040,$0040
	dw .tiles-SpriteFrame225
	db $00,$00,$00,$00
	dw -2,-39,$0200 : db $FF
.tiles:
	incbin "data/gfx/SpriteFrames84.bin":29375..29503
SpriteFrame226:
	db $01,$80
	dw $0004
	dw -3,5,-39,-30
	dw $0040,$0040
	dw .tiles-SpriteFrame226
	db $01,$01,$00,$00
	dw -3,-39,$0200 : db $FF
.tiles:
	incbin "data/gfx/SpriteFrames84.bin":29532..29660
SpriteFrame227:
	db $01,$80
	dw $0004
	dw -6,6,-39,-30
	dw $0040,$0040
	dw .tiles-SpriteFrame227
	db $01,$01,$00,$00
	dw -6,-39,$0200 : db $FF
.tiles:
	incbin "data/gfx/SpriteFrames84.bin":29689..29817
SpriteFrame228:
	db $02,$80
	dw $0005
	dw -12,11,-39,-31
	dw $0060,$0040
	dw .tiles-SpriteFrame228
	db $00,$00,$00,$00
	dw -12,-39,$0200 : db $FF
	dw 4,-39,$0202 : db $00
.tiles:
	incbin "data/gfx/SpriteFrames84.bin":29853..30013
SpriteFrame229:
	db $01,$80
	dw $0004
	dw -7,8,-39,-29
	dw $0040,$0040
	dw .tiles-SpriteFrame229
	db $01,$00,$00,$00
	dw -7,-39,$0200 : db $FF
.tiles:
	incbin "data/gfx/SpriteFrames84.bin":30042..30170
SpriteFrame230:
	db $02,$00
	dw $0002
	dw -4,3,-39,-30
	dw $0040,$0000
	dw .tiles-SpriteFrame230
	db $01,$01,$00,$00
	dw -4,-39,$0200 : db $00
	dw -4,-31,$0201 : db $00
.tiles:
	incbin "data/gfx/SpriteFrames84.bin":30206..30270
SpriteFrame231:
	db $01,$80
	dw $0004
	dw -9,6,-40,-29
	dw $0040,$0040
	dw .tiles-SpriteFrame231
	db $01,$00,$00,$00
	dw -9,-40,$0200 : db $FF
.tiles:
	incbin "data/gfx/SpriteFrames84.bin":30299..30427
SpriteFrame232:
	db $05,$80
	dw $000E
	dw -19,10,-26,4
	dw $0100,$00C0
	dw .tiles-SpriteFrame232
	db $EF,$FF,$03,$04
	dw -3,-26,$0800 : db $FF
	dw -19,-10,$0802 : db $FF
	dw -3,-10,$0804 : db $FF
	dw -19,-18,$0806 : db $00
	dw -11,-18,$0807 : db $00
.tiles:
	incbin "data/gfx/SpriteFrames84.bin":30484..30932
SpriteFrame233:
	db $06,$80
	dw $000C
	dw -11,14,-26,3
	dw $00C0,$00C0
	dw .tiles-SpriteFrame233
	db $F8,$FC,$03,$04
	dw -9,-26,$0800 : db $FF
	dw -11,-10,$0802 : db $FF
	dw 7,-26,$0804 : db $00
	dw 7,-18,$0805 : db $00
	dw 5,-10,$0814 : db $00
	dw 5,-2,$0815 : db $00
.tiles:
	incbin "data/gfx/SpriteFrames84.bin":30996..31380
SpriteFrame234:
	db $05,$80
	dw $000B
	dw -5,29,-17,4
	dw $00C0,$00A0
	dw .tiles-SpriteFrame234
	db $1B,$02,$03,$04
	dw -5,-11,$0800 : db $FF
	dw 11,-11,$0802 : db $FF
	dw 27,-11,$0804 : db $00
	dw -1,-19,$0805 : db $00
	dw 7,-19,$0814 : db $00
.tiles:
	incbin "data/gfx/SpriteFrames84.bin":31437..31789
SpriteFrame235:
	db $05,$80
	dw $000B
	dw -10,23,-16,7
	dw $00C0,$00A0
	dw .tiles-SpriteFrame235
	db $15,$05,$03,$04
	dw -9,-8,$0800 : db $FF
	dw 7,-8,$0802 : db $FF
	dw 23,-8,$0804 : db $00
	dw -10,-16,$0805 : db $00
	dw -2,-16,$0814 : db $00
.tiles:
	incbin "data/gfx/SpriteFrames84.bin":31846..32198
SpriteFrame236:
	db $04,$80
	dw $000A
	dw -10,13,-14,13
	dw $00C0,$0080
	dw .tiles-SpriteFrame236
	db $09,$0D,$03,$04
	dw -10,-14,$0800 : db $FF
	dw -10,2,$0802 : db $FF
	dw 6,2,$0804 : db $00
	dw 6,10,$0805 : db $00
.tiles:
	incbin "data/gfx/SpriteFrames84.bin":32248..32568
CenterIceTilesDAL:	; packed tiles: format word, unpacked size (big-endian), then the stream
	db $30,$FB
	db $00,$03,$20
	incbin "data/gfx/CenterIceDAL.lin.huf":5..193
	db $FF,$FF,$FF,$FF,$FF,$FF,$FF
