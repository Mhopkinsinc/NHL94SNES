; Bank $89, third 4 KB: SpriteFrames continued (see bank82_8000), tiles from data/gfx/SpriteFrames89.bin.

org $89A035
SpriteFrame560:
	db $05,$80
	dw $0011
	dw -9,25,-27,4
	dw $0120,$0100
	dw .tiles-SpriteFrame560
	db $17,$FC,$17,$FC
	dw -9,-27,$0800 : db $FF
	dw 15,-27,$0802 : db $FF
	dw -9,-11,$0804 : db $FF
	dw 8,-11,$0806 : db $FF
	dw 7,-19,$0808 : db $00
.tiles:
	incbin "data/gfx/SpriteFrames89.bin":8302..8846
SpriteFrame561:
	db $05,$80
	dw $000E
	dw -11,22,-25,6
	dw $0100,$00C0
	dw .tiles-SpriteFrame561
	db $13,$01,$13,$01
	dw -11,-25,$0800 : db $FF
	dw -10,-9,$0802 : db $FF
	dw 6,-9,$0804 : db $FF
	dw 22,-9,$0806 : db $00
	dw 22,-1,$0807 : db $00
.tiles:
	incbin "data/gfx/SpriteFrames89.bin":8903..9351
SpriteFrame562:
	db $03,$80
	dw $000C
	dw -9,21,-24,8
	dw $00C0,$00C0
	dw .tiles-SpriteFrame562
	db $13,$07,$13,$07
	dw -9,-24,$0800 : db $FF
	dw -9,-8,$0802 : db $FF
	dw 7,-7,$0804 : db $FF
.tiles:
	incbin "data/gfx/SpriteFrames89.bin":9394..9778
SpriteFrame563:
	db $03,$80
	dw $000C
	dw -11,18,-27,3
	dw $00C0,$00C0
	dw .tiles-SpriteFrame563
	db $0E,$03,$0E,$03
	dw -11,-27,$0800 : db $FF
	dw -10,-11,$0802 : db $FF
	dw 6,-11,$0804 : db $FF
.tiles:
	incbin "data/gfx/SpriteFrames89.bin":9821..10205
SpriteFrame564:
	db $04,$80
	dw $000A
	dw -8,7,-26,14
	dw $00C0,$0080
	dw .tiles-SpriteFrame564
	db $FF,$0B,$FF,$0C
	dw -8,-26,$0800 : db $FF
	dw -8,-10,$0802 : db $FF
	dw -5,6,$0804 : db $00
	dw -5,14,$0805 : db $00
.tiles:
	incbin "data/gfx/SpriteFrames89.bin":10255..10575
SpriteFrame565:
	db $06,$80
	dw $000F
	dw -11,9,-26,13
	dw $0100,$00E0
	dw .tiles-SpriteFrame565
	db $03,$0B,$03,$0B
	dw -11,-26,$0800 : db $FF
	dw -9,-10,$0802 : db $FF
	dw -1,-2,$0804 : db $FF
	dw 5,-26,$0806 : db $00
	dw 5,-18,$0807 : db $00
	dw 7,-10,$0816 : db $00
.tiles:
	incbin "data/gfx/SpriteFrames89.bin":10639..11119
SpriteFrame566:
	db $07,$80
	dw $0010
	dw -20,11,-28,9
	dw $0100,$0100
	dw .tiles-SpriteFrame566
	db $EF,$08,$EF,$08
	dw -20,-6,$0800 : db $FF
	dw -4,-6,$0802 : db $FF
	dw -9,-22,$0804 : db $FF
	dw 7,-22,$0806 : db $00
	dw 7,-14,$0807 : db $00
	dw -5,-30,$0816 : db $00
	dw 3,-30,$0817 : db $00
.tiles:
	incbin "data/gfx/SpriteFrames89.bin":11190..11702
SpriteFrame567:
	db $05,$80
	dw $000B
	dw -16,9,-22,13
	dw $00C0,$00A0
	dw .tiles-SpriteFrame567
	db $F0,$0A,$F0,$0A
	dw -6,-22,$0800 : db $FF
	dw -13,-6,$0802 : db $FF
	dw 3,-6,$0804 : db $00
	dw 3,2,$0805 : db $00
	dw -16,10,$0814 : db $00
.tiles:
	incbin "data/gfx/SpriteFrames89.bin":11759..12111
SpriteFrame568:
	db $06,$80
	dw $000F
	dw -25,8,-25,5
	dw $0100,$00E0
	dw .tiles-SpriteFrame568
	db $EB,$05,$EB,$05
	dw -15,-25,$0800 : db $FF
	dw -25,-9,$0802 : db $FF
	dw -8,-9,$0804 : db $FF
	dw 1,-25,$0806 : db $00
	dw 1,-17,$0807 : db $00
	dw 8,-1,$0816 : db $00
.tiles:
	incbin "data/gfx/SpriteFrames89.bin":12175..12655
