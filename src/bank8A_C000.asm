; Bank $8A, fifth 4 KB: SpriteFrames continued (see bank82_8000), tiles from Extracted/data/SpriteFrames8A.bin.

org $8AC0EE
SpriteFrame650:
	db $04,$80
	dw $000A
	dw -10,10,-23,3
	dw $00C0,$0080
	dw .tiles-SpriteFrame650
	db $08,$FE,$08,$FE
	dw -9,-23,$0800 : db $FF
	dw -10,-7,$0802 : db $FF
	dw 6,-7,$0804 : db $00
	dw 6,1,$0805 : db $00
.tiles:
	incbin "../Extracted/data/SpriteFrames8A.bin":16672..16992
SpriteFrame651:
	db $06,$80
	dw $000C
	dw -10,13,-27,1
	dw $00C0,$00C0
	dw .tiles-SpriteFrame651
	db $09,$00,$09,$00
	dw -10,-27,$0800 : db $FF
	dw -8,-11,$0802 : db $FF
	dw 6,-27,$0804 : db $00
	dw 6,-19,$0805 : db $00
	dw 8,-11,$0814 : db $00
	dw 8,-3,$0815 : db $00
.tiles:
	incbin "../Extracted/data/SpriteFrames8A.bin":17056..17440
SpriteFrame652:
	db $05,$80
	dw $000B
	dw -9,14,-27,1
	dw $00C0,$00A0
	dw .tiles-SpriteFrame652
	db $0A,$FF,$0A,$FF
	dw -9,-27,$0800 : db $FF
	dw -7,-11,$0802 : db $FF
	dw 7,-19,$0804 : db $00
	dw 9,-11,$0805 : db $00
	dw 9,-3,$0814 : db $00
.tiles:
	incbin "../Extracted/data/SpriteFrames8A.bin":17497..17849
SpriteFrame653:
	db $05,$80
	dw $000E
	dw -14,11,-22,6
	dw $0100,$00C0
	dw .tiles-SpriteFrame653
	db $04,$05,$04,$05
	dw -14,-22,$0800 : db $FF
	dw 2,-22,$0802 : db $FF
	dw -9,-6,$0804 : db $FF
	dw 7,-6,$0806 : db $00
	dw 7,2,$0807 : db $00
.tiles:
	incbin "../Extracted/data/SpriteFrames8A.bin":17906..18354
SpriteFrame654:
	db $05,$80
	dw $000E
	dw -14,11,-22,6
	dw $0100,$00C0
	dw .tiles-SpriteFrame654
	db $04,$05,$04,$05
	dw -14,-22,$0800 : db $FF
	dw 2,-22,$0802 : db $FF
	dw -9,-6,$0804 : db $FF
	dw 7,-6,$0806 : db $00
	dw 7,2,$0807 : db $00
.tiles:
	incbin "../Extracted/data/SpriteFrames8A.bin":18411..18859
SpriteFrame655:
	db $05,$80
	dw $000B
	dw -14,9,-21,8
	dw $00C0,$00A0
	dw .tiles-SpriteFrame655
	db $FE,$06,$FE,$06
	dw -14,-21,$0800 : db $FF
	dw -8,-5,$0802 : db $FF
	dw 2,-21,$0804 : db $00
	dw 2,-13,$0805 : db $00
	dw 8,-5,$0814 : db $00
.tiles:
	incbin "../Extracted/data/SpriteFrames8A.bin":18916..19268
SpriteFrame656:
	db $06,$80
	dw $000C
	dw -15,9,-21,8
	dw $00C0,$00C0
	dw .tiles-SpriteFrame656
	db $FD,$06,$FD,$06
	dw -15,-21,$0800 : db $FF
	dw -9,-5,$0802 : db $FF
	dw 1,-21,$0804 : db $00
	dw 1,-13,$0805 : db $00
	dw 7,-5,$0814 : db $00
	dw 7,3,$0815 : db $00
.tiles:
	incbin "../Extracted/data/SpriteFrames8A.bin":19332..19716
SpriteFrame657:
	db $02,$80
	dw $0008
	dw -8,7,-26,5
	dw $0080,$0080
	dw .tiles-SpriteFrame657
	db $FA,$03,$FA,$03
	dw -8,-26,$0800 : db $FF
	dw -8,-10,$0802 : db $FF
.tiles:
	incbin "../Extracted/data/SpriteFrames8A.bin":19752..20008
SpriteFrame658:
	db $02,$80
	dw $0008
	dw -8,7,-26,5
	dw $0080,$0080
	dw .tiles-SpriteFrame658
	db $FA,$03,$FA,$03
	dw -8,-26,$0800 : db $FF
	dw -8,-10,$0802 : db $FF
.tiles:
	incbin "../Extracted/data/SpriteFrames8A.bin":20044..20300
SpriteFrame659:
	db $05,$80
	dw $000B
	dw -13,8,-25,3
	dw $00C0,$00A0
	dw .tiles-SpriteFrame659
	db $F7,$FA,$F7,$FA
	dw -9,-25,$0800 : db $FF
	dw -13,-9,$0802 : db $FF
	dw 7,-25,$0804 : db $00
	dw 3,-9,$0805 : db $00
	dw 3,-1,$0814 : db $00
.tiles:
	incbin "../Extracted/data/SpriteFrames8A.bin":20357..20709
