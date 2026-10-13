; Bank $8C, fourth 4 KB: SpriteFrames continued (see bank82_8000), tiles from data/gfx/SpriteFrames8C.bin.

org $8CB039
SpriteFrame785:
	db $03,$80
	dw $000C
	dw -14,27,-11,4
	dw $00C0,$00C0
	dw .tiles-SpriteFrame785
	db $17,$FB,$19,$F7
	dw -14,-11,$0800 : db $FF
	dw 2,-11,$0802 : db $FF
	dw 18,-11,$0804 : db $FF
.tiles:
	incbin "data/gfx/SpriteFrames8C.bin":12388..12772
SpriteFrame786:
	db $04,$80
	dw $000A
	dw -9,7,-26,1
	dw $00C0,$0080
	dw .tiles-SpriteFrame786
	db $00,$00,$01,$F1
	dw -9,-14,$0800 : db $FF
	dw -9,-30,$0802 : db $FF
	dw 7,-14,$0804 : db $00
	dw 7,-6,$0805 : db $00
.tiles:
	incbin "data/gfx/SpriteFrames8C.bin":12822..13142
SpriteFrame787:
	db $05,$80
	dw $000B
	dw -6,20,-17,5
	dw $00C0,$00A0
	dw .tiles-SpriteFrame787
	db $10,$FE,$13,$F2
	dw -6,-17,$0800 : db $FF
	dw 10,-17,$0802 : db $FF
	dw -6,-1,$0804 : db $00
	dw 2,-1,$0805 : db $00
	dw 10,-1,$0814 : db $00
.tiles:
	incbin "data/gfx/SpriteFrames8C.bin":13199..13551
SpriteFrame788:
	db $05,$80
	dw $000B
	dw -11,35,-10,6
	dw $00C0,$00A0
	dw .tiles-SpriteFrame788
	db $20,$02,$23,$FF
	dw -11,-10,$0800 : db $FF
	dw 5,-10,$0802 : db $FF
	dw 21,-2,$0804 : db $00
	dw 29,-2,$0805 : db $00
	dw 17,6,$0814 : db $00
.tiles:
	incbin "data/gfx/SpriteFrames8C.bin":13608..13960
SpriteFrame789:
	db $06,$80
	dw $000F
	dw -6,14,-45,1
	dw $0100,$00E0
	dw .tiles-SpriteFrame789
	db $00,$00,$00,$00
	dw 4,-45,$0800 : db $FF
	dw -4,-29,$0802 : db $FF
	dw -6,-13,$0804 : db $FF
	dw -4,-37,$0806 : db $00
	dw 12,-29,$0807 : db $00
	dw 12,-21,$0816 : db $00
.tiles:
	incbin "data/gfx/SpriteFrames8C.bin":14024..14504
SpriteFrame790:
	db $06,$80
	dw $000C
	dw -6,15,-45,1
	dw $00C0,$00C0
	dw .tiles-SpriteFrame790
	db $00,$00,$00,$00
	dw -6,-29,$0800 : db $FF
	dw -6,-13,$0802 : db $FF
	dw 10,-45,$0804 : db $00
	dw 10,-37,$0805 : db $00
	dw 10,-29,$0814 : db $00
	dw 10,-21,$0815 : db $00
.tiles:
	incbin "data/gfx/SpriteFrames8C.bin":14568..14952
SpriteFrame791:
	db $07,$80
	dw $000D
	dw -8,14,-36,1
	dw $00E0,$00C0
	dw .tiles-SpriteFrame791
	db $00,$00,$00,$00
	dw -3,-36,$0800 : db $FF
	dw -8,-20,$0802 : db $FF
	dw 13,-36,$0804 : db $00
	dw 13,-28,$0805 : db $00
	dw 8,-20,$0814 : db $00
	dw -6,-4,$0815 : db $00
	dw 2,-4,$0806 : db $00
.tiles:
	incbin "data/gfx/SpriteFrames8C.bin":15023..15439
SpriteFrame792:
	db $05,$80
	dw $000B
	dw -6,12,-36,2
	dw $00C0,$00A0
	dw .tiles-SpriteFrame792
	db $00,$01,$00,$00
	dw -3,-36,$0800 : db $FF
	dw -6,-20,$0802 : db $FF
	dw 10,-20,$0804 : db $00
	dw -6,-4,$0805 : db $00
	dw 2,-4,$0814 : db $00
.tiles:
	incbin "data/gfx/SpriteFrames8C.bin":15496..15848
SpriteFrame793:
	db $06,$80
	dw $000C
	dw -11,11,-45,0
	dw $00C0,$00C0
	dw .tiles-SpriteFrame793
	db $00,$00,$00,$00
	dw -8,-29,$0800 : db $FF
	dw -11,-13,$0802 : db $FF
	dw 4,-45,$0804 : db $00
	dw 4,-37,$0805 : db $00
	dw 8,-29,$0814 : db $00
	dw 8,-21,$0815 : db $00
.tiles:
	incbin "data/gfx/SpriteFrames8C.bin":15912..16296
SpriteFrame794:
	db $06,$80
	dw $000C
	dw -12,10,-46,2
	dw $00C0,$00C0
	dw .tiles-SpriteFrame794
	db $00,$00,$00,$00
	dw -12,-27,$0800 : db $FF
	dw -12,-11,$0802 : db $FF
	dw 4,-46,$0804 : db $00
	dw 4,-38,$0805 : db $00
	dw 4,-30,$0814 : db $00
	dw 4,-22,$0815 : db $00
.tiles:
	incbin "data/gfx/SpriteFrames8C.bin":16360..16744
