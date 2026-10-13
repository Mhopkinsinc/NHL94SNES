; Bank $85, third 4 KB: SpriteFrames continued (see bank82_8000), tiles from Extracted/data/SpriteFrames85.bin.

org $85A11F
SpriteFrame255:
	db $06,$80
	dw $0012
	dw -28,5,-31,2
	dw $0140,$0100
	dw .tiles-SpriteFrame255
	db $E5,$F6,$00,$04
	dw -28,-31,$0800 : db $FF
	dw -12,-31,$0802 : db $FF
	dw -26,-15,$0804 : db $FF
	dw -10,-15,$0806 : db $FF
	dw -6,1,$0808 : db $00
	dw 2,1,$0809 : db $00
.tiles:
	incbin "../Extracted/data/SpriteFrames85.bin":8543..9119
SpriteFrame256:
	db $05,$80
	dw $000E
	dw -23,8,-26,5
	dw $0100,$00C0
	dw .tiles-SpriteFrame256
	db $EA,$FF,$04,$04
	dw -23,-26,$0800 : db $FF
	dw -7,-26,$0802 : db $FF
	dw -7,-10,$0804 : db $FF
	dw -23,-2,$0806 : db $00
	dw -15,-2,$0807 : db $00
.tiles:
	incbin "../Extracted/data/SpriteFrames85.bin":9176..9624
SpriteFrame257:
	db $04,$80
	dw $0010
	dw -17,11,-24,5
	dw $0100,$0100
	dw .tiles-SpriteFrame257
	db $F0,$FE,$04,$04
	dw -14,-24,$0800 : db $FF
	dw 2,-24,$0802 : db $FF
	dw -17,-8,$0804 : db $FF
	dw -1,-8,$0806 : db $FF
.tiles:
	incbin "../Extracted/data/SpriteFrames85.bin":9674..10186
SpriteFrame258:
	db $04,$80
	dw $000D
	dw -11,17,-20,5
	dw $00E0,$00C0
	dw .tiles-SpriteFrame258
	db $0F,$F7,$05,$04
	dw -7,-20,$0800 : db $FF
	dw 9,-20,$0802 : db $FF
	dw -11,-4,$0804 : db $FF
	dw 5,-4,$0806 : db $00
.tiles:
	incbin "../Extracted/data/SpriteFrames85.bin":10236..10652
SpriteFrame259:
	db $04,$80
	dw $0010
	dw -17,14,-26,4
	dw $0100,$0100
	dw .tiles-SpriteFrame259
	db $0D,$FD,$03,$04
	dw -17,-26,$0800 : db $FF
	dw -1,-26,$0802 : db $FF
	dw -13,-10,$0804 : db $FF
	dw 3,-10,$0806 : db $FF
.tiles:
	incbin "../Extracted/data/SpriteFrames85.bin":10702..11214
SpriteFrame260:
	db $05,$80
	dw $000E
	dw -15,19,-21,4
	dw $0100,$00C0
	dw .tiles-SpriteFrame260
	db $10,$00,$03,$04
	dw -15,-21,$0800 : db $FF
	dw 1,-21,$0802 : db $FF
	dw -9,-5,$0804 : db $FF
	dw 7,-5,$0806 : db $00
	dw 15,-5,$0807 : db $00
.tiles:
	incbin "../Extracted/data/SpriteFrames85.bin":11271..11719
SpriteFrame261:
	db $04,$80
	dw $000A
	dw -17,10,-21,8
	dw $00C0,$0080
	dw .tiles-SpriteFrame261
	db $03,$07,$06,$04
	dw -17,-21,$0800 : db $FF
	dw -10,-5,$0802 : db $FF
	dw -1,-13,$0804 : db $00
	dw 6,-5,$0805 : db $00
.tiles:
	incbin "../Extracted/data/SpriteFrames85.bin":11769..12089
SpriteFrame262:
	db $06,$80
	dw $000C
	dw -19,11,-24,6
	dw $00C0,$00C0
	dw .tiles-SpriteFrame262
	db $F4,$06,$03,$04
	dw -19,-24,$0800 : db $FF
	dw -11,-8,$0802 : db $FF
	dw -3,-24,$0804 : db $00
	dw -3,-16,$0805 : db $00
	dw 5,-8,$0814 : db $00
	dw 5,0,$0815 : db $00
.tiles:
	incbin "../Extracted/data/SpriteFrames85.bin":12153..12537
