; Bank $8D, first 4 KB: SpriteFrames continued (see bank82_8000), tiles from data/gfx/SpriteFrames8D.bin.

org $8D8000
SpriteFrame831:
	db $07,$80
	dw $0010
	dw -6,22,-30,5
	dw $0100,$0100
	dw .tiles-SpriteFrame831
	db $16,$03,$00,$00
	dw -6,-30,$0800 : db $FF
	dw 10,-30,$0802 : db $FF
	dw -6,-14,$0804 : db $FF
	dw 10,-14,$0806 : db $00
	dw -6,2,$0807 : db $00
	dw 2,2,$0816 : db $00
	dw 10,2,$0817 : db $00
.tiles:
	incbin "data/gfx/SpriteFrames8D.bin":71..583
SpriteFrame832:
	db $04,$80
	dw $000D
	dw -9,26,-20,5
	dw $00E0,$00C0
	dw .tiles-SpriteFrame832
	db $17,$04,$00,$00
	dw -7,-10,$0800 : db $FF
	dw 9,-10,$0802 : db $FF
	dw -9,-26,$0804 : db $FF
	dw 25,-2,$0806 : db $00
.tiles:
	incbin "data/gfx/SpriteFrames8D.bin":633..1049
SpriteFrame833:
	db $06,$80
	dw $000C
	dw -10,36,-12,9
	dw $00C0,$00C0
	dw .tiles-SpriteFrame833
	db $21,$06,$00,$00
	dw -10,-6,$0800 : db $FF
	dw 6,-6,$0802 : db $FF
	dw 22,2,$0804 : db $00
	dw 30,2,$0805 : db $00
	dw -7,-14,$0814 : db $00
	dw 1,-14,$0815 : db $00
.tiles:
	incbin "data/gfx/SpriteFrames8D.bin":1113..1497
SpriteFrame834:
	db $06,$80
	dw $000C
	dw -11,37,-5,12
	dw $00C0,$00C0
	dw .tiles-SpriteFrame834
	db $20,$0B,$00,$00
	dw -11,-3,$0800 : db $FF
	dw 5,-3,$0802 : db $FF
	dw 21,5,$0804 : db $00
	dw 29,5,$0805 : db $00
	dw 37,5,$0814 : db $00
	dw 1,-11,$0815 : db $00
.tiles:
	incbin "data/gfx/SpriteFrames8D.bin":1561..1945
SpriteFrame835:
	db $04,$80
	dw $000D
	dw -8,26,-30,2
	dw $00E0,$00C0
	dw .tiles-SpriteFrame835
	db $1B,$01,$00,$00
	dw -1,-30,$0800 : db $FF
	dw 15,-30,$0802 : db $FF
	dw -8,-14,$0804 : db $FF
	dw 0,2,$0806 : db $00
.tiles:
	incbin "data/gfx/SpriteFrames8D.bin":1995..2411
SpriteFrame836:
	db $05,$80
	dw $000E
	dw -10,24,-24,6
	dw $0100,$00C0
	dw .tiles-SpriteFrame836
	db $16,$01,$00,$00
	dw 0,-24,$0800 : db $FF
	dw 16,-24,$0802 : db $FF
	dw -10,-8,$0804 : db $FF
	dw 6,-8,$0806 : db $00
	dw 6,0,$0807 : db $00
.tiles:
	incbin "data/gfx/SpriteFrames8D.bin":2468..2916
SpriteFrame837:
	db $07,$80
	dw $000D
	dw -15,26,-22,8
	dw $00E0,$00C0
	dw .tiles-SpriteFrame837
	db $18,$06,$00,$02
	dw -15,-6,$0800 : db $FF
	dw 1,-6,$0802 : db $FF
	dw 6,-14,$0804 : db $00
	dw 22,-22,$0805 : db $00
	dw 22,-14,$0814 : db $00
	dw 17,-6,$0815 : db $00
	dw 17,2,$0806 : db $00
.tiles:
	incbin "data/gfx/SpriteFrames8D.bin":2987..3403
SpriteFrame838:
	db $04,$80
	dw $000D
	dw -15,38,-1,14
	dw $00E0,$00C0
	dw .tiles-SpriteFrame838
	db $28,$0A,$FF,$02
	dw -15,-1,$0800 : db $FF
	dw 1,-1,$0802 : db $FF
	dw 17,-1,$0804 : db $FF
	dw 33,7,$0806 : db $00
.tiles:
	incbin "data/gfx/SpriteFrames8D.bin":3453..3869
SpriteFrame839:
	db $06,$80
	dw $000F
	dw -9,21,-30,5
	dw $0100,$00E0
	dw .tiles-SpriteFrame839
	db $14,$04,$00,$00
	dw -9,-30,$0800 : db $FF
	dw -9,-14,$0802 : db $FF
	dw 7,-28,$0804 : db $FF
	dw -9,2,$0806 : db $00
	dw -1,2,$0807 : db $00
	dw 7,1,$0816 : db $00
.tiles:
	incbin "data/gfx/SpriteFrames8D.bin":3933..4413
