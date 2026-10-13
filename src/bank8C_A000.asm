; Bank $8C, third 4 KB: SpriteFrames continued (see bank82_8000), tiles from Extracted/data/SpriteFrames8C.bin.

org $8CA01F
SpriteFrame776:
	db $05,$80
	dw $000E
	dw -36,9,-12,7
	dw $0100,$00C0
	dw .tiles-SpriteFrame776
	db $DF,$01,$DC,$FE
	dw -36,-12,$0800 : db $FF
	dw -20,-12,$0802 : db $FF
	dw -4,-12,$0804 : db $FF
	dw -15,4,$0806 : db $00
	dw -7,4,$0807 : db $00
.tiles:
	incbin "../Extracted/data/SpriteFrames8C.bin":8280..8728
SpriteFrame777:
	db $05,$80
	dw $0011
	dw -20,13,-23,5
	dw $0120,$0100
	dw .tiles-SpriteFrame777
	db $F0,$01,$EC,$F5
	dw -20,-23,$0800 : db $FF
	dw -4,-23,$0802 : db $FF
	dw -15,-7,$0804 : db $FF
	dw 1,-7,$0806 : db $FF
	dw 12,-15,$0808 : db $00
.tiles:
	incbin "../Extracted/data/SpriteFrames8C.bin":8785..9329
SpriteFrame778:
	db $06,$80
	dw $000C
	dw -22,9,-19,3
	dw $00C0,$00C0
	dw .tiles-SpriteFrame778
	db $EE,$FC,$EC,$F1
	dw -22,-19,$0800 : db $FF
	dw -6,-19,$0802 : db $FF
	dw -19,-3,$0804 : db $00
	dw -11,-3,$0805 : db $00
	dw -3,-3,$0814 : db $00
	dw 5,-3,$0815 : db $00
.tiles:
	incbin "../Extracted/data/SpriteFrames8C.bin":9393..9777
SpriteFrame779:
	db $04,$80
	dw $000D
	dw -29,16,-12,4
	dw $00E0,$00C0
	dw .tiles-SpriteFrame779
	db $E4,$FB,$E2,$F7
	dw -29,-12,$0800 : db $FF
	dw -13,-12,$0802 : db $FF
	dw 3,-12,$0804 : db $FF
	dw -19,4,$0806 : db $00
.tiles:
	incbin "../Extracted/data/SpriteFrames8C.bin":9827..10243
SpriteFrame780:
	db $05,$80
	dw $000E
	dw -18,10,-20,5
	dw $0100,$00C0
	dw .tiles-SpriteFrame780
	db $F3,$00,$F0,$F7
	dw -16,-20,$0800 : db $FF
	dw 0,-20,$0802 : db $FF
	dw -18,-4,$0804 : db $FF
	dw -2,-4,$0806 : db $00
	dw 6,-4,$0807 : db $00
.tiles:
	incbin "../Extracted/data/SpriteFrames8C.bin":10300..10748
SpriteFrame781:
	db $06,$80
	dw $000C
	dw -23,8,-17,2
	dw $00C0,$00C0
	dw .tiles-SpriteFrame781
	db $EC,$FA,$EA,$F3
	dw -23,-17,$0800 : db $FF
	dw -7,-17,$0802 : db $FF
	dw -23,-1,$0804 : db $00
	dw -15,-1,$0805 : db $00
	dw -7,-1,$0814 : db $00
	dw 1,-1,$0815 : db $00
.tiles:
	incbin "../Extracted/data/SpriteFrames8C.bin":10812..11196
SpriteFrame782:
	db $06,$80
	dw $000F
	dw -30,11,-16,5
	dw $0100,$00E0
	dw .tiles-SpriteFrame782
	db $E4,$F9,$E1,$F6
	dw -30,-10,$0800 : db $FF
	dw -14,-10,$0802 : db $FF
	dw 2,-10,$0804 : db $FF
	dw -30,-18,$0806 : db $00
	dw -6,-18,$0807 : db $00
	dw 2,-18,$0816 : db $00
.tiles:
	incbin "../Extracted/data/SpriteFrames8C.bin":11260..11740
SpriteFrame783:
	db $04,$80
	dw $000A
	dw -13,9,-27,3
	dw $00C0,$0080
	dw .tiles-SpriteFrame783
	db $00,$02,$00,$EF
	dw -13,-27,$0800 : db $FF
	dw -5,-11,$0802 : db $FF
	dw 3,-27,$0804 : db $00
	dw 3,-19,$0805 : db $00
.tiles:
	incbin "../Extracted/data/SpriteFrames8C.bin":11790..12110
SpriteFrame784:
	db $03,$80
	dw $0006
	dw -7,8,-14,2
	dw $0080,$0040
	dw .tiles-SpriteFrame784
	db $05,$01,$06,$F9
	dw -7,-14,$0800 : db $FF
	dw -6,2,$0802 : db $00
	dw 2,2,$0803 : db $00
.tiles:
	incbin "../Extracted/data/SpriteFrames8C.bin":12153..12345
