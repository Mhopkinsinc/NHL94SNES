; Bank $86, fifth 4 KB: SpriteFrames continued (see bank82_8000), tiles from data/gfx/SpriteFrames86.bin.

org $86C11B
SpriteFrame336:
	db $04,$80
	dw $0010
	dw -29,16,-10,16
	dw $0100,$0100
	dw .tiles-SpriteFrame336
	db $EA,$0E,$09,$10
	dw -29,1,$0800 : db $FF
	dw -13,1,$0802 : db $FF
	dw 3,1,$0804 : db $FF
	dw -9,-15,$0806 : db $FF
.tiles:
	incbin "data/gfx/SpriteFrames86.bin":16717..17229
SpriteFrame337:
	db $08,$80
	dw $0014
	dw -41,16,-9,14
	dw $0140,$0140
	dw .tiles-SpriteFrame337
	db $DB,$0D,$05,$0D
	dw -41,-1,$0800 : db $FF
	dw -25,-1,$0802 : db $FF
	dw -9,-1,$0804 : db $FF
	dw 7,-1,$0806 : db $FF
	dw -12,-9,$0808 : db $00
	dw -4,-9,$0809 : db $00
	dw 4,-9,$0818 : db $00
	dw 12,-9,$0819 : db $00
.tiles:
	incbin "data/gfx/SpriteFrames86.bin":17307..17947
SpriteFrame338:
	db $06,$80
	dw $0012
	dw -46,20,-7,8
	dw $0140,$0100
	dw .tiles-SpriteFrame338
	db $D6,$06,$01,$05
	dw -46,-7,$0800 : db $FF
	dw -30,-7,$0802 : db $FF
	dw -14,-7,$0804 : db $FF
	dw 2,-7,$0806 : db $FF
	dw 18,-7,$0808 : db $00
	dw 18,1,$0809 : db $00
.tiles:
	incbin "data/gfx/SpriteFrames86.bin":18011..18587
SpriteFrame339:
	db $06,$80
	dw $000F
	dw -33,16,-9,13
	dw $0100,$00E0
	dw .tiles-SpriteFrame339
	db $E4,$0B,$01,$0A
	dw -33,-2,$0800 : db $FF
	dw -17,-2,$0802 : db $FF
	dw -1,-2,$0804 : db $FF
	dw 15,6,$0806 : db $00
	dw -12,-10,$0807 : db $00
	dw -4,-10,$0816 : db $00
.tiles:
	incbin "data/gfx/SpriteFrames86.bin":18651..19131
SpriteFrame340:
	db $04,$80
	dw $0010
	dw -22,11,-13,18
	dw $0100,$0100
	dw .tiles-SpriteFrame340
	db $EE,$08,$00,$10
	dw -22,-13,$0800 : db $FF
	dw -6,-13,$0802 : db $FF
	dw -16,3,$0804 : db $FF
	dw 0,3,$0806 : db $FF
.tiles:
	incbin "data/gfx/SpriteFrames86.bin":19181..19693
SpriteFrame341:
	db $06,$80
	dw $000F
	dw -34,16,-11,19
	dw $0100,$00E0
	dw .tiles-SpriteFrame341
	db $E2,$F9,$01,$09
	dw -18,-11,$0800 : db $FF
	dw -2,-11,$0802 : db $FF
	dw -6,5,$0804 : db $FF
	dw -34,-11,$0806 : db $00
	dw -26,-11,$0807 : db $00
	dw 10,5,$0816 : db $00
.tiles:
	incbin "data/gfx/SpriteFrames86.bin":19757..20237
SpriteFrame342:
	db $07,$80
	dw $0013
	dw -33,16,-16,17
	dw $0140,$0120
	dw .tiles-SpriteFrame342
	db $E3,$F3,$00,$06
	dw -33,-16,$0800 : db $FF
	dw -17,-16,$0802 : db $FF
	dw -13,0,$0804 : db $FF
	dw 3,0,$0806 : db $FF
	dw -1,-16,$0808 : db $00
	dw -1,-8,$0809 : db $00
	dw 4,16,$0818 : db $00
.tiles:
	incbin "data/gfx/SpriteFrames86.bin":20308..20916
