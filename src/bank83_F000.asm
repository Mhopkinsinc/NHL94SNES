; Bank $83, last 4 KB: the last SpriteFrames frames of the bank (see bank82_8000), tiles from
; data/gfx/SpriteFrames83.bin. Then the centre ice logo tiles of the Pittsburgh home team (see bank82_F000), from
; data/gfx/CenterIcePIT.lin.huf, and the last bytes of the bank.

org $83F1C4
SpriteFrame150:
	db $03,$80
	dw $000C
	dw -9,15,-23,10
	dw $00C0,$00C0
	dw .tiles-SpriteFrame150
	db $0A,$09,$03,$04
	dw -9,-23,$0800 : db $FF
	dw -9,-7,$0802 : db $FF
	dw 7,0,$0804 : db $FF
.tiles:
	incbin "data/gfx/SpriteFrames83.bin":29167..29551
SpriteFrame151:
	db $03,$80
	dw $000C
	dw -9,15,-23,10
	dw $00C0,$00C0
	dw .tiles-SpriteFrame151
	db $0A,$09,$03,$04
	dw -9,-23,$0800 : db $FF
	dw -9,-7,$0802 : db $FF
	dw 7,-3,$0804 : db $FF
.tiles:
	incbin "data/gfx/SpriteFrames83.bin":29594..29978
SpriteFrame152:
	db $03,$80
	dw $0009
	dw -8,7,-23,12
	dw $00A0,$0080
	dw .tiles-SpriteFrame152
	db $F9,$08,$05,$04
	dw -4,-23,$0800 : db $FF
	dw -6,-7,$0802 : db $FF
	dw -8,9,$0804 : db $00
.tiles:
	incbin "data/gfx/SpriteFrames83.bin":30021..30309
SpriteFrame153:
	db $03,$80
	dw $0009
	dw -8,9,-23,12
	dw $00A0,$0080
	dw .tiles-SpriteFrame153
	db $F9,$08,$07,$04
	dw -4,-23,$0800 : db $FF
	dw -6,-7,$0802 : db $FF
	dw -8,9,$0804 : db $00
.tiles:
	incbin "data/gfx/SpriteFrames83.bin":30352..30640
SpriteFrame154:
	db $03,$80
	dw $0009
	dw -17,6,-24,10
	dw $00A0,$0080
	dw .tiles-SpriteFrame154
	db $F0,$07,$05,$04
	dw -9,-24,$0800 : db $FF
	dw -9,-8,$0802 : db $FF
	dw -17,3,$0804 : db $00
.tiles:
	incbin "data/gfx/SpriteFrames83.bin":30683..30971
SpriteFrame155:
	db $03,$80
	dw $0009
	dw -17,6,-24,10
	dw $00A0,$0080
	dw .tiles-SpriteFrame155
	db $F0,$07,$04,$04
	dw -9,-24,$0800 : db $FF
	dw -9,-8,$0802 : db $FF
	dw -17,3,$0804 : db $00
.tiles:
	incbin "data/gfx/SpriteFrames83.bin":31014..31302
SpriteFrame156:
	db $03,$80
	dw $000C
	dw -15,12,-26,5
	dw $00C0,$00C0
	dw .tiles-SpriteFrame156
	db $F5,$FA,$03,$04
	dw -3,-26,$0800 : db $FF
	dw -15,-10,$0802 : db $FF
	dw 1,-10,$0804 : db $FF
.tiles:
	incbin "data/gfx/SpriteFrames83.bin":31345..31729
SpriteFrame157:
	db $03,$80
	dw $000C
	dw -15,12,-26,4
	dw $00C0,$00C0
	dw .tiles-SpriteFrame157
	db $F4,$FA,$03,$04
	dw -3,-26,$0800 : db $FF
	dw -15,-10,$0802 : db $FF
	dw 1,-10,$0804 : db $FF
.tiles:
	incbin "data/gfx/SpriteFrames83.bin":31772..32156
SpriteFrame158:
	db $03,$80
	dw $000C
	dw -14,11,-23,5
	dw $00C0,$00C0
	dw .tiles-SpriteFrame158
	db $F7,$F7,$02,$04
	dw -4,-23,$0800 : db $FF
	dw -4,-7,$0802 : db $FF
	dw -20,-11,$0804 : db $FF
.tiles:
	incbin "data/gfx/SpriteFrames83.bin":32199..32583
CenterIceTilesPIT:	; packed tiles: format word, unpacked size (big-endian), then the stream
	db $30,$FB
	db $00,$02,$C0
	incbin "data/gfx/CenterIcePIT.lin.huf":5..180
	db $00,$FF,$FF,$FF,$FF
