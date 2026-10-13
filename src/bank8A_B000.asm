; Bank $8A, fourth 4 KB: SpriteFrames continued (see bank82_8000), tiles from data/gfx/SpriteFrames8A.bin.

org $8AB185
SpriteFrame641:
	db $04,$80
	dw $0010
	dw -21,9,-25,3
	dw $0100,$0100
	dw .tiles-SpriteFrame641
	db $F0,$FA,$F0,$FA
	dw -21,-25,$0800 : db $FF
	dw -5,-25,$0802 : db $FF
	dw -17,-9,$0804 : db $FF
	dw -1,-9,$0806 : db $FF
.tiles:
	incbin "data/gfx/SpriteFrames8A.bin":12727..13239
SpriteFrame642:
	db $04,$80
	dw $000A
	dw -17,3,-27,4
	dw $00C0,$0080
	dw .tiles-SpriteFrame642
	db $F1,$F9,$F0,$F9
	dw -12,-27,$0800 : db $FF
	dw -12,-11,$0802 : db $FF
	dw -20,-19,$0804 : db $00
	dw -20,-11,$0805 : db $00
.tiles:
	incbin "data/gfx/SpriteFrames8A.bin":13289..13609
SpriteFrame643:
	db $05,$80
	dw $000E
	dw -16,9,-25,5
	dw $0100,$00C0
	dw .tiles-SpriteFrame643
	db $F1,$FB,$F1,$FB
	dw -14,-25,$0800 : db $FF
	dw -16,-9,$0802 : db $FF
	dw 0,-9,$0804 : db $FF
	dw 2,-25,$0806 : db $00
	dw 2,-17,$0807 : db $00
.tiles:
	incbin "data/gfx/SpriteFrames8A.bin":13666..14114
SpriteFrame644:
	db $05,$80
	dw $000E
	dw -15,10,-26,5
	dw $0100,$00C0
	dw .tiles-SpriteFrame644
	db $F3,$FB,$F3,$FB
	dw -15,-26,$0800 : db $FF
	dw 1,-26,$0802 : db $FF
	dw -14,-10,$0804 : db $FF
	dw 2,-10,$0806 : db $00
	dw 2,-2,$0807 : db $00
.tiles:
	incbin "data/gfx/SpriteFrames8A.bin":14171..14619
SpriteFrame645:
	db $04,$80
	dw $000D
	dw -13,12,-24,2
	dw $00E0,$00C0
	dw .tiles-SpriteFrame645
	db $00,$FB,$00,$FB
	dw -13,-24,$0800 : db $FF
	dw 3,-24,$0802 : db $FF
	dw -8,-8,$0804 : db $FF
	dw 8,0,$0806 : db $00
.tiles:
	incbin "data/gfx/SpriteFrames8A.bin":14669..15085
SpriteFrame646:
	db $05,$80
	dw $000E
	dw -13,13,-26,2
	dw $0100,$00C0
	dw .tiles-SpriteFrame646
	db $00,$FB,$00,$FB
	dw -13,-26,$0800 : db $FF
	dw 3,-26,$0802 : db $FF
	dw -12,-10,$0804 : db $FF
	dw 4,-10,$0806 : db $00
	dw 4,-2,$0807 : db $00
.tiles:
	incbin "data/gfx/SpriteFrames8A.bin":15142..15590
SpriteFrame647:
	db $03,$80
	dw $0009
	dw -5,15,-26,4
	dw $00A0,$0080
	dw .tiles-SpriteFrame647
	db $03,$FC,$03,$FC
	dw -3,-26,$0800 : db $FF
	dw -5,-10,$0802 : db $FF
	dw 13,-18,$0804 : db $00
.tiles:
	incbin "data/gfx/SpriteFrames8A.bin":15633..15921
SpriteFrame648:
	db $03,$80
	dw $0009
	dw -5,15,-26,4
	dw $00A0,$0080
	dw .tiles-SpriteFrame648
	db $03,$FD,$03,$FD
	dw -3,-26,$0800 : db $FF
	dw -5,-10,$0802 : db $FF
	dw 13,-18,$0804 : db $00
.tiles:
	incbin "data/gfx/SpriteFrames8A.bin":15964..16252
SpriteFrame649:
	db $04,$80
	dw $000A
	dw -10,10,-25,3
	dw $00C0,$0080
	dw .tiles-SpriteFrame649
	db $08,$FE,$08,$FE
	dw -9,-25,$0800 : db $FF
	dw -10,-9,$0802 : db $FF
	dw 6,-9,$0804 : db $00
	dw 6,-1,$0805 : db $00
.tiles:
	incbin "data/gfx/SpriteFrames8A.bin":16302..16622
