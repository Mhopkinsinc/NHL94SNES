; Bank $86, last 4 KB: the last SpriteFrames frames of the bank (see bank82_8000), tiles from
; data/gfx/SpriteFrames86.bin. Then the centre ice logo tiles of the Vancouver home team (see bank82_F000), from
; data/gfx/CenterIceVAN.lin.huf, and the last bytes of the bank.

org $86F164
SpriteFrame361:
	db $03,$80
	dw $000C
	dw -15,9,-37,-6
	dw $00C0,$00C0
	dw .tiles-SpriteFrame361
	db $00,$00,$00,$00
	dw -15,-37,$0800 : db $FF
	dw -15,-21,$0802 : db $FF
	dw 1,-26,$0804 : db $FF
.tiles:
	incbin "data/gfx/SpriteFrames86.bin":29071..29455
SpriteFrame362:
	db $04,$80
	dw $000A
	dw -12,12,-29,-6
	dw $00C0,$0080
	dw .tiles-SpriteFrame362
	db $0C,$00,$1D,$00
	dw -12,-29,$0800 : db $FF
	dw 4,-29,$0802 : db $FF
	dw -3,-13,$0804 : db $00
	dw 5,-13,$0805 : db $00
.tiles:
	incbin "data/gfx/SpriteFrames86.bin":29505..29825
SpriteFrame363:
	db $04,$80
	dw $000A
	dw -2,19,-26,1
	dw $00C0,$0080
	dw .tiles-SpriteFrame363
	db $02,$00,$1A,$00
	dw -2,-26,$0800 : db $FF
	dw 0,-10,$0802 : db $FF
	dw 14,-26,$0804 : db $00
	dw 14,-18,$0805 : db $00
.tiles:
	incbin "data/gfx/SpriteFrames86.bin":29875..30195
SpriteFrame364:
	db $03,$80
	dw $000C
	dw -27,4,-25,4
	dw $00C0,$00C0
	dw .tiles-SpriteFrame364
	db $1B,$00,$19,$00
	dw -27,-25,$0800 : db $FF
	dw -11,-25,$0802 : db $FF
	dw -8,-9,$0804 : db $FF
.tiles:
	incbin "data/gfx/SpriteFrames86.bin":30238..30622
SpriteFrame365:
	db $05,$80
	dw $000B
	dw -20,6,-28,-7
	dw $00C0,$00A0
	dw .tiles-SpriteFrame365
	db $14,$00,$1C,$00
	dw -20,-28,$0800 : db $FF
	dw -4,-28,$0802 : db $FF
	dw -17,-12,$0804 : db $00
	dw -9,-12,$0805 : db $00
	dw -1,-12,$0814 : db $00
.tiles:
	incbin "data/gfx/SpriteFrames86.bin":30679..31031
SpriteFrame366:
	db $04,$80
	dw $0007
	dw -15,5,-27,-8
	dw $0080,$0060
	dw .tiles-SpriteFrame366
	db $12,$00,$1D,$00
	dw -15,-27,$0800 : db $FF
	dw 1,-27,$0802 : db $00
	dw 1,-19,$0803 : db $00
	dw 0,-11,$0812 : db $00
.tiles:
	incbin "data/gfx/SpriteFrames86.bin":31081..31305
SpriteFrame367:
	db $04,$80
	dw $0007
	dw -9,7,-25,-9
	dw $0080,$0060
	dw .tiles-SpriteFrame367
	db $F2,$04,$F2,$04
	dw -9,-25,$0800 : db $FF
	dw 7,-17,$0802 : db $00
	dw -6,-9,$0803 : db $00
	dw 2,-9,$0812 : db $00
.tiles:
	incbin "data/gfx/SpriteFrames86.bin":31355..31579
SpriteFrame368:
	db $02,$80
	dw $0008
	dw 8,23,-25,-1
	dw $0080,$0080
	dw .tiles-SpriteFrame368
	db $E4,$DE,$E4,$DE
	dw 12,-25,$0800 : db $FF
	dw 8,-9,$0802 : db $FF
.tiles:
	incbin "data/gfx/SpriteFrames86.bin":31615..31871
SpriteFrame369:
	db $05,$80
	dw $000E
	dw -19,6,-32,0
	dw $0100,$00C0
	dw .tiles-SpriteFrame369
	db $00,$00,$1D,$00
	dw -17,-32,$0800 : db $FF
	dw -19,-16,$0802 : db $FF
	dw -3,-16,$0804 : db $FF
	dw -1,-24,$0806 : db $00
	dw -11,0,$0807 : db $00
.tiles:
	incbin "data/gfx/SpriteFrames86.bin":31928..32376
CenterIceTilesVAN:	; packed tiles: format word, unpacked size (big-endian), then the stream
	db $30,$FB
	db $00,$03,$20
	incbin "data/gfx/CenterIceVAN.lin.huf":5..387
	db $FF,$FF,$FF,$FF,$FF
