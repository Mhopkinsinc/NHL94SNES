; Bank $8A, second 4 KB: SpriteFrames continued (see bank82_8000), tiles from data/gfx/SpriteFrames8A.bin.

org $8A90A2
SpriteFrame622:
	db $04,$80
	dw $000A
	dw -10,14,-24,5
	dw $00C0,$0080
	dw .tiles-SpriteFrame622
	db $0D,$04,$0D,$04
	dw -6,-24,$0800 : db $FF
	dw -10,-8,$0802 : db $FF
	dw 6,0,$0804 : db $00
	dw 14,0,$0805 : db $00
.tiles:
	incbin "data/gfx/SpriteFrames8A.bin":4308..4628
SpriteFrame623:
	db $04,$80
	dw $000D
	dw -12,20,-25,6
	dw $00E0,$00C0
	dw .tiles-SpriteFrame623
	db $11,$04,$11,$04
	dw -6,-25,$0800 : db $FF
	dw -12,-9,$0802 : db $FF
	dw 4,-9,$0804 : db $FF
	dw 20,-1,$0806 : db $00
.tiles:
	incbin "data/gfx/SpriteFrames8A.bin":4678..5094
SpriteFrame624:
	db $03,$80
	dw $000C
	dw -8,18,-25,4
	dw $00C0,$00C0
	dw .tiles-SpriteFrame624
	db $10,$02,$10,$02
	dw -6,-25,$0800 : db $FF
	dw -8,-9,$0802 : db $FF
	dw 8,-9,$0804 : db $FF
.tiles:
	incbin "data/gfx/SpriteFrames8A.bin":5137..5521
SpriteFrame625:
	db $05,$80
	dw $000B
	dw -11,10,-21,9
	dw $00C0,$00A0
	dw .tiles-SpriteFrame625
	db $01,$09,$01,$08
	dw -10,-21,$0800 : db $FF
	dw -11,-5,$0802 : db $FF
	dw 6,-21,$0804 : db $00
	dw 6,-13,$0805 : db $00
	dw 5,-5,$0814 : db $00
.tiles:
	incbin "data/gfx/SpriteFrames8A.bin":5578..5930
SpriteFrame626:
	db $04,$80
	dw $000A
	dw -11,8,-25,9
	dw $00C0,$0080
	dw .tiles-SpriteFrame626
	db $03,$09,$03,$09
	dw -10,-25,$0800 : db $FF
	dw -11,-9,$0802 : db $FF
	dw 6,-17,$0804 : db $00
	dw 1,7,$0805 : db $00
.tiles:
	incbin "data/gfx/SpriteFrames8A.bin":5980..6300
SpriteFrame627:
	db $03,$80
	dw $0009
	dw -7,8,-24,9
	dw $00A0,$0080
	dw .tiles-SpriteFrame627
	db $06,$09,$06,$09
	dw -6,-24,$0800 : db $FF
	dw -7,-8,$0802 : db $FF
	dw 5,8,$0804 : db $00
.tiles:
	incbin "data/gfx/SpriteFrames8A.bin":6343..6631
SpriteFrame628:
	db $04,$80
	dw $000A
	dw -5,11,-22,10
	dw $00C0,$0080
	dw .tiles-SpriteFrame628
	db $07,$0A,$07,$0A
	dw -5,-22,$0800 : db $FF
	dw -4,-6,$0802 : db $FF
	dw 11,-14,$0804 : db $00
	dw 7,10,$0805 : db $00
.tiles:
	incbin "data/gfx/SpriteFrames8A.bin":6681..7001
SpriteFrame629:
	db $06,$80
	dw $000C
	dw -12,10,-18,15
	dw $00C0,$00C0
	dw .tiles-SpriteFrame629
	db $F6,$0D,$F6,$0D
	dw -5,-18,$0800 : db $FF
	dw -5,-2,$0802 : db $FF
	dw -13,-16,$0804 : db $00
	dw -13,-8,$0805 : db $00
	dw -13,0,$0814 : db $00
	dw -13,8,$0815 : db $00
.tiles:
	incbin "data/gfx/SpriteFrames8A.bin":7065..7449
SpriteFrame630:
	db $07,$80
	dw $000D
	dw -10,9,-23,14
	dw $00E0,$00C0
	dw .tiles-SpriteFrame630
	db $F7,$0D,$F7,$0D
	dw -10,-23,$0800 : db $FF
	dw -10,-7,$0802 : db $FF
	dw 6,-23,$0804 : db $00
	dw 6,-15,$0805 : db $00
	dw 6,-7,$0814 : db $00
	dw 6,1,$0815 : db $00
	dw -10,9,$0806 : db $00
.tiles:
	incbin "data/gfx/SpriteFrames8A.bin":7520..7936
SpriteFrame631:
	db $05,$80
	dw $000B
	dw -12,9,-23,11
	dw $00C0,$00A0
	dw .tiles-SpriteFrame631
	db $F7,$0A,$F7,$0A
	dw -12,-23,$0800 : db $FF
	dw -12,-7,$0802 : db $FF
	dw -12,9,$0804 : db $00
	dw 4,-15,$0805 : db $00
	dw 4,-7,$0814 : db $00
.tiles:
	incbin "data/gfx/SpriteFrames8A.bin":7993..8345
