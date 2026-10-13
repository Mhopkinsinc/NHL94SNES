; Bank $88, sixth 4 KB: SpriteFrames continued (see bank82_8000), tiles from Extracted/data/SpriteFrames88.bin.

org $88D030
SpriteFrame515:
	db $04,$80
	dw $0010
	dw 0,31,-16,25
	dw $0100,$0100
	dw .tiles-SpriteFrame515
	db $00,$FF,$00,$FF
	dw 0,-16,$0200 : db $FF
	dw 0,13,$0202 : db $FF
	dw 16,-16,$0204 : db $FF
	dw 16,13,$0206 : db $FF
.tiles:
	incbin "../Extracted/data/SpriteFrames88.bin":20578..21090
SpriteFrame516:
	db $04,$80
	dw $0010
	dw 0,31,-16,26
	dw $0100,$0100
	dw .tiles-SpriteFrame516
	db $00,$FF,$00,$FF
	dw 0,-16,$0200 : db $FF
	dw 16,-16,$0202 : db $FF
	dw 1,16,$0204 : db $FF
	dw 17,16,$0206 : db $FF
.tiles:
	incbin "../Extracted/data/SpriteFrames88.bin":21140..21652
SpriteFrame517:
	db $05,$80
	dw $0011
	dw -19,16,-30,1
	dw $0120,$0100
	dw .tiles-SpriteFrame517
	db $F1,$FF,$00,$00
	dw -19,-30,$0800 : db $FF
	dw -3,-30,$0802 : db $FF
	dw -15,-14,$0804 : db $FF
	dw 1,-14,$0806 : db $FF
	dw 13,-22,$0808 : db $00
.tiles:
	incbin "../Extracted/data/SpriteFrames88.bin":21709..22253
SpriteFrame518:
	db $06,$80
	dw $000F
	dw -22,15,-26,1
	dw $0100,$00E0
	dw .tiles-SpriteFrame518
	db $EF,$FC,$00,$00
	dw -6,-26,$0800 : db $FF
	dw -15,-10,$0802 : db $FF
	dw 1,-10,$0804 : db $FF
	dw -22,-26,$0806 : db $00
	dw -14,-26,$0807 : db $00
	dw 10,-26,$0816 : db $00
.tiles:
	incbin "../Extracted/data/SpriteFrames88.bin":22317..22797
SpriteFrame519:
	db $05,$80
	dw $000B
	dw -7,13,-30,2
	dw $00C0,$00A0
	dw .tiles-SpriteFrame519
	db $0C,$01,$00,$00
	dw -5,-30,$0800 : db $FF
	dw -7,-14,$0802 : db $FF
	dw 11,-22,$0804 : db $00
	dw 9,-6,$0805 : db $00
	dw 2,2,$0814 : db $00
.tiles:
	incbin "../Extracted/data/SpriteFrames88.bin":22854..23206
SpriteFrame520:
	db $04,$80
	dw $000D
	dw -6,19,-26,2
	dw $00E0,$00C0
	dw .tiles-SpriteFrame520
	db $FC,$00,$00,$00
	dw -6,-26,$0800 : db $FF
	dw 10,-26,$0802 : db $FF
	dw -6,-10,$0804 : db $FF
	dw 10,-2,$0806 : db $00
.tiles:
	incbin "../Extracted/data/SpriteFrames88.bin":23256..23672
SpriteFrame521:
	db $03,$80
	dw $0009
	dw -6,6,-30,3
	dw $00A0,$0080
	dw .tiles-SpriteFrame521
	db $04,$01,$00,$00
	dw -5,-30,$0800 : db $FF
	dw -6,-14,$0802 : db $FF
	dw -5,2,$0804 : db $00
.tiles:
	incbin "../Extracted/data/SpriteFrames88.bin":23715..24003
SpriteFrame522:
	db $05,$80
	dw $000B
	dw -6,19,-28,5
	dw $00C0,$00A0
	dw .tiles-SpriteFrame522
	db $10,$01,$00,$00
	dw 4,-28,$0800 : db $FF
	dw -12,-7,$0802 : db $FF
	dw 4,-2,$0804 : db $00
	dw -4,-23,$0805 : db $00
	dw -4,-15,$0814 : db $00
.tiles:
	incbin "../Extracted/data/SpriteFrames88.bin":24060..24412
SpriteFrame523:
	db $05,$80
	dw $000E
	dw -8,18,-30,4
	dw $0100,$00C0
	dw .tiles-SpriteFrame523
	db $11,$FE,$00,$00
	dw -8,-30,$0800 : db $FF
	dw 8,-30,$0802 : db $FF
	dw -7,-14,$0804 : db $FF
	dw 9,-6,$0806 : db $00
	dw -7,2,$0807 : db $00
.tiles:
	incbin "../Extracted/data/SpriteFrames88.bin":24469..24917
