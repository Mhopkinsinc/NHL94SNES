; Bank $87, sixth 4 KB: SpriteFrames continued (see bank82_8000), tiles from data/gfx/SpriteFrames87.bin.

org $87D334
SpriteFrame448:
	db $07,$80
	dw $0013
	dw -14,12,-22,14
	dw $0140,$0120
	dw .tiles-SpriteFrame448
	db $F2,$FB,$03,$09
	dw -14,-22,$0800 : db $FF
	dw 2,-22,$0802 : db $FF
	dw -14,-6,$0804 : db $FF
	dw 2,-6,$0806 : db $FF
	dw -6,10,$0808 : db $00
	dw 2,10,$0809 : db $00
	dw 11,10,$0818 : db $00
.tiles:
	incbin "data/gfx/SpriteFrames87.bin":21371..21979
SpriteFrame449:
	db $05,$80
	dw $000E
	dw -14,14,-20,9
	dw $0100,$00C0
	dw .tiles-SpriteFrame449
	db $F5,$01,$02,$07
	dw -13,-20,$0800 : db $FF
	dw 3,-20,$0802 : db $FF
	dw -14,-4,$0804 : db $FF
	dw 2,-4,$0806 : db $00
	dw 2,4,$0807 : db $00
.tiles:
	incbin "data/gfx/SpriteFrames87.bin":22036..22484
SpriteFrame450:
	db $05,$80
	dw $0014
	dw -17,13,-28,12
	dw $0140,$0140
	dw .tiles-SpriteFrame450
	db $F1,$FF,$01,$04
	dw -16,-3,$0800 : db $FF
	dw 0,-3,$0802 : db $FF
	dw -17,-19,$0804 : db $FF
	dw -1,-19,$0806 : db $FF
	dw -8,-35,$0808 : db $FF
.tiles:
	incbin "data/gfx/SpriteFrames87.bin":22541..23181
SpriteFrame451:
	db $06,$80
	dw $000F
	dw -12,16,-20,15
	dw $0100,$00E0
	dw .tiles-SpriteFrame451
	db $F7,$04,$01,$0A
	dw -12,-20,$0800 : db $FF
	dw -12,-4,$0802 : db $FF
	dw 4,-4,$0804 : db $FF
	dw 4,-20,$0806 : db $00
	dw 4,-12,$0807 : db $00
	dw -2,12,$0816 : db $00
.tiles:
	incbin "data/gfx/SpriteFrames87.bin":23245..23725
SpriteFrame452:
	db $04,$80
	dw $000A
	dw -10,11,-16,14
	dw $00C0,$0080
	dw .tiles-SpriteFrame452
	db $FD,$0B,$02,$00
	dw -10,-16,$0800 : db $FF
	dw -7,0,$0802 : db $FF
	dw 6,-16,$0804 : db $00
	dw 6,-8,$0805 : db $00
.tiles:
	incbin "data/gfx/SpriteFrames87.bin":23775..24095
SpriteFrame453:
	db $05,$80
	dw $0011
	dw -17,12,-21,11
	dw $0120,$0100
	dw .tiles-SpriteFrame453
	db $08,$0A,$02,$09
	dw -17,-21,$0800 : db $FF
	dw -1,-21,$0802 : db $FF
	dw -15,-5,$0804 : db $FF
	dw 1,-5,$0806 : db $FF
	dw 3,11,$0808 : db $00
.tiles:
	incbin "data/gfx/SpriteFrames87.bin":24152..24696
