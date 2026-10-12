; Bank $82, fourth 4 KB: SpriteFrames continued (see bank82_8000), tiles from Extracted/data/SpriteFrames82.bin.

org $82B04A
SpriteFrame22:
	db $04,$80
	dw $000A
	dw -7,6,-23,17
	dw $00C0,$0080
	dw .tiles-SpriteFrame22
	db $FF,$0E,$00,$00
	dw -7,-23,$0800 : db $FF
	dw -7,-7,$0802 : db $FF
	dw 0,9,$0804 : db $00
	dw 0,17,$0805 : db $00
.tiles:
	incbin "../Extracted/data/SpriteFrames82.bin":8508..8828
SpriteFrame23:
	db $04,$80
	dw $000A
	dw -8,7,-24,19
	dw $00C0,$0080
	dw .tiles-SpriteFrame23
	db $04,$0E,$00,$00
	dw -6,-24,$0800 : db $FF
	dw -8,-8,$0802 : db $FF
	dw 0,8,$0804 : db $00
	dw 0,16,$0805 : db $00
.tiles:
	incbin "../Extracted/data/SpriteFrames82.bin":8878..9198
SpriteFrame24:
	db $03,$80
	dw $0009
	dw -6,5,-23,16
	dw $00A0,$0080
	dw .tiles-SpriteFrame24
	db $00,$0E,$00,$00
	dw -6,-23,$0800 : db $FF
	dw -5,-7,$0802 : db $FF
	dw -3,9,$0804 : db $00
.tiles:
	incbin "../Extracted/data/SpriteFrames82.bin":9241..9529
SpriteFrame25:
	db $03,$80
	dw $0009
	dw -12,8,-24,8
	dw $00A0,$0080
	dw .tiles-SpriteFrame25
	db $F5,$03,$00,$00
	dw -7,-24,$0800 : db $FF
	dw -7,-8,$0802 : db $FF
	dw -15,4,$0804 : db $00
.tiles:
	incbin "../Extracted/data/SpriteFrames82.bin":9572..9860
SpriteFrame26:
	db $03,$80
	dw $000C
	dw -14,14,-22,9
	dw $00C0,$00C0
	dw .tiles-SpriteFrame26
	db $F3,$05,$00,$00
	dw -5,-22,$0800 : db $FF
	dw -14,-6,$0802 : db $FF
	dw 2,-6,$0804 : db $FF
.tiles:
	incbin "../Extracted/data/SpriteFrames82.bin":9903..10287
SpriteFrame27:
	db $04,$80
	dw $000A
	dw -12,11,-24,9
	dw $00C0,$0080
	dw .tiles-SpriteFrame27
	db $F5,$06,$00,$00
	dw -4,-24,$0800 : db $FF
	dw -4,-8,$0802 : db $FF
	dw -12,0,$0804 : db $00
	dw -12,8,$0805 : db $00
.tiles:
	incbin "../Extracted/data/SpriteFrames82.bin":10337..10657
SpriteFrame28:
	db $03,$80
	dw $000C
	dw -14,10,-23,9
	dw $00C0,$00C0
	dw .tiles-SpriteFrame28
	db $F3,$04,$00,$00
	dw -5,-23,$0800 : db $FF
	dw -5,-7,$0802 : db $FF
	dw -21,-2,$0804 : db $FF
.tiles:
	incbin "../Extracted/data/SpriteFrames82.bin":10700..11084
SpriteFrame29:
	db $04,$80
	dw $000A
	dw -13,9,-23,8
	dw $00C0,$0080
	dw .tiles-SpriteFrame29
	db $F7,$08,$00,$00
	dw -4,-23,$0800 : db $FF
	dw -13,-7,$0802 : db $FF
	dw 3,-7,$0804 : db $00
	dw 3,1,$0805 : db $00
.tiles:
	incbin "../Extracted/data/SpriteFrames82.bin":11134..11454
SpriteFrame30:
	db $04,$80
	dw $000A
	dw -16,6,-23,8
	dw $00C0,$0080
	dw .tiles-SpriteFrame30
	db $F2,$04,$00,$00
	dw -8,-23,$0800 : db $FF
	dw -16,-7,$0802 : db $FF
	dw 0,-7,$0804 : db $00
	dw 0,1,$0805 : db $00
.tiles:
	incbin "../Extracted/data/SpriteFrames82.bin":11504..11824
SpriteFrame31:
	db $03,$80
	dw $000C
	dw -20,11,-26,4
	dw $00C0,$00C0
	dw .tiles-SpriteFrame31
	db $EF,$02,$00,$00
	dw -7,-26,$0800 : db $FF
	dw -20,-10,$0802 : db $FF
	dw -4,-10,$0804 : db $FF
.tiles:
	incbin "../Extracted/data/SpriteFrames82.bin":11867..12251
SpriteFrame32:
	db $03,$80
	dw $000C
	dw -17,7,-25,4
	dw $00C0,$00C0
	dw .tiles-SpriteFrame32
	db $F0,$03,$00,$00
	dw -7,-25,$0800 : db $FF
	dw -17,-9,$0802 : db $FF
	dw -1,-9,$0804 : db $FF
.tiles:
	incbin "../Extracted/data/SpriteFrames82.bin":12294..12678
