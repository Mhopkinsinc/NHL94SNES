; Bank $8B, fourth 4 KB: SpriteFrames continued (see bank82_8000), tiles from Extracted/data/SpriteFrames8B.bin.

org $8BB013
SpriteFrame712:
	db $04,$80
	dw $000A
	dw -16,11,-15,2
	dw $00C0,$0080
	dw .tiles-SpriteFrame712
	db $F3,$01,$F4,$FE
	dw -16,-13,$0800 : db $FF
	dw 0,-13,$0802 : db $FF
	dw -12,-21,$0804 : db $00
	dw -4,-21,$0805 : db $00
.tiles:
	incbin "../Extracted/data/SpriteFrames8B.bin":12357..12677
SpriteFrame713:
	db $04,$80
	dw $000A
	dw -32,7,-7,7
	dw $00C0,$0080
	dw .tiles-SpriteFrame713
	db $EB,$00,$EB,$00
	dw -32,-7,$0800 : db $FF
	dw -16,-7,$0802 : db $FF
	dw 0,-7,$0804 : db $00
	dw 0,1,$0805 : db $00
.tiles:
	incbin "../Extracted/data/SpriteFrames8B.bin":12727..13047
SpriteFrame714:
	db $04,$80
	dw $0010
	dw -21,9,-21,3
	dw $0100,$0100
	dw .tiles-SpriteFrame714
	db $F1,$03,$EE,$F5
	dw -21,-21,$0800 : db $FF
	dw -5,-21,$0802 : db $FF
	dw -21,-5,$0804 : db $FF
	dw -5,-5,$0806 : db $FF
.tiles:
	incbin "../Extracted/data/SpriteFrames8B.bin":13097..13609
SpriteFrame715:
	db $04,$80
	dw $000A
	dw -24,10,-15,3
	dw $00C0,$0080
	dw .tiles-SpriteFrame715
	db $EB,$01,$E8,$FF
	dw -24,-12,$0800 : db $FF
	dw -8,-12,$0802 : db $FF
	dw 8,-4,$0804 : db $00
	dw -16,-20,$0805 : db $00
.tiles:
	incbin "../Extracted/data/SpriteFrames8B.bin":13659..13979
SpriteFrame716:
	db $03,$80
	dw $000C
	dw -30,11,-10,3
	dw $00C0,$00C0
	dw .tiles-SpriteFrame716
	db $F3,$FF,$F3,$FF
	dw -30,-10,$0800 : db $FF
	dw -14,-10,$0802 : db $FF
	dw 2,-10,$0804 : db $FF
.tiles:
	incbin "../Extracted/data/SpriteFrames8B.bin":14022..14406
SpriteFrame717:
	db $04,$80
	dw $000A
	dw -10,12,-25,-1
	dw $00C0,$0080
	dw .tiles-SpriteFrame717
	db $00,$FE,$01,$F5
	dw -10,-16,$0800 : db $FF
	dw -8,-32,$0802 : db $FF
	dw 6,-16,$0804 : db $00
	dw 6,-8,$0805 : db $00
.tiles:
	incbin "../Extracted/data/SpriteFrames8B.bin":14456..14776
SpriteFrame718:
	db $04,$80
	dw $000A
	dw -14,13,-21,-1
	dw $00C0,$0080
	dw .tiles-SpriteFrame718
	db $F3,$FF,$F1,$F7
	dw -14,-16,$0800 : db $FF
	dw 2,-16,$0802 : db $FF
	dw -6,-24,$0804 : db $00
	dw 2,-24,$0805 : db $00
.tiles:
	incbin "../Extracted/data/SpriteFrames8B.bin":14826..15146
SpriteFrame719:
	db $02,$80
	dw $0008
	dw -17,12,-14,-1
	dw $0080,$0080
	dw .tiles-SpriteFrame719
	db $F0,$FE,$EF,$F8
	dw -17,-14,$0800 : db $FF
	dw -1,-14,$0802 : db $FF
.tiles:
	incbin "../Extracted/data/SpriteFrames8B.bin":15182..15438
SpriteFrame720:
	db $05,$80
	dw $000E
	dw -8,20,-26,1
	dw $0100,$00C0
	dw .tiles-SpriteFrame720
	db $02,$00,$14,$F2
	dw -8,-26,$0800 : db $FF
	dw -7,-10,$0802 : db $FF
	dw 9,-10,$0804 : db $FF
	dw 8,-18,$0806 : db $00
	dw 16,-18,$0807 : db $00
.tiles:
	incbin "../Extracted/data/SpriteFrames8B.bin":15495..15943
SpriteFrame721:
	db $03,$80
	dw $000C
	dw -8,20,-23,1
	dw $00C0,$00C0
	dw .tiles-SpriteFrame721
	db $14,$01,$15,$F6
	dw -8,-14,$0800 : db $FF
	dw 8,-14,$0802 : db $FF
	dw -8,-30,$0804 : db $FF
.tiles:
	incbin "../Extracted/data/SpriteFrames8B.bin":15986..16370
SpriteFrame722:
	db $02,$80
	dw $0008
	dw -6,18,-12,4
	dw $0080,$0080
	dw .tiles-SpriteFrame722
	db $10,$04,$12,$FF
	dw -6,-12,$0800 : db $FF
	dw 10,-5,$0802 : db $FF
.tiles:
	incbin "../Extracted/data/SpriteFrames8B.bin":16406..16662
