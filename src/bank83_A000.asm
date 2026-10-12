; Bank $83, third 4 KB: SpriteFrames continued (see bank82_8000), tiles from Extracted/data/SpriteFrames83.bin.

org $83A0BE
SpriteFrame99:
	db $02,$80
	dw $0008
	dw -9,6,-26,3
	dw $0080,$0080
	dw .tiles-SpriteFrame99
	db $FE,$F2,$03,$04
	dw -6,-26,$0800 : db $FF
	dw -9,-10,$0802 : db $FF
.tiles:
	incbin "../Extracted/data/SpriteFrames83.bin":8418..8674
SpriteFrame100:
	db $04,$80
	dw $000A
	dw -10,10,-26,4
	dw $00C0,$0080
	dw .tiles-SpriteFrame100
	db $FE,$F2,$03,$04
	dw -5,-26,$0800 : db $FF
	dw -10,-10,$0802 : db $FF
	dw 6,-10,$0804 : db $00
	dw 6,-2,$0805 : db $00
.tiles:
	incbin "../Extracted/data/SpriteFrames83.bin":8724..9044
SpriteFrame101:
	db $05,$80
	dw $000E
	dw -10,20,-27,4
	dw $0100,$00C0
	dw .tiles-SpriteFrame101
	db $FE,$F2,$03,$04
	dw -4,-27,$0800 : db $FF
	dw -10,-11,$0802 : db $FF
	dw 6,-11,$0804 : db $FF
	dw 12,-19,$0806 : db $00
	dw 20,-19,$0807 : db $00
.tiles:
	incbin "../Extracted/data/SpriteFrames83.bin":9101..9549
SpriteFrame102:
	db $03,$80
	dw $000C
	dw -11,6,-38,5
	dw $00C0,$00C0
	dw .tiles-SpriteFrame102
	db $0D,$F6,$03,$04
	dw -11,-38,$0800 : db $FF
	dw -9,-22,$0802 : db $FF
	dw -5,-6,$0804 : db $FF
.tiles:
	incbin "../Extracted/data/SpriteFrames83.bin":9592..9976
SpriteFrame103:
	db $03,$80
	dw $000C
	dw -16,8,-28,4
	dw $00C0,$00C0
	dw .tiles-SpriteFrame103
	db $0D,$F6,$03,$04
	dw -7,-27,$0800 : db $FF
	dw -7,-11,$0802 : db $FF
	dw -23,-28,$0804 : db $FF
.tiles:
	incbin "../Extracted/data/SpriteFrames83.bin":10019..10403
SpriteFrame104:
	db $02,$80
	dw $0008
	dw -7,8,-25,6
	dw $0080,$0080
	dw .tiles-SpriteFrame104
	db $0D,$F6,$03,$04
	dw -5,-25,$0800 : db $FF
	dw -7,-9,$0802 : db $FF
.tiles:
	incbin "../Extracted/data/SpriteFrames83.bin":10439..10695
SpriteFrame105:
	db $03,$80
	dw $0009
	dw -5,15,-25,5
	dw $00A0,$0080
	dw .tiles-SpriteFrame105
	db $0D,$F6,$03,$04
	dw -3,-25,$0800 : db $FF
	dw -5,-9,$0802 : db $FF
	dw 13,-17,$0804 : db $00
.tiles:
	incbin "../Extracted/data/SpriteFrames83.bin":10738..11026
SpriteFrame106:
	db $03,$80
	dw $000C
	dw -8,18,-25,5
	dw $00C0,$00C0
	dw .tiles-SpriteFrame106
	db $0D,$F6,$03,$04
	dw -4,-25,$0800 : db $FF
	dw -8,-9,$0802 : db $FF
	dw 8,-9,$0804 : db $FF
.tiles:
	incbin "../Extracted/data/SpriteFrames83.bin":11069..11453
SpriteFrame107:
	db $05,$80
	dw $000E
	dw -7,25,-24,6
	dw $0100,$00C0
	dw .tiles-SpriteFrame107
	db $0D,$F6,$03,$04
	dw -4,-24,$0800 : db $FF
	dw -7,-8,$0802 : db $FF
	dw 9,-8,$0804 : db $FF
	dw 12,-16,$0806 : db $00
	dw 20,-16,$0807 : db $00
.tiles:
	incbin "../Extracted/data/SpriteFrames83.bin":11510..11958
SpriteFrame108:
	db $03,$80
	dw $000C
	dw -4,7,-38,8
	dw $00C0,$00C0
	dw .tiles-SpriteFrame108
	db $13,$02,$03,$04
	dw -4,-38,$0800 : db $FF
	dw -4,-22,$0802 : db $FF
	dw -3,-6,$0804 : db $FF
.tiles:
	incbin "../Extracted/data/SpriteFrames83.bin":12001..12385
