; Bank $8D, seventh 4 KB: SpriteFrames continued (see bank82_8000), tiles from data/gfx/SpriteFrames8D.bin.

org $8DE01A
SpriteFrame881:
	db $05,$80
	dw $000E
	dw -2,32,-28,3
	dw $0100,$00C0
	dw .tiles-SpriteFrame881
	db $00,$00,$00,$00
	dw 19,-28,$0800 : db $FF
	dw -2,-12,$0802 : db $FF
	dw 14,-12,$0804 : db $FF
	dw 3,-20,$0806 : db $00
	dw 11,-20,$0807 : db $00
.tiles:
	incbin "data/gfx/SpriteFrames8D.bin":24659..25107
SpriteFrame882:
	db $04,$80
	dw $000D
	dw -4,37,-14,3
	dw $00E0,$00C0
	dw .tiles-SpriteFrame882
	db $00,$00,$00,$00
	dw -4,-14,$0800 : db $FF
	dw 12,-14,$0802 : db $FF
	dw 28,-14,$0804 : db $FF
	dw 11,2,$0806 : db $00
.tiles:
	incbin "data/gfx/SpriteFrames8D.bin":25157..25573
SpriteFrame883:
	db $04,$80
	dw $000A
	dw -18,-1,-21,16
	dw $00C0,$0080
	dw .tiles-SpriteFrame883
	db $FB,$04,$00,$06
	dw -18,-21,$0800 : db $FF
	dw -16,-5,$0802 : db $FF
	dw -2,-13,$0804 : db $00
	dw -10,11,$0805 : db $00
.tiles:
	incbin "data/gfx/SpriteFrames8D.bin":25623..25943
SpriteFrame884:
	db $04,$80
	dw $000A
	dw -4,15,-33,1
	dw $00C0,$0080
	dw .tiles-SpriteFrame884
	db $00,$00,$FD,$00
	dw -3,-14,$0800 : db $FF
	dw -4,-30,$0802 : db $FF
	dw 12,-22,$0804 : db $00
	dw 4,-38,$0805 : db $00
.tiles:
	incbin "data/gfx/SpriteFrames8D.bin":25993..26313
SpriteFrame885:
	db $05,$80
	dw $0008
	dw 1,21,-18,4
	dw $0080,$0080
	dw .tiles-SpriteFrame885
	db $00,$FF,$FC,$01
	dw 1,-18,$0800 : db $FF
	dw 17,-18,$0802 : db $00
	dw 17,-10,$0803 : db $00
	dw 3,-2,$0812 : db $00
	dw 11,-2,$0813 : db $00
.tiles:
	incbin "data/gfx/SpriteFrames8D.bin":26370..26626
SpriteFrame886:
	db $05,$80
	dw $000E
	dw -3,28,-17,20
	dw $0100,$00C0
	dw .tiles-SpriteFrame886
	db $00,$00,$FA,$FF
	dw -3,5,$0800 : db $FF
	dw 13,5,$0802 : db $FF
	dw 6,-11,$0804 : db $FF
	dw 22,-11,$0806 : db $00
	dw 2,-19,$0807 : db $00
.tiles:
	incbin "data/gfx/SpriteFrames8D.bin":26683..27131
SpriteFrame887:
	db $06,$80
	dw $000C
	dw -9,10,-35,2
	dw $00C0,$00C0
	dw .tiles-SpriteFrame887
	db $02,$00,$01,$01
	dw -8,-35,$0800 : db $FF
	dw -9,-19,$0802 : db $FF
	dw 7,-19,$0804 : db $00
	dw 7,-11,$0805 : db $00
	dw -7,-3,$0814 : db $00
	dw 1,-3,$0815 : db $00
.tiles:
	incbin "data/gfx/SpriteFrames8D.bin":27195..27579
SpriteFrame888:
	db $04,$80
	dw $000A
	dw -5,17,-24,1
	dw $00C0,$0080
	dw .tiles-SpriteFrame888
	db $0D,$00,$04,$FF
	dw -5,-14,$0800 : db $FF
	dw -5,-30,$0802 : db $FF
	dw 11,-14,$0804 : db $00
	dw 11,-6,$0805 : db $00
.tiles:
	incbin "data/gfx/SpriteFrames8D.bin":27629..27949
SpriteFrame889:
	db $04,$80
	dw $0007
	dw 0,28,-13,6
	dw $0080,$0060
	dw .tiles-SpriteFrame889
	db $18,$06,$08,$FE
	dw 0,-13,$0800 : db $FF
	dw 6,3,$0802 : db $00
	dw 14,3,$0803 : db $00
	dw 22,3,$0812 : db $00
.tiles:
	incbin "data/gfx/SpriteFrames8D.bin":27999..28223
SpriteFrame890:
	db $04,$80
	dw $0010
	dw 0,30,-14,16
	dw $0100,$0100
	dw .tiles-SpriteFrame890
	db $1A,$10,$05,$00
	dw 1,-14,$0800 : db $FF
	dw 17,-14,$0802 : db $FF
	dw 0,2,$0804 : db $FF
	dw 16,2,$0806 : db $FF
.tiles:
	incbin "data/gfx/SpriteFrames8D.bin":28273..28785
