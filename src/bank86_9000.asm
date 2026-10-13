; Bank $86, second 4 KB: SpriteFrames continued (see bank82_8000), tiles from Extracted/data/SpriteFrames86.bin.

org $869152
SpriteFrame313:
	db $05,$80
	dw $000B
	dw -9,12,-18,18
	dw $00C0,$00A0
	dw .tiles-SpriteFrame313
	db $F8,$F4,$05,$0D
	dw -6,3,$0800 : db $FF
	dw -9,-13,$0802 : db $FF
	dw 10,11,$0804 : db $00
	dw 7,-5,$0805 : db $00
	dw -9,-21,$0814 : db $00
.tiles:
	incbin "../Extracted/data/SpriteFrames86.bin":4491..4843
SpriteFrame314:
	db $04,$80
	dw $000D
	dw -12,10,-23,17
	dw $00E0,$00C0
	dw .tiles-SpriteFrame314
	db $F8,$ED,$05,$07
	dw -6,2,$0800 : db $FF
	dw -9,-14,$0802 : db $FF
	dw -12,-30,$0804 : db $FF
	dw 7,-6,$0806 : db $00
.tiles:
	incbin "../Extracted/data/SpriteFrames86.bin":4893..5309
SpriteFrame315:
	db $03,$80
	dw $0009
	dw -11,8,-16,13
	dw $00A0,$0080
	dw .tiles-SpriteFrame315
	db $F8,$F4,$04,$08
	dw -11,-16,$0800 : db $FF
	dw -7,0,$0802 : db $FF
	dw 5,-8,$0804 : db $00
.tiles:
	incbin "../Extracted/data/SpriteFrames86.bin":5352..5640
SpriteFrame316:
	db $05,$80
	dw $000E
	dw -12,15,-14,16
	dw $0100,$00C0
	dw .tiles-SpriteFrame316
	db $0F,$00,$06,$0E
	dw -4,-14,$0800 : db $FF
	dw -12,2,$0802 : db $FF
	dw 4,2,$0804 : db $FF
	dw 12,-14,$0806 : db $00
	dw 12,-6,$0807 : db $00
.tiles:
	incbin "../Extracted/data/SpriteFrames86.bin":5697..6145
SpriteFrame317:
	db $05,$80
	dw $0011
	dw -15,24,-19,19
	dw $0120,$0100
	dw .tiles-SpriteFrame317
	db $14,$F1,$06,$0B
	dw -15,4,$0800 : db $FF
	dw 1,4,$0802 : db $FF
	dw -7,-12,$0804 : db $FF
	dw 9,-12,$0806 : db $FF
	dw 18,-20,$0808 : db $00
.tiles:
	incbin "../Extracted/data/SpriteFrames86.bin":6202..6746
SpriteFrame318:
	db $06,$80
	dw $000F
	dw -16,20,-30,17
	dw $0100,$00E0
	dw .tiles-SpriteFrame318
	db $10,$E6,$03,$08
	dw -7,-14,$0800 : db $FF
	dw 9,-14,$0802 : db $FF
	dw -16,2,$0804 : db $FF
	dw 14,-30,$0806 : db $00
	dw 14,-22,$0807 : db $00
	dw 0,2,$0816 : db $00
.tiles:
	incbin "../Extracted/data/SpriteFrames86.bin":6810..7290
SpriteFrame319:
	db $03,$80
	dw $000C
	dw -9,20,-11,16
	dw $00C0,$00C0
	dw .tiles-SpriteFrame319
	db $10,$F7,$04,$0A
	dw -4,-11,$0800 : db $FF
	dw 12,-11,$0802 : db $FF
	dw -9,5,$0804 : db $FF
.tiles:
	incbin "../Extracted/data/SpriteFrames86.bin":7333..7717
SpriteFrame320:
	db $05,$80
	dw $0011
	dw -12,32,-11,17
	dw $0120,$0100
	dw .tiles-SpriteFrame320
	db $1D,$0F,$05,$0F
	dw -12,2,$0800 : db $FF
	dw 4,2,$0802 : db $FF
	dw 20,2,$0804 : db $FF
	dw -4,-14,$0806 : db $FF
	dw 12,-6,$0808 : db $00
.tiles:
	incbin "../Extracted/data/SpriteFrames86.bin":7774..8318
