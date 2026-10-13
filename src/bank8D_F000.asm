; Bank $8D, last 4 KB: the last SpriteFrames frames of the bank (see bank82_8000), tiles from
; Extracted/data/SpriteFrames8D.bin. Then the centre ice logo tiles of the Calgary home team (see bank82_F000), from
; Extracted/data/CenterIceCGY.lin.huf, and the last bytes of the bank.

org $8DF071
SpriteFrame891:
	db $03,$80
	dw $000C
	dw -15,0,-35,7
	dw $00C0,$00C0
	dw .tiles-SpriteFrame891
	db $02,$04,$FB,$05
	dw -15,-35,$0800 : db $FF
	dw -14,-19,$0802 : db $FF
	dw -11,-3,$0804 : db $FF
.tiles:
	incbin "../Extracted/data/SpriteFrames8D.bin":28828..29212
SpriteFrame892:
	db $06,$80
	dw $0015
	dw -8,30,-37,8
	dw $0160,$0140
	dw .tiles-SpriteFrame892
	db $00,$00,$FA,$02
	dw 4,-37,$0800 : db $FF
	dw -8,-21,$0802 : db $FF
	dw 8,-21,$0804 : db $FF
	dw -6,-5,$0806 : db $FF
	dw 10,-5,$0808 : db $FF
	dw 24,-21,$080A : db $00
.tiles:
	incbin "../Extracted/data/SpriteFrames8D.bin":29276..29948
SpriteFrame893:
	db $05,$80
	dw $000E
	dw -1,29,-30,4
	dw $0100,$00C0
	dw .tiles-SpriteFrame893
	db $00,$00,$F8,$FF
	dw 15,-30,$0800 : db $FF
	dw -1,-14,$0802 : db $FF
	dw 15,-14,$0804 : db $FF
	dw 18,2,$0806 : db $00
	dw 26,2,$0807 : db $00
.tiles:
	incbin "../Extracted/data/SpriteFrames8D.bin":30005..30453
SpriteFrame894:
	db $05,$80
	dw $000E
	dw 4,44,-9,11
	dw $0100,$00C0
	dw .tiles-SpriteFrame894
	db $00,$00,$FB,$FF
	dw 4,-9,$0800 : db $FF
	dw 20,-9,$0802 : db $FF
	dw 36,-9,$0804 : db $FF
	dw 34,7,$0806 : db $00
	dw 42,7,$0807 : db $00
.tiles:
	incbin "../Extracted/data/SpriteFrames8D.bin":30510..30958
SpriteFrame895:
	db $06,$80
	dw $000C
	dw -11,9,-36,1
	dw $00C0,$00C0
	dw .tiles-SpriteFrame895
	db $00,$00,$03,$E4
	dw -11,-36,$0800 : db $FF
	dw -11,-20,$0802 : db $FF
	dw 5,-20,$0804 : db $00
	dw 5,-12,$0805 : db $00
	dw -10,-4,$0814 : db $00
	dw -2,-4,$0815 : db $00
.tiles:
	incbin "../Extracted/data/SpriteFrames8D.bin":31022..31406
SpriteFrame896:
	db $04,$80
	dw $000A
	dw -35,-3,-32,-10
	dw $00C0,$0080
	dw .tiles-SpriteFrame896
	db $00,$00,$F6,$DF
	dw -35,-25,$0800 : db $FF
	dw -19,-25,$0802 : db $FF
	dw -3,-17,$0804 : db $00
	dw -25,-33,$0805 : db $00
.tiles:
	incbin "../Extracted/data/SpriteFrames8D.bin":31456..31776
SpriteFrame897:
	db $04,$80
	dw $000D
	dw -11,5,-39,1
	dw $00E0,$00C0
	dw .tiles-SpriteFrame897
	db $00,$00,$EB,$EA
	dw -11,-39,$0800 : db $FF
	dw -11,-23,$0802 : db $FF
	dw -10,-7,$0804 : db $FF
	dw 5,-15,$0806 : db $00
.tiles:
	incbin "../Extracted/data/SpriteFrames8D.bin":31826..32242
SpriteFrame898:
	db $03,$80
	dw $0009
	dw -35,-5,-33,-10
	dw $00A0,$0080
	dw .tiles-SpriteFrame898
	db $00,$00,$DC,$E5
	dw -35,-25,$0800 : db $FF
	dw -19,-25,$0802 : db $FF
	dw -34,-33,$0804 : db $00
.tiles:
	incbin "../Extracted/data/SpriteFrames8D.bin":32285..32573
CenterIceTilesCGY:	; packed tiles: format word, unpacked size (big-endian), then the stream
	db $30,$FB
	db $00,$03,$40
	incbin "../Extracted/data/CenterIceCGY.lin.huf":5..191
	db $FF,$FF,$FF,$FF
