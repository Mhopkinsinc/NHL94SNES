; Bank $85, seventh 4 KB: SpriteFrames continued (see bank82_8000), tiles from data/gfx/SpriteFrames85.bin.

org $85E0C2
SpriteFrame289:
	db $05,$80
	dw $000E
	dw -12,17,-15,12
	dw $0100,$00C0
	dw .tiles-SpriteFrame289
	db $04,$07,$03,$07
	dw -12,-15,$0800 : db $FF
	dw 4,-15,$0802 : db $FF
	dw 4,1,$0804 : db $FF
	dw -12,1,$0806 : db $00
	dw -4,1,$0807 : db $00
.tiles:
	incbin "data/gfx/SpriteFrames85.bin":24827..25275
SpriteFrame290:
	db $07,$80
	dw $0010
	dw -35,18,-10,9
	dw $0100,$0100
	dw .tiles-SpriteFrame290
	db $DC,$FC,$00,$01
	dw -35,-7,$0800 : db $FF
	dw -19,-10,$0802 : db $FF
	dw -3,-4,$0804 : db $FF
	dw -19,6,$0806 : db $00
	dw -11,6,$0807 : db $00
	dw 13,-5,$0816 : db $00
	dw 13,3,$0817 : db $00
.tiles:
	incbin "data/gfx/SpriteFrames85.bin":25346..25858
SpriteFrame291:
	db $06,$80
	dw $000C
	dw -7,14,-16,12
	dw $00C0,$00C0
	dw .tiles-SpriteFrame291
	db $07,$0A,$06,$05
	dw -7,-16,$0800 : db $FF
	dw -7,0,$0802 : db $FF
	dw 9,-16,$0804 : db $00
	dw 9,-8,$0805 : db $00
	dw 9,0,$0814 : db $00
	dw 9,8,$0815 : db $00
.tiles:
	incbin "data/gfx/SpriteFrames85.bin":25922..26306
SpriteFrame292:
	db $06,$80
	dw $000C
	dw -11,12,-11,16
	dw $00C0,$00C0
	dw .tiles-SpriteFrame292
	db $09,$0E,$01,$0C
	dw -11,-11,$0800 : db $FF
	dw -8,5,$0802 : db $FF
	dw 5,-11,$0804 : db $00
	dw 5,-3,$0805 : db $00
	dw 8,5,$0814 : db $00
	dw 8,13,$0815 : db $00
.tiles:
	incbin "data/gfx/SpriteFrames85.bin":26370..26754
SpriteFrame293:
	db $04,$80
	dw $000D
	dw -11,18,-22,14
	dw $00E0,$00C0
	dw .tiles-SpriteFrame293
	db $FE,$0C,$03,$05
	dw -10,-22,$0800 : db $FF
	dw -11,-6,$0802 : db $FF
	dw 5,-6,$0804 : db $FF
	dw 4,10,$0806 : db $00
.tiles:
	incbin "data/gfx/SpriteFrames85.bin":26804..27220
SpriteFrame294:
	db $07,$80
	dw $0013
	dw -29,17,-21,15
	dw $0140,$0120
	dw .tiles-SpriteFrame294
	db $E3,$EE,$00,$01
	dw -29,-21,$0800 : db $FF
	dw -12,-21,$0802 : db $FF
	dw -18,-5,$0804 : db $FF
	dw -2,-5,$0806 : db $FF
	dw 14,-5,$0808 : db $00
	dw 14,3,$0809 : db $00
	dw 4,11,$0818 : db $00
.tiles:
	incbin "data/gfx/SpriteFrames85.bin":27291..27899
SpriteFrame295:
	db $05,$80
	dw $000B
	dw -8,14,-22,13
	dw $00C0,$00A0
	dw .tiles-SpriteFrame295
	db $06,$0C,$03,$05
	dw -6,-22,$0800 : db $FF
	dw -8,-6,$0802 : db $FF
	dw 8,-6,$0804 : db $00
	dw 8,2,$0805 : db $00
	dw 2,10,$0814 : db $00
.tiles:
	incbin "data/gfx/SpriteFrames85.bin":27956..28308
SpriteFrame296:
	db $06,$80
	dw $000F
	dw -17,12,-14,20
	dw $0100,$00E0
	dw .tiles-SpriteFrame296
	db $F0,$12,$01,$0C
	dw -10,5,$0800 : db $FF
	dw -17,-11,$0802 : db $FF
	dw -1,-11,$0804 : db $FF
	dw 6,5,$0806 : db $00
	dw 6,13,$0807 : db $00
	dw -2,-19,$0816 : db $00
.tiles:
	incbin "data/gfx/SpriteFrames85.bin":28372..28852
