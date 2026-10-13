; Bank $8D, third 4 KB: SpriteFrames continued (see bank82_8000), tiles from Extracted/data/SpriteFrames8D.bin.

org $8DA109
SpriteFrame849:
	db $04,$80
	dw $000A
	dw -36,-3,-10,5
	dw $00C0,$0080
	dw .tiles-SpriteFrame849
	db $00,$00,$00,$07
	dw -36,-10,$0800 : db $FF
	dw -20,-10,$0802 : db $FF
	dw -4,-10,$0804 : db $00
	dw -4,-2,$0805 : db $00
.tiles:
	incbin "../Extracted/data/SpriteFrames8D.bin":8507..8827
SpriteFrame850:
	db $06,$80
	dw $000F
	dw -40,-3,-18,12
	dw $0100,$00E0
	dw .tiles-SpriteFrame850
	db $00,$00,$00,$06
	dw -21,-18,$0800 : db $FF
	dw -40,-2,$0802 : db $FF
	dw -24,-2,$0804 : db $FF
	dw -5,-10,$0806 : db $00
	dw -8,-2,$0807 : db $00
	dw -8,6,$0816 : db $00
.tiles:
	incbin "../Extracted/data/SpriteFrames8D.bin":8891..9371
SpriteFrame851:
	db $05,$80
	dw $000B
	dw 0,19,-27,7
	dw $00C0,$00A0
	dw .tiles-SpriteFrame851
	db $FE,$05,$09,$05
	dw 3,-27,$0800 : db $FF
	dw 0,-11,$0802 : db $FF
	dw 16,-11,$0804 : db $00
	dw 16,-3,$0805 : db $00
	dw 2,5,$0814 : db $00
.tiles:
	incbin "../Extracted/data/SpriteFrames8D.bin":9428..9780
SpriteFrame852:
	db $07,$80
	dw $0013
	dw -36,9,-36,6
	dw $0140,$0120
	dw .tiles-SpriteFrame852
	db $FF,$00,$05,$00
	dw -19,-9,$0800 : db $FF
	dw -3,-9,$0802 : db $FF
	dw -31,-25,$0804 : db $FF
	dw -15,-25,$0806 : db $FF
	dw 1,-17,$0808 : db $00
	dw -36,-41,$0809 : db $00
	dw -36,-33,$0818 : db $00
.tiles:
	incbin "../Extracted/data/SpriteFrames8D.bin":9851..10459
SpriteFrame853:
	db $05,$80
	dw $000E
	dw -36,2,-9,16
	dw $0100,$00C0
	dw .tiles-SpriteFrame853
	db $00,$00,$00,$00
	dw -36,-9,$0800 : db $FF
	dw -36,7,$0802 : db $FF
	dw -20,-6,$0804 : db $FF
	dw -4,-5,$0806 : db $00
	dw -4,3,$0807 : db $00
.tiles:
	incbin "../Extracted/data/SpriteFrames8D.bin":10516..10964
SpriteFrame854:
	db $05,$80
	dw $000E
	dw -40,-1,-6,20
	dw $0100,$00C0
	dw .tiles-SpriteFrame854
	db $00,$FF,$FD,$00
	dw -34,-6,$0800 : db $FF
	dw -18,-6,$0802 : db $FF
	dw -40,10,$0804 : db $FF
	dw -2,-6,$0806 : db $00
	dw -2,2,$0807 : db $00
.tiles:
	incbin "../Extracted/data/SpriteFrames8D.bin":11021..11469
SpriteFrame855:
	db $05,$80
	dw $000E
	dw -15,9,-27,3
	dw $0100,$00C0
	dw .tiles-SpriteFrame855
	db $FD,$03,$03,$03
	dw -15,-27,$0800 : db $FF
	dw 1,-27,$0802 : db $FF
	dw -10,-11,$0804 : db $FF
	dw 6,-11,$0806 : db $00
	dw 6,-3,$0807 : db $00
.tiles:
	incbin "../Extracted/data/SpriteFrames8D.bin":11526..11974
SpriteFrame856:
	db $04,$80
	dw $000A
	dw -9,6,-38,0
	dw $00C0,$0080
	dw .tiles-SpriteFrame856
	db $00,$00,$00,$00
	dw -6,-38,$0800 : db $FF
	dw -5,-22,$0802 : db $FF
	dw -9,-6,$0804 : db $00
	dw -1,-6,$0805 : db $00
.tiles:
	incbin "../Extracted/data/SpriteFrames8D.bin":12024..12344
