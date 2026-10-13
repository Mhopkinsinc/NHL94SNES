; Bank $86, third 4 KB: SpriteFrames continued (see bank82_8000), tiles from data/gfx/SpriteFrames86.bin.

org $86A07E
SpriteFrame321:
	db $08,$80
	dw $0014
	dw -17,40,-9,14
	dw $0140,$0140
	dw .tiles-SpriteFrame321
	db $26,$0B,$05,$0D
	dw -17,-1,$0800 : db $FF
	dw -1,-1,$0802 : db $FF
	dw 15,-1,$0804 : db $FF
	dw 31,-1,$0806 : db $FF
	dw -14,-9,$0808 : db $00
	dw -6,-9,$0809 : db $00
	dw 2,-9,$0818 : db $00
	dw 10,-9,$0819 : db $00
.tiles:
	incbin "data/gfx/SpriteFrames86.bin":8396..9036
SpriteFrame322:
	db $05,$80
	dw $0011
	dw -20,46,-6,9
	dw $0120,$0100
	dw .tiles-SpriteFrame322
	db $2B,$06,$05,$07
	dw -20,-6,$0800 : db $FF
	dw -4,-6,$0802 : db $FF
	dw 12,-6,$0804 : db $FF
	dw 28,-6,$0806 : db $FF
	dw 44,2,$0808 : db $00
.tiles:
	incbin "data/gfx/SpriteFrames86.bin":9093..9637
SpriteFrame323:
	db $06,$80
	dw $000F
	dw -15,34,-10,12
	dw $0100,$00E0
	dw .tiles-SpriteFrame323
	db $1F,$04,$07,$0A
	dw -15,-3,$0800 : db $FF
	dw 1,-3,$0802 : db $FF
	dw 17,-3,$0804 : db $FF
	dw 33,-3,$0806 : db $00
	dw -3,-11,$0807 : db $00
	dw 5,-11,$0816 : db $00
.tiles:
	incbin "data/gfx/SpriteFrames86.bin":9701..10181
SpriteFrame324:
	db $05,$80
	dw $0011
	dw -11,27,-9,20
	dw $0120,$0100
	dw .tiles-SpriteFrame324
	db $18,$17,$05,$11
	dw -8,-9,$0800 : db $FF
	dw 8,-9,$0802 : db $FF
	dw -11,7,$0804 : db $FF
	dw 5,7,$0806 : db $FF
	dw 21,7,$0808 : db $00
.tiles:
	incbin "data/gfx/SpriteFrames86.bin":10238..10782
SpriteFrame325:
	db $07,$80
	dw $0013
	dw -14,32,-10,24
	dw $0140,$0120
	dw .tiles-SpriteFrame325
	db $1E,$17,$05,$0A
	dw -14,-10,$0800 : db $FF
	dw 2,-3,$0802 : db $FF
	dw 2,13,$0804 : db $FF
	dw 18,4,$0806 : db $FF
	dw -6,6,$0808 : db $00
	dw 18,20,$0809 : db $00
	dw 26,20,$0818 : db $00
.tiles:
	incbin "data/gfx/SpriteFrames86.bin":10853..11461
SpriteFrame326:
	db $05,$80
	dw $0011
	dw -15,37,-11,19
	dw $0120,$0100
	dw .tiles-SpriteFrame326
	db $23,$12,$07,$06
	dw -15,-11,$0800 : db $FF
	dw 1,-11,$0802 : db $FF
	dw 0,5,$0804 : db $FF
	dw 16,5,$0806 : db $FF
	dw 32,13,$0808 : db $00
.tiles:
	incbin "data/gfx/SpriteFrames86.bin":11518..12062
SpriteFrame327:
	db $04,$80
	dw $000D
	dw -13,23,-4,25
	dw $00E0,$00C0
	dw .tiles-SpriteFrame327
	db $15,$18,$05,$0A
	dw -13,-4,$0800 : db $FF
	dw 3,-4,$0802 : db $FF
	dw 3,12,$0804 : db $FF
	dw 19,20,$0806 : db $00
.tiles:
	incbin "data/gfx/SpriteFrames86.bin":12112..12528
