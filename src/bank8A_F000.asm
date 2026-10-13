; Bank $8A, last 4 KB: the last SpriteFrames frames of the bank (see bank82_8000), tiles from
; data/gfx/SpriteFrames8A.bin, then a byte map and $FF fill.

org $8AF011
SpriteFrame675:
	db $05,$80
	dw $000E
	dw -20,8,-23,7
	dw $0100,$00C0
	dw .tiles-SpriteFrame675
	db $F9,$F7,$00,$F0
	dw -20,-23,$0800 : db $FF
	dw -4,-23,$0802 : db $FF
	dw -15,-7,$0804 : db $FF
	dw 1,-7,$0806 : db $00
	dw 1,1,$0807 : db $00
.tiles:
	incbin "data/gfx/SpriteFrames8A.bin":28746..29194
SpriteFrame676:
	db $05,$80
	dw $0011
	dw -31,6,-25,5
	dw $0120,$0100
	dw .tiles-SpriteFrame676
	db $F2,$EF,$FA,$EA
	dw -31,-25,$0800 : db $FF
	dw -15,-25,$0802 : db $FF
	dw -23,-9,$0804 : db $FF
	dw -7,-9,$0806 : db $FF
	dw 1,-17,$0808 : db $00
.tiles:
	incbin "data/gfx/SpriteFrames8A.bin":29251..29795
SpriteFrame677:
	db $04,$80
	dw $000A
	dw -12,10,-23,1
	dw $00C0,$0080
	dw .tiles-SpriteFrame677
	db $FE,$F7,$00,$F5
	dw -12,-14,$0800 : db $FF
	dw -6,-30,$0802 : db $FF
	dw 4,-14,$0804 : db $00
	dw 4,-6,$0805 : db $00
.tiles:
	incbin "data/gfx/SpriteFrames8A.bin":29845..30165
SpriteFrame678:
	db $02,$80
	dw $0008
	dw -11,7,-22,2
	dw $0080,$0080
	dw .tiles-SpriteFrame678
	db $FF,$F5,$01,$F4
	dw -11,-22,$0800 : db $FF
	dw -8,-6,$0802 : db $FF
.tiles:
	incbin "data/gfx/SpriteFrames8A.bin":30201..30457
SpriteFrame679:
	db $04,$80
	dw $000A
	dw -8,15,-24,1
	dw $00C0,$0080
	dw .tiles-SpriteFrame679
	db $0D,$FB,$0F,$F9
	dw -8,-24,$0800 : db $FF
	dw -8,-8,$0802 : db $FF
	dw 8,-16,$0804 : db $00
	dw 8,-8,$0805 : db $00
.tiles:
	incbin "data/gfx/SpriteFrames8A.bin":30507..30827
SpriteFrame680:
	db $05,$80
	dw $000E
	dw -7,22,-24,1
	dw $0100,$00C0
	dw .tiles-SpriteFrame680
	db $14,$FA,$16,$F8
	dw -7,-24,$0800 : db $FF
	dw 9,-24,$0802 : db $FF
	dw -6,-8,$0804 : db $FF
	dw 10,-8,$0806 : db $00
	dw 18,-8,$0807 : db $00
.tiles:
	incbin "data/gfx/SpriteFrames8A.bin":30884..31332
SpriteFrame681:
	db $03,$80
	dw $000C
	dw -4,26,-24,2
	dw $00C0,$00C0
	dw .tiles-SpriteFrame681
	db $18,$00,$1A,$FE
	dw -2,-24,$0800 : db $FF
	dw -4,-8,$0802 : db $FF
	dw 12,-8,$0804 : db $FF
.tiles:
	incbin "data/gfx/SpriteFrames8A.bin":31375..31759
SpriteFrame682:
	db $05,$80
	dw $000E
	dw -5,39,-23,2
	dw $0100,$00C0
	dw .tiles-SpriteFrame682
	db $23,$02,$26,$00
	dw -5,-13,$0800 : db $FF
	dw 11,-13,$0802 : db $FF
	dw -5,-29,$0804 : db $FF
	dw 27,-5,$0806 : db $00
	dw 35,-5,$0807 : db $00
.tiles:
	incbin "data/gfx/SpriteFrames8A.bin":31816..32264
SpriteFrame683:
	db $04,$80
	dw $000A
	dw -9,15,-22,6
	dw $00C0,$0080
	dw .tiles-SpriteFrame683
	db $0B,$06,$0D,$04
	dw -7,-22,$0800 : db $FF
	dw -9,-6,$0802 : db $FF
	dw 7,2,$0804 : db $00
	dw 15,2,$0805 : db $00
.tiles:
	incbin "data/gfx/SpriteFrames8A.bin":32314..32634
DATA8_8AFF7A:		; three words (10, 12, 16), then a 10 x 12 byte map, one row per line; a screen setup in bank $9D
			;   reads it (as it unpacks the same kind of map from bank $87); not identified yet
	dw 10,12,16
	db $00,$01,$02,$03,$04,$05,$06,$07,$08,$00
	db $0D,$0E,$0F,$10,$11,$12,$13,$14,$15,$00
	db $1B,$1C,$1D,$1E,$1F,$20,$21,$21,$22,$23
	db $28,$29,$2A,$2B,$2C,$2D,$2E,$21,$2F,$30
	db $35,$36,$37,$38,$39,$3A,$3B,$3C,$3D,$3E
	db $43,$44,$45,$46,$47,$48,$49,$4A,$4B,$4C
	db $51,$21,$52,$53,$54,$55,$49,$56,$21,$57
	db $5D,$21,$21,$21,$5E,$5F,$60,$56,$21,$61
	db $69,$6A,$21,$21,$21,$6B,$6C,$6D,$6E,$6F
	db $78,$79,$7A,$21,$21,$21,$21,$7B,$7C,$7D
	db $00,$00,$87,$88,$89,$8A,$8B,$8C,$8D,$8E
	db $00,$00,$00,$00,$8F,$90,$00,$00,$00,$00
	db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
