; Bank $82, last 4 KB: the last SpriteFrames frames of the bank (see bank82_8000), tiles from
; data/gfx/SpriteFrames82.bin. Then the centre ice logo tiles of the Hartford home team: linear 4bpp tiles packed for
; DecompressHuffman, from data/gfx/CenterIceHFD.lin.huf. The rink loader in bank $9B takes them from a per-team table
; in bank $9C (tiles, then the logo map), converts them to planar and sends them to VRAM after the rink tiles.

org $82F04A
SpriteFrame68:
	db $02,$80
	dw $0008
	dw -12,4,-19,7
	dw $0080,$0080
	dw .tiles-SpriteFrame68
	db $F7,$07,$00,$00
	dw -12,-19,$0800 : db $FF
	dw -11,-3,$0802 : db $FF
.tiles:
	incbin "data/gfx/SpriteFrames82.bin":24878..25134
SpriteFrame69:
	db $02,$80
	dw $0008
	dw -9,4,-22,6
	dw $0080,$0080
	dw .tiles-SpriteFrame69
	db $F9,$05,$00,$00
	dw -8,-22,$0800 : db $FF
	dw -9,-6,$0802 : db $FF
.tiles:
	incbin "data/gfx/SpriteFrames82.bin":25170..25426
SpriteFrame70:
	db $04,$80
	dw $000A
	dw -15,5,-25,5
	dw $00C0,$0080
	dw .tiles-SpriteFrame70
	db $F4,$06,$00,$00
	dw -9,-25,$0800 : db $FF
	dw -15,-9,$0802 : db $FF
	dw 1,-9,$0804 : db $00
	dw 1,-1,$0805 : db $00
.tiles:
	incbin "data/gfx/SpriteFrames82.bin":25476..25796
SpriteFrame71:
	db $06,$80
	dw $000C
	dw -16,10,-24,4
	dw $00C0,$00C0
	dw .tiles-SpriteFrame71
	db $F3,$05,$00,$00
	dw -16,-24,$0800 : db $FF
	dw -7,-8,$0802 : db $FF
	dw 0,-24,$0804 : db $00
	dw 0,-16,$0805 : db $00
	dw 9,-8,$0814 : db $00
	dw 9,0,$0815 : db $00
.tiles:
	incbin "data/gfx/SpriteFrames82.bin":25860..26244
SpriteFrame72:
	db $04,$80
	dw $000A
	dw -17,6,-23,7
	dw $00C0,$0080
	dw .tiles-SpriteFrame72
	db $F2,$06,$00,$00
	dw -17,-8,$0800 : db $FF
	dw -8,-24,$0802 : db $FF
	dw -1,-8,$0804 : db $00
	dw -1,0,$0805 : db $00
.tiles:
	incbin "data/gfx/SpriteFrames82.bin":26294..26614
SpriteFrame73:
	db $05,$80
	dw $000E
	dw -18,10,-23,6
	dw $0100,$00C0
	dw .tiles-SpriteFrame73
	db $F1,$05,$00,$00
	dw -18,-23,$0800 : db $FF
	dw -15,-7,$0802 : db $FF
	dw 1,-7,$0804 : db $FF
	dw -2,-23,$0806 : db $00
	dw -2,-15,$0807 : db $00
.tiles:
	incbin "data/gfx/SpriteFrames82.bin":26671..27119
SpriteFrame74:
	db $03,$80
	dw $0009
	dw -16,5,-24,6
	dw $00A0,$0080
	dw .tiles-SpriteFrame74
	db $F3,$06,$00,$00
	dw -10,-24,$0800 : db $FF
	dw -10,-8,$0802 : db $FF
	dw -18,-10,$0804 : db $00
.tiles:
	incbin "data/gfx/SpriteFrames82.bin":27162..27450
SpriteFrame75:
	db $04,$80
	dw $000A
	dw -15,6,-25,3
	dw $00C0,$0080
	dw .tiles-SpriteFrame75
	db $F4,$03,$00,$00
	dw -15,-12,$0800 : db $FF
	dw -5,-28,$0802 : db $FF
	dw 1,-12,$0804 : db $00
	dw 1,-4,$0805 : db $00
.tiles:
	incbin "data/gfx/SpriteFrames82.bin":27500..27820
SpriteFrame76:
	db $03,$80
	dw $0009
	dw -15,6,-24,6
	dw $00A0,$0080
	dw .tiles-SpriteFrame76
	db $F5,$06,$00,$00
	dw -9,-24,$0800 : db $FF
	dw -9,-8,$0802 : db $FF
	dw -17,-11,$0804 : db $00
.tiles:
	incbin "data/gfx/SpriteFrames82.bin":27863..28151
SpriteFrame77:
	db $04,$80
	dw $000A
	dw -16,4,-24,3
	dw $00C0,$0080
	dw .tiles-SpriteFrame77
	db $F3,$03,$00,$00
	dw -16,-12,$0800 : db $FF
	dw -7,-28,$0802 : db $FF
	dw 0,-12,$0804 : db $00
	dw 0,-4,$0805 : db $00
.tiles:
	incbin "data/gfx/SpriteFrames82.bin":28201..28521
CenterIceTilesHFD:	; packed tiles: format word, unpacked size (big-endian), then the stream
	db $30,$FB
	db $00,$03,$A0
	incbin "data/gfx/CenterIceHFD.lin.huf":5..334
	db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
