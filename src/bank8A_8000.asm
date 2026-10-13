; Bank $8A, first 4 KB: SpriteFrames continued (see bank82_8000), tiles from Extracted/data/SpriteFrames8A.bin.

org $8A8000
SpriteFrame612:
	db $05,$80
	dw $000E
	dw -15,10,-27,10
	dw $0100,$00C0
	dw .tiles-SpriteFrame612
	db $F9,$06,$F3,$04
	dw -10,-27,$0800 : db $FF
	dw -15,-11,$0802 : db $FF
	dw 1,-11,$0804 : db $FF
	dw -12,5,$0806 : db $00
	dw -4,5,$0807 : db $00
.tiles:
	incbin "../Extracted/data/SpriteFrames8A.bin":57..505
SpriteFrame613:
	db $05,$80
	dw $000B
	dw -10,12,-25,6
	dw $00C0,$00A0
	dw .tiles-SpriteFrame613
	db $FE,$F8,$FE,$F8
	dw -10,-25,$0800 : db $FF
	dw -7,-9,$0802 : db $FF
	dw 6,-25,$0804 : db $00
	dw 6,-17,$0805 : db $00
	dw 9,-1,$0814 : db $00
.tiles:
	incbin "../Extracted/data/SpriteFrames8A.bin":562..914
SpriteFrame614:
	db $03,$80
	dw $0009
	dw -8,9,-26,5
	dw $00A0,$0080
	dw .tiles-SpriteFrame614
	db $01,$F9,$01,$F9
	dw -8,-26,$0800 : db $FF
	dw -6,-10,$0802 : db $FF
	dw 8,-18,$0804 : db $00
.tiles:
	incbin "../Extracted/data/SpriteFrames8A.bin":957..1245
SpriteFrame615:
	db $06,$80
	dw $000C
	dw -11,9,-25,7
	dw $00C0,$00C0
	dw .tiles-SpriteFrame615
	db $07,$FD,$07,$FD
	dw -6,-25,$0800 : db $FF
	dw -6,-9,$0802 : db $FF
	dw -14,-18,$0804 : db $00
	dw -14,-10,$0805 : db $00
	dw -14,-2,$0814 : db $00
	dw -14,6,$0815 : db $00
.tiles:
	incbin "../Extracted/data/SpriteFrames8A.bin":1309..1693
SpriteFrame616:
	db $05,$80
	dw $000B
	dw -8,12,-26,6
	dw $00C0,$00A0
	dw .tiles-SpriteFrame616
	db $01,$00,$01,$00
	dw -8,-26,$0800 : db $FF
	dw -8,-10,$0802 : db $FF
	dw -8,6,$0804 : db $00
	dw 8,-15,$0805 : db $00
	dw 8,-7,$0814 : db $00
.tiles:
	incbin "../Extracted/data/SpriteFrames8A.bin":1750..2102
SpriteFrame617:
	db $03,$80
	dw $000C
	dw -5,20,-27,4
	dw $00C0,$00C0
	dw .tiles-SpriteFrame617
	db $13,$FF,$13,$FF
	dw -5,-27,$0800 : db $FF
	dw -4,-11,$0802 : db $FF
	dw 12,-11,$0804 : db $FF
.tiles:
	incbin "../Extracted/data/SpriteFrames8A.bin":2145..2529
SpriteFrame618:
	db $04,$80
	dw $000A
	dw -5,16,-26,5
	dw $00C0,$0080
	dw .tiles-SpriteFrame618
	db $0E,$00,$0E,$00
	dw -5,-26,$0800 : db $FF
	dw -5,-10,$0802 : db $FF
	dw 11,-10,$0804 : db $00
	dw 11,-2,$0805 : db $00
.tiles:
	incbin "../Extracted/data/SpriteFrames8A.bin":2579..2899
SpriteFrame619:
	db $03,$80
	dw $000C
	dw -9,20,-27,2
	dw $00C0,$00C0
	dw .tiles-SpriteFrame619
	db $13,$FC,$13,$FC
	dw -5,-27,$0800 : db $FF
	dw -9,-11,$0802 : db $FF
	dw 7,-11,$0804 : db $FF
.tiles:
	incbin "../Extracted/data/SpriteFrames8A.bin":2942..3326
SpriteFrame620:
	db $03,$80
	dw $000C
	dw -6,19,-27,1
	dw $00C0,$00C0
	dw .tiles-SpriteFrame620
	db $10,$FF,$10,$FF
	dw -4,-27,$0800 : db $FF
	dw -6,-11,$0802 : db $FF
	dw 10,-11,$0804 : db $FF
.tiles:
	incbin "../Extracted/data/SpriteFrames8A.bin":3369..3753
SpriteFrame621:
	db $05,$80
	dw $000E
	dw -9,20,-23,4
	dw $0100,$00C0
	dw .tiles-SpriteFrame621
	db $11,$03,$11,$03
	dw -4,-23,$0800 : db $FF
	dw -9,-7,$0802 : db $FF
	dw 7,-7,$0804 : db $FF
	dw 12,-23,$0806 : db $00
	dw 12,-15,$0807 : db $00
.tiles:
	incbin "../Extracted/data/SpriteFrames8A.bin":3810..4258
