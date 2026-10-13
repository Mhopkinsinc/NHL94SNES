; Bank $8C, first 4 KB: SpriteFrames continued (see bank82_8000), tiles from Extracted/data/SpriteFrames8C.bin.

org $8C8000
SpriteFrame758:
	db $06,$80
	dw $0012
	dw -32,29,-17,7
	dw $0140,$0100
	dw .tiles-SpriteFrame758
	db $1A,$FE,$1D,$FD
	dw -16,-8,$0800 : db $FF
	dw 0,-17,$0802 : db $FF
	dw 0,-1,$0804 : db $FF
	dw 16,-9,$0806 : db $FF
	dw -32,0,$0808 : db $00
	dw -24,0,$0809 : db $00
.tiles:
	incbin "../Extracted/data/SpriteFrames8C.bin":64..640
SpriteFrame759:
	db $06,$80
	dw $000C
	dw -9,8,-27,5
	dw $00C0,$00C0
	dw .tiles-SpriteFrame759
	db $06,$02,$09,$F8
	dw -9,-27,$0800 : db $FF
	dw -9,-11,$0802 : db $FF
	dw 7,-19,$0804 : db $00
	dw 7,-11,$0805 : db $00
	dw 7,-3,$0814 : db $00
	dw 2,5,$0815 : db $00
.tiles:
	incbin "../Extracted/data/SpriteFrames8C.bin":704..1088
SpriteFrame760:
	db $06,$80
	dw $000C
	dw -17,18,-16,6
	dw $00C0,$00C0
	dw .tiles-SpriteFrame760
	db $0D,$03,$12,$FA
	dw -17,-9,$0800 : db $FF
	dw -1,-9,$0802 : db $FF
	dw 15,-9,$0804 : db $00
	dw 15,-1,$0805 : db $00
	dw -4,-17,$0814 : db $00
	dw 4,-17,$0815 : db $00
.tiles:
	incbin "../Extracted/data/SpriteFrames8C.bin":1152..1536
SpriteFrame761:
	db $05,$80
	dw $0011
	dw -16,28,-13,12
	dw $0120,$0100
	dw .tiles-SpriteFrame761
	db $18,$05,$1B,$03
	dw -16,-3,$0800 : db $FF
	dw 0,-3,$0802 : db $FF
	dw 16,-3,$0804 : db $FF
	dw -6,-19,$0806 : db $FF
	dw 10,-11,$0808 : db $00
.tiles:
	incbin "../Extracted/data/SpriteFrames8C.bin":1593..2137
SpriteFrame762:
	db $05,$80
	dw $000B
	dw -16,5,-27,1
	dw $00C0,$00A0
	dw .tiles-SpriteFrame762
	db $F6,$00,$F3,$F2
	dw -13,-27,$0800 : db $FF
	dw -16,-11,$0802 : db $FF
	dw 3,-27,$0804 : db $00
	dw 0,-11,$0805 : db $00
	dw 0,-3,$0814 : db $00
.tiles:
	incbin "../Extracted/data/SpriteFrames8C.bin":2194..2546
SpriteFrame763:
	db $05,$80
	dw $000B
	dw -17,13,-21,5
	dw $00C0,$00A0
	dw .tiles-SpriteFrame763
	db $F5,$04,$F2,$F6
	dw -13,-21,$0800 : db $FF
	dw -17,-5,$0802 : db $FF
	dw 3,-21,$0804 : db $00
	dw -1,-5,$0805 : db $00
	dw 7,-5,$0814 : db $00
.tiles:
	incbin "../Extracted/data/SpriteFrames8C.bin":2603..2955
SpriteFrame764:
	db $06,$80
	dw $000C
	dw -24,15,-6,11
	dw $00C0,$00C0
	dw .tiles-SpriteFrame764
	db $F4,$0B,$F1,$09
	dw -24,-6,$0800 : db $FF
	dw -8,-6,$0802 : db $FF
	dw 8,-6,$0804 : db $00
	dw 8,2,$0805 : db $00
	dw -16,10,$0814 : db $00
	dw -8,10,$0815 : db $00
.tiles:
	incbin "../Extracted/data/SpriteFrames8C.bin":3019..3403
SpriteFrame765:
	db $04,$80
	dw $0010
	dw -11,15,-25,1
	dw $0100,$0100
	dw .tiles-SpriteFrame765
	db $0E,$FD,$10,$F6
	dw -10,-25,$0800 : db $FF
	dw 6,-25,$0802 : db $FF
	dw -11,-9,$0804 : db $FF
	dw 5,-9,$0806 : db $FF
.tiles:
	incbin "../Extracted/data/SpriteFrames8C.bin":3453..3965
SpriteFrame766:
	db $06,$80
	dw $000C
	dw -8,20,-14,5
	dw $00C0,$00C0
	dw .tiles-SpriteFrame766
	db $13,$04,$15,$F8
	dw -8,-14,$0800 : db $FF
	dw 8,-14,$0802 : db $FF
	dw -7,2,$0804 : db $00
	dw 1,2,$0805 : db $00
	dw 9,2,$0814 : db $00
	dw 17,2,$0815 : db $00
.tiles:
	incbin "../Extracted/data/SpriteFrames8C.bin":4029..4413
