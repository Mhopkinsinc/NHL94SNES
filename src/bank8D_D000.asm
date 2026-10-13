; Bank $8D, sixth 4 KB: SpriteFrames continued (see bank82_8000), tiles from Extracted/data/SpriteFrames8D.bin.

org $8DD161
SpriteFrame874:
	db $07,$80
	dw $000D
	dw -19,20,-26,-3
	dw $00E0,$00C0
	dw .tiles-SpriteFrame874
	db $11,$FA,$00,$00
	dw -19,-26,$0800 : db $FF
	dw -3,-26,$0802 : db $FF
	dw -14,-10,$0804 : db $00
	dw -6,-10,$0805 : db $00
	dw 2,-10,$0814 : db $00
	dw 10,-10,$0815 : db $00
	dw 18,-10,$0806 : db $00
.tiles:
	incbin "../Extracted/data/SpriteFrames8D.bin":20904..21320
SpriteFrame875:
	db $06,$80
	dw $0015
	dw -16,16,-43,0
	dw $0160,$0140
	dw .tiles-SpriteFrame875
	db $F5,$FF,$00,$00
	dw -16,-43,$0800 : db $FF
	dw -12,-27,$0802 : db $FF
	dw 4,-27,$0804 : db $FF
	dw -14,-11,$0806 : db $FF
	dw 2,-11,$0808 : db $FF
	dw 0,-35,$080A : db $00
.tiles:
	incbin "../Extracted/data/SpriteFrames8D.bin":21384..22056
SpriteFrame876:
	db $09,$80
	dw $0012
	dw -18,18,-45,0
	dw $0140,$0100
	dw .tiles-SpriteFrame876
	db $07,$FF,$00,$00
	dw -11,-29,$0800 : db $FF
	dw -18,-13,$0802 : db $FF
	dw -2,-13,$0804 : db $FF
	dw 0,-45,$0806 : db $00
	dw 0,-37,$0807 : db $00
	dw 5,-29,$0816 : db $00
	dw 5,-21,$0817 : db $00
	dw 14,-13,$0808 : db $00
	dw 14,-5,$0809 : db $00
.tiles:
	incbin "../Extracted/data/SpriteFrames8D.bin":22141..22717
SpriteFrame877:
	db $05,$80
	dw $0011
	dw -12,29,-25,-1
	dw $0120,$0100
	dw .tiles-SpriteFrame877
	db $1E,$FE,$00,$00
	dw -9,-25,$0800 : db $FF
	dw 7,-25,$0802 : db $FF
	dw -12,-9,$0804 : db $FF
	dw 4,-9,$0806 : db $FF
	dw 23,-25,$0808 : db $00
.tiles:
	incbin "../Extracted/data/SpriteFrames8D.bin":22774..23318
SpriteFrame878:
	db $06,$80
	dw $000C
	dw -12,24,-23,-1
	dw $00C0,$00C0
	dw .tiles-SpriteFrame878
	db $1A,$F8,$00,$00
	dw -12,-20,$0800 : db $FF
	dw 4,-23,$0802 : db $FF
	dw 4,-7,$0804 : db $00
	dw 12,-7,$0805 : db $00
	dw 20,-14,$0814 : db $00
	dw 20,-6,$0815 : db $00
.tiles:
	incbin "../Extracted/data/SpriteFrames8D.bin":23382..23766
SpriteFrame879:
	db $04,$80
	dw $000A
	dw -14,2,-43,2
	dw $00C0,$0080
	dw .tiles-SpriteFrame879
	db $03,$00,$01,$05
	dw -14,-27,$0800 : db $FF
	dw -11,-11,$0802 : db $FF
	dw -8,-43,$0804 : db $00
	dw -8,-35,$0805 : db $00
.tiles:
	incbin "../Extracted/data/SpriteFrames8D.bin":23816..24136
SpriteFrame880:
	db $04,$80
	dw $000D
	dw -3,27,-32,-2
	dw $00E0,$00C0
	dw .tiles-SpriteFrame880
	db $00,$00,$00,$00
	dw -3,-32,$0800 : db $FF
	dw 13,-32,$0802 : db $FF
	dw -3,-16,$0804 : db $FF
	dw 13,-16,$0806 : db $00
.tiles:
	incbin "../Extracted/data/SpriteFrames8D.bin":24186..24602
