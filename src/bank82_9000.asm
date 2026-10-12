; Bank $82, second 4 KB: SpriteFrames continued (see bank82_8000), tiles from Extracted/data/SpriteFrames82.bin.

org $82908B
SpriteFrame1:
	db $05,$80
	dw $000B
	dw -9,9,-29,5
	dw $00C0,$00A0
	dw .tiles-SpriteFrame1
	db $01,$E5,$00,$00
	dw -3,-29,$0800 : db $FF
	dw -9,-13,$0802 : db $FF
	dw 7,-5,$0804 : db $00
	dw -8,3,$0805 : db $00
	dw 0,3,$0814 : db $00
.tiles:
	incbin "../Extracted/data/SpriteFrames82.bin":388..740
SpriteFrame2:
	db $02,$80
	dw $0008
	dw -5,6,-27,4
	dw $0080,$0080
	dw .tiles-SpriteFrame2
	db $02,$E7,$00,$00
	dw -5,-27,$0800 : db $FF
	dw -5,-11,$0802 : db $FF
.tiles:
	incbin "../Extracted/data/SpriteFrames82.bin":776..1032
SpriteFrame3:
	db $02,$80
	dw $0008
	dw -6,9,-26,5
	dw $0080,$0080
	dw .tiles-SpriteFrame3
	db $00,$E7,$00,$00
	dw -6,-26,$0800 : db $FF
	dw -4,-10,$0802 : db $FF
.tiles:
	incbin "../Extracted/data/SpriteFrames82.bin":1068..1324
SpriteFrame4:
	db $02,$80
	dw $0008
	dw -5,8,-26,4
	dw $0080,$0080
	dw .tiles-SpriteFrame4
	db $02,$E7,$00,$00
	dw -4,-26,$0800 : db $FF
	dw -5,-10,$0802 : db $FF
.tiles:
	incbin "../Extracted/data/SpriteFrames82.bin":1360..1616
SpriteFrame5:
	db $03,$80
	dw $000C
	dw -7,18,-21,7
	dw $00C0,$00C0
	dw .tiles-SpriteFrame5
	db $11,$FA,$00,$00
	dw -7,-21,$0800 : db $FF
	dw -7,-5,$0802 : db $FF
	dw 9,-10,$0804 : db $FF
.tiles:
	incbin "../Extracted/data/SpriteFrames82.bin":1659..2043
SpriteFrame6:
	db $05,$80
	dw $000E
	dw -10,19,-25,3
	dw $0100,$00C0
	dw .tiles-SpriteFrame6
	db $0F,$F5,$00,$00
	dw -5,-25,$0800 : db $FF
	dw -10,-9,$0802 : db $FF
	dw 6,-9,$0804 : db $FF
	dw 11,-17,$0806 : db $00
	dw 19,-17,$0807 : db $00
.tiles:
	incbin "../Extracted/data/SpriteFrames82.bin":2100..2548
SpriteFrame7:
	db $03,$80
	dw $0009
	dw -6,17,-26,2
	dw $00A0,$0080
	dw .tiles-SpriteFrame7
	db $0D,$F6,$00,$00
	dw -6,-13,$0800 : db $FF
	dw -2,-29,$0802 : db $FF
	dw 10,-13,$0804 : db $00
.tiles:
	incbin "../Extracted/data/SpriteFrames82.bin":2591..2879
SpriteFrame8:
	db $03,$80
	dw $000C
	dw -8,16,-25,4
	dw $00C0,$00C0
	dw .tiles-SpriteFrame8
	db $10,$F8,$00,$00
	dw -8,-25,$0800 : db $FF
	dw -8,-9,$0802 : db $FF
	dw 8,-12,$0804 : db $FF
.tiles:
	incbin "../Extracted/data/SpriteFrames82.bin":2922..3306
SpriteFrame9:
	db $03,$80
	dw $0009
	dw -6,15,-24,4
	dw $00A0,$0080
	dw .tiles-SpriteFrame9
	db $10,$F9,$00,$00
	dw -6,-11,$0800 : db $FF
	dw -6,-27,$0802 : db $FF
	dw 10,-11,$0804 : db $00
.tiles:
	incbin "../Extracted/data/SpriteFrames82.bin":3349..3637
SpriteFrame10:
	db $04,$80
	dw $000A
	dw -2,21,-23,6
	dw $00C0,$0080
	dw .tiles-SpriteFrame10
	db $12,$00,$00,$00
	dw -1,-23,$0800 : db $FF
	dw -2,-7,$0802 : db $FF
	dw 14,-7,$0804 : db $00
	dw 14,1,$0805 : db $00
.tiles:
	incbin "../Extracted/data/SpriteFrames82.bin":3687..4007
SpriteFrame11:
	db $03,$80
	dw $000C
	dw -5,23,-23,5
	dw $00C0,$00C0
	dw .tiles-SpriteFrame11
	db $14,$03,$00,$00
	dw -1,-23,$0800 : db $FF
	dw -5,-7,$0802 : db $FF
	dw 11,-7,$0804 : db $FF
.tiles:
	incbin "../Extracted/data/SpriteFrames82.bin":4050..4434
