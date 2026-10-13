; Bank $8A, seventh 4 KB: SpriteFrames continued (see bank82_8000), tiles from Extracted/data/SpriteFrames8A.bin.

org $8AE0FB
SpriteFrame668:
	db $04,$80
	dw $0010
	dw -8,33,-6,20
	dw $0100,$0100
	dw .tiles-SpriteFrame668
	db $12,$0A,$1A,$0D
	dw 18,5,$0800 : db $FF
	dw 2,-6,$0802 : db $FF
	dw 2,10,$0804 : db $FF
	dw -14,-6,$0806 : db $FF
.tiles:
	incbin "../Extracted/data/SpriteFrames8A.bin":24877..25389
SpriteFrame669:
	db $06,$80
	dw $000F
	dw -14,8,-5,35
	dw $0100,$00E0
	dw .tiles-SpriteFrame669
	db $FE,$12,$09,$14
	dw -8,-5,$0800 : db $FF
	dw -14,11,$0802 : db $FF
	dw -11,27,$0804 : db $FF
	dw 2,11,$0806 : db $00
	dw 2,19,$0807 : db $00
	dw 5,27,$0816 : db $00
.tiles:
	incbin "../Extracted/data/SpriteFrames8A.bin":25453..25933
SpriteFrame670:
	db $05,$80
	dw $000E
	dw -16,10,-1,34
	dw $0100,$00C0
	dw .tiles-SpriteFrame670
	db $FF,$17,$07,$1B
	dw -16,19,$0800 : db $FF
	dw 0,19,$0802 : db $FF
	dw -8,3,$0804 : db $FF
	dw -8,-5,$0806 : db $00
	dw 0,-5,$0807 : db $00
.tiles:
	incbin "../Extracted/data/SpriteFrames8A.bin":25990..26438
SpriteFrame671:
	db $05,$80
	dw $0011
	dw -21,8,-22,13
	dw $0120,$0100
	dw .tiles-SpriteFrame671
	db $F5,$04,$EC,$F5
	dw -20,-22,$0800 : db $FF
	dw -4,-22,$0802 : db $FF
	dw -21,-6,$0804 : db $FF
	dw -5,-6,$0806 : db $FF
	dw -13,10,$0808 : db $00
.tiles:
	incbin "../Extracted/data/SpriteFrames8A.bin":26495..27039
SpriteFrame672:
	db $07,$80
	dw $0010
	dw -34,6,-5,26
	dw $0100,$0100
	dw .tiles-SpriteFrame672
	db $EE,$0C,$F6,$0C
	dw -17,-5,$0800 : db $FF
	dw -34,11,$0802 : db $FF
	dw -18,11,$0804 : db $FF
	dw -33,3,$0806 : db $00
	dw -25,3,$0807 : db $00
	dw -1,-5,$0816 : db $00
	dw -1,3,$0817 : db $00
.tiles:
	incbin "../Extracted/data/SpriteFrames8A.bin":27110..27622
SpriteFrame673:
	db $05,$80
	dw $0011
	dw -25,11,-23,6
	dw $0120,$0100
	dw .tiles-SpriteFrame673
	db $F4,$FE,$EF,$F2
	dw -23,-23,$0800 : db $FF
	dw -7,-23,$0802 : db $FF
	dw -25,-7,$0804 : db $FF
	dw -9,-7,$0806 : db $FF
	dw 7,-7,$0808 : db $00
.tiles:
	incbin "../Extracted/data/SpriteFrames8A.bin":27679..28223
SpriteFrame674:
	db $04,$80
	dw $000D
	dw -44,3,-13,5
	dw $00E0,$00C0
	dw .tiles-SpriteFrame674
	db $E3,$FC,$EC,$FB
	dw -44,-10,$0800 : db $FF
	dw -28,-10,$0802 : db $FF
	dw -12,-10,$0804 : db $FF
	dw -29,-18,$0806 : db $00
.tiles:
	incbin "../Extracted/data/SpriteFrames8A.bin":28273..28689
