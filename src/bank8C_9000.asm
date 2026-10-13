; Bank $8C, second 4 KB: SpriteFrames continued (see bank82_8000), tiles from Extracted/data/SpriteFrames8C.bin.

org $8C913D
SpriteFrame767:
	db $03,$80
	dw $000C
	dw -12,30,-9,7
	dw $00C0,$00C0
	dw .tiles-SpriteFrame767
	db $19,$06,$1C,$03
	dw -12,-9,$0800 : db $FF
	dw 4,-9,$0802 : db $FF
	dw 20,-4,$0804 : db $FF
.tiles:
	incbin "../Extracted/data/SpriteFrames8C.bin":4456..4840
SpriteFrame768:
	db $03,$80
	dw $000C
	dw -9,17,-26,4
	dw $00C0,$00C0
	dw .tiles-SpriteFrame768
	db $10,$03,$12,$F9
	dw -5,-26,$0800 : db $FF
	dw -9,-10,$0802 : db $FF
	dw 7,-10,$0804 : db $FF
.tiles:
	incbin "../Extracted/data/SpriteFrames8C.bin":4883..5267
SpriteFrame769:
	db $03,$80
	dw $0009
	dw -8,20,-12,10
	dw $00A0,$0080
	dw .tiles-SpriteFrame769
	db $0B,$0B,$0D,$08
	dw -8,-5,$0800 : db $FF
	dw 8,-5,$0802 : db $FF
	dw -4,-13,$0804 : db $00
.tiles:
	incbin "../Extracted/data/SpriteFrames8C.bin":5310..5598
SpriteFrame770:
	db $07,$80
	dw $000D
	dw -14,18,-8,15
	dw $00E0,$00C0
	dw .tiles-SpriteFrame770
	db $05,$10,$08,$0D
	dw -14,-8,$0800 : db $FF
	dw 2,-8,$0802 : db $FF
	dw 18,0,$0804 : db $00
	dw -10,8,$0805 : db $00
	dw -2,8,$0814 : db $00
	dw 6,8,$0815 : db $00
	dw 14,8,$0806 : db $00
.tiles:
	incbin "../Extracted/data/SpriteFrames8C.bin":5669..6085
SpriteFrame771:
	db $02,$80
	dw $0008
	dw -4,11,-26,5
	dw $0080,$0080
	dw .tiles-SpriteFrame771
	db $06,$05,$0A,$FB
	dw -4,-26,$0800 : db $FF
	dw -4,-10,$0802 : db $FF
.tiles:
	incbin "../Extracted/data/SpriteFrames8C.bin":6121..6377
SpriteFrame772:
	db $04,$80
	dw $000A
	dw -17,13,-13,10
	dw $00C0,$0080
	dw .tiles-SpriteFrame772
	db $F2,$0A,$EF,$06
	dw -17,-5,$0800 : db $FF
	dw -1,-5,$0802 : db $FF
	dw -8,-13,$0804 : db $00
	dw 0,-13,$0805 : db $00
.tiles:
	incbin "../Extracted/data/SpriteFrames8C.bin":6427..6747
SpriteFrame773:
	db $03,$80
	dw $000C
	dw -33,11,-7,9
	dw $00C0,$00C0
	dw .tiles-SpriteFrame773
	db $E3,$09,$DF,$05
	dw -33,1,$0800 : db $FF
	dw -17,-7,$0802 : db $FF
	dw -1,-4,$0804 : db $FF
.tiles:
	incbin "../Extracted/data/SpriteFrames8C.bin":6790..7174
SpriteFrame774:
	db $05,$80
	dw $0011
	dw -22,13,-24,4
	dw $0120,$0100
	dw .tiles-SpriteFrame774
	db $EE,$00,$EA,$F6
	dw -22,-24,$0800 : db $FF
	dw -6,-24,$0802 : db $FF
	dw -21,-8,$0804 : db $FF
	dw -5,-8,$0806 : db $FF
	dw 10,-16,$0808 : db $00
.tiles:
	incbin "../Extracted/data/SpriteFrames8C.bin":7231..7775
SpriteFrame775:
	db $06,$80
	dw $000C
	dw -26,8,-17,4
	dw $00C0,$00C0
	dw .tiles-SpriteFrame775
	db $E9,$02,$E6,$F9
	dw -26,-11,$0800 : db $FF
	dw -10,-11,$0802 : db $FF
	dw 6,-11,$0804 : db $00
	dw 6,-3,$0805 : db $00
	dw -9,-19,$0814 : db $00
	dw -1,-19,$0815 : db $00
.tiles:
	incbin "../Extracted/data/SpriteFrames8C.bin":7839..8223
