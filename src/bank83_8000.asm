; Bank $83, first 4 KB: SpriteFrames continued (see bank82_8000), tiles from Extracted/data/SpriteFrames83.bin.

org $838000
SpriteFrame78:
	db $06,$80
	dw $000C
	dw -17,13,-23,5
	dw $00C0,$00C0
	dw .tiles-SpriteFrame78
	db $F2,$04,$00,$00
	dw -17,-23,$0800 : db $FF
	dw -8,-7,$0802 : db $FF
	dw -1,-23,$0804 : db $00
	dw -1,-15,$0805 : db $00
	dw 8,-7,$0814 : db $00
	dw 8,1,$0815 : db $00
.tiles:
	incbin "../Extracted/data/SpriteFrames83.bin":64..448
SpriteFrame79:
	db $04,$80
	dw $000A
	dw -16,7,-24,4
	dw $00C0,$0080
	dw .tiles-SpriteFrame79
	db $F2,$02,$00,$00
	dw -16,-11,$0800 : db $FF
	dw -6,-27,$0802 : db $FF
	dw 0,-11,$0804 : db $00
	dw 0,-3,$0805 : db $00
.tiles:
	incbin "../Extracted/data/SpriteFrames83.bin":498..818
SpriteFrame80:
	db $04,$80
	dw $000A
	dw -8,13,-26,4
	dw $00C0,$0080
	dw .tiles-SpriteFrame80
	db $F8,$FC,$00,$00
	dw -6,-26,$0800 : db $FF
	dw -8,-10,$0802 : db $FF
	dw 8,-10,$0804 : db $00
	dw 8,-2,$0805 : db $00
.tiles:
	incbin "../Extracted/data/SpriteFrames83.bin":868..1188
SpriteFrame81:
	db $04,$80
	dw $000A
	dw -4,18,-25,6
	dw $00C0,$0080
	dw .tiles-SpriteFrame81
	db $0D,$FB,$00,$00
	dw -4,-25,$0800 : db $FF
	dw -4,-9,$0802 : db $FF
	dw 12,-9,$0804 : db $00
	dw 12,-1,$0805 : db $00
.tiles:
	incbin "../Extracted/data/SpriteFrames83.bin":1238..1558
SpriteFrame82:
	db $03,$80
	dw $000C
	dw -7,23,-23,5
	dw $00C0,$00C0
	dw .tiles-SpriteFrame82
	db $13,$00,$00,$00
	dw -1,-23,$0800 : db $FF
	dw -7,-7,$0802 : db $FF
	dw 9,-7,$0804 : db $FF
.tiles:
	incbin "../Extracted/data/SpriteFrames83.bin":1601..1985
SpriteFrame83:
	db $03,$80
	dw $000C
	dw -5,21,-17,9
	dw $00C0,$00C0
	dw .tiles-SpriteFrame83
	db $12,$05,$00,$00
	dw -5,-6,$0800 : db $FF
	dw 11,-6,$0802 : db $FF
	dw 1,-22,$0804 : db $FF
.tiles:
	incbin "../Extracted/data/SpriteFrames83.bin":2028..2412
SpriteFrame84:
	db $04,$80
	dw $000A
	dw -8,11,-18,8
	dw $00C0,$0080
	dw .tiles-SpriteFrame84
	db $0A,$04,$00,$00
	dw -5,-18,$0800 : db $FF
	dw -8,-2,$0802 : db $FF
	dw 8,-2,$0804 : db $00
	dw 8,6,$0805 : db $00
.tiles:
	incbin "../Extracted/data/SpriteFrames83.bin":2462..2782
SpriteFrame85:
	db $03,$80
	dw $0009
	dw -19,2,-19,12
	dw $00A0,$0080
	dw .tiles-SpriteFrame85
	db $F2,$0D,$00,$00
	dw -14,-19,$0800 : db $FF
	dw -19,-3,$0802 : db $FF
	dw -3,-3,$0804 : db $00
.tiles:
	incbin "../Extracted/data/SpriteFrames83.bin":2825..3113
SpriteFrame86:
	db $03,$80
	dw $000C
	dw -26,6,-28,2
	dw $00C0,$00C0
	dw .tiles-SpriteFrame86
	db $E8,$FE,$00,$00
	dw -16,-28,$0800 : db $FF
	dw -26,-12,$0802 : db $FF
	dw -9,-12,$0804 : db $FF
.tiles:
	incbin "../Extracted/data/SpriteFrames83.bin":3156..3540
SpriteFrame87:
	db $03,$80
	dw $000C
	dw -24,7,-28,2
	dw $00C0,$00C0
	dw .tiles-SpriteFrame87
	db $EA,$FC,$00,$00
	dw -16,-28,$0800 : db $FF
	dw -24,-12,$0802 : db $FF
	dw -8,-12,$0804 : db $FF
.tiles:
	incbin "../Extracted/data/SpriteFrames83.bin":3583..3967
SpriteFrame88:
	db $02,$80
	dw $0008
	dw -7,7,-27,3
	dw $0080,$0080
	dw .tiles-SpriteFrame88
	db $04,$F9,$00,$00
	dw -5,-27,$0800 : db $FF
	dw -7,-11,$0802 : db $FF
.tiles:
	incbin "../Extracted/data/SpriteFrames83.bin":4003..4259
