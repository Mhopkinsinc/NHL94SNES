; Bank $85, fourth 4 KB: SpriteFrames continued (see bank82_8000), tiles from Extracted/data/SpriteFrames85.bin.

org $85B0F9
SpriteFrame263:
	db $03,$80
	dw $000C
	dw -18,11,-25,6
	dw $00C0,$00C0
	dw .tiles-SpriteFrame263
	db $F1,$05,$03,$04
	dw -6,-25,$0800 : db $FF
	dw -18,-9,$0802 : db $FF
	dw -2,-9,$0804 : db $FF
.tiles:
	incbin "../Extracted/data/SpriteFrames85.bin":12580..12964
SpriteFrame264:
	db $02,$80
	dw $0008
	dw -9,7,-26,5
	dw $0080,$0080
	dw .tiles-SpriteFrame264
	db $F7,$EB,$03,$05
	dw -9,-26,$0800 : db $FF
	dw -8,-10,$0802 : db $FF
.tiles:
	incbin "../Extracted/data/SpriteFrames85.bin":13000..13256
SpriteFrame265:
	db $06,$80
	dw $000C
	dw -11,9,-31,8
	dw $00C0,$00C0
	dw .tiles-SpriteFrame265
	db $F5,$E3,$03,$07
	dw -10,-31,$0800 : db $FF
	dw -11,-15,$0802 : db $FF
	dw 5,-15,$0804 : db $00
	dw 5,-7,$0805 : db $00
	dw -2,1,$0814 : db $00
	dw 6,1,$0815 : db $00
.tiles:
	incbin "../Extracted/data/SpriteFrames85.bin":13320..13704
SpriteFrame266:
	db $03,$80
	dw $000C
	dw -7,18,-24,7
	dw $00C0,$00C0
	dw .tiles-SpriteFrame266
	db $11,$FA,$01,$05
	dw -7,-24,$0800 : db $FF
	dw -7,-8,$0802 : db $FF
	dw 9,-9,$0804 : db $FF
.tiles:
	incbin "../Extracted/data/SpriteFrames85.bin":13747..14131
SpriteFrame267:
	db $04,$80
	dw $000D
	dw -8,21,-22,6
	dw $00E0,$00C0
	dw .tiles-SpriteFrame267
	db $14,$F1,$FF,$04
	dw -8,-22,$0800 : db $FF
	dw 8,-22,$0802 : db $FF
	dw -8,-6,$0804 : db $FF
	dw 8,-6,$0806 : db $00
.tiles:
	incbin "../Extracted/data/SpriteFrames85.bin":14181..14597
SpriteFrame268:
	db $04,$80
	dw $000D
	dw -9,29,-25,5
	dw $00E0,$00C0
	dw .tiles-SpriteFrame268
	db $1A,$03,$03,$01
	dw -3,-25,$0800 : db $FF
	dw -9,-9,$0802 : db $FF
	dw 7,-9,$0804 : db $FF
	dw 23,-1,$0806 : db $00
.tiles:
	incbin "../Extracted/data/SpriteFrames85.bin":14647..15063
SpriteFrame269:
	db $09,$80
	dw $000C
	dw -11,34,-20,3
	dw $00C0,$00C0
	dw .tiles-SpriteFrame269
	db $22,$02,$02,$00
	dw -6,-20,$0800 : db $FF
	dw 10,-20,$0802 : db $00
	dw 10,-12,$0803 : db $00
	dw -11,-4,$0812 : db $00
	dw -3,-4,$0813 : db $00
	dw 5,-4,$0804 : db $00
	dw 13,-4,$0805 : db $00
	dw 21,-4,$0814 : db $00
	dw 29,-4,$0815 : db $00
.tiles:
	incbin "../Extracted/data/SpriteFrames85.bin":15148..15532
SpriteFrame270:
	db $05,$80
	dw $000E
	dw -11,22,-23,12
	dw $0100,$00C0
	dw .tiles-SpriteFrame270
	db $13,$0C,$02,$02
	dw -6,-23,$0800 : db $FF
	dw -11,-7,$0802 : db $FF
	dw 5,-7,$0804 : db $FF
	dw 10,-23,$0806 : db $00
	dw 16,9,$0807 : db $00
.tiles:
	incbin "../Extracted/data/SpriteFrames85.bin":15589..16037
SpriteFrame271:
	db $07,$80
	dw $0010
	dw -13,34,-19,13
	dw $0100,$0100
	dw .tiles-SpriteFrame271
	db $1F,$0C,$03,$03
	dw -13,-18,$0800 : db $FF
	dw 3,-19,$0802 : db $FF
	dw 3,-3,$0804 : db $FF
	dw -13,-2,$0806 : db $00
	dw -5,-2,$0807 : db $00
	dw 19,8,$0816 : db $00
	dw 27,8,$0817 : db $00
.tiles:
	incbin "../Extracted/data/SpriteFrames85.bin":16108..16620
