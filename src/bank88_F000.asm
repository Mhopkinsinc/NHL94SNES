; Bank $88, last 4 KB: the last SpriteFrames frames of the bank (see bank82_8000), tiles from
; data/gfx/SpriteFrames88.bin. Then the centre ice logo map of the two all-star teams (the NHL shield): the rink
; loader pastes it into the rink map (see bank82_F000).

org $88F096
SpriteFrame532:
	db $05,$80
	dw $000E
	dw -24,5,-26,2
	dw $0100,$00C0
	dw .tiles-SpriteFrame532
	db $EB,$FF,$00,$00
	dw -24,-26,$0800 : db $FF
	dw -8,-26,$0802 : db $FF
	dw -13,-10,$0804 : db $FF
	dw 3,-10,$0806 : db $00
	dw 3,-2,$0807 : db $00
.tiles:
	incbin "data/gfx/SpriteFrames88.bin":28879..29327
SpriteFrame533:
	db $04,$80
	dw $000D
	dw -11,14,-24,3
	dw $00E0,$00C0
	dw .tiles-SpriteFrame533
	db $01,$FB,$01,$FB
	dw -11,-24,$0800 : db $FF
	dw 5,-24,$0802 : db $FF
	dw -7,-8,$0804 : db $FF
	dw 9,0,$0806 : db $00
.tiles:
	incbin "data/gfx/SpriteFrames88.bin":29377..29793
SpriteFrame534:
	db $06,$80
	dw $000C
	dw -12,17,-22,3
	dw $00C0,$00C0
	dw .tiles-SpriteFrame534
	db $06,$01,$0C,$F0
	dw -7,-22,$0800 : db $FF
	dw -12,-6,$0802 : db $FF
	dw 9,-22,$0804 : db $00
	dw 17,-22,$0805 : db $00
	dw 4,-6,$0814 : db $00
	dw 4,2,$0815 : db $00
.tiles:
	incbin "data/gfx/SpriteFrames88.bin":29857..30241
SpriteFrame535:
	db $04,$80
	dw $0010
	dw -14,16,-25,3
	dw $0100,$0100
	dw .tiles-SpriteFrame535
	db $F8,$FB,$F2,$EB
	dw -13,-25,$0800 : db $FF
	dw 3,-25,$0802 : db $FF
	dw -14,-9,$0804 : db $FF
	dw 2,-9,$0806 : db $FF
.tiles:
	incbin "data/gfx/SpriteFrames88.bin":30291..30803
SpriteFrame536:
	db $03,$80
	dw $0009
	dw -6,14,-27,4
	dw $00A0,$0080
	dw .tiles-SpriteFrame536
	db $05,$FD,$05,$FD
	dw -4,-27,$0800 : db $FF
	dw -6,-11,$0802 : db $FF
	dw 12,-19,$0804 : db $00
.tiles:
	incbin "data/gfx/SpriteFrames88.bin":30846..31134
SpriteFrame537:
	db $04,$80
	dw $000A
	dw -8,13,-22,4
	dw $00C0,$0080
	dw .tiles-SpriteFrame537
	db $08,$03,$0B,$F3
	dw -2,-22,$0800 : db $FF
	dw -2,-6,$0802 : db $FF
	dw -10,-15,$0804 : db $00
	dw -10,-7,$0805 : db $00
.tiles:
	incbin "data/gfx/SpriteFrames88.bin":31184..31504
SpriteFrame538:
	db $05,$80
	dw $000E
	dw -10,16,-24,6
	dw $0100,$00C0
	dw .tiles-SpriteFrame538
	db $FC,$F7,$FF,$EB
	dw -10,-24,$0800 : db $FF
	dw 6,-24,$0802 : db $FF
	dw -10,-8,$0804 : db $FF
	dw 6,-8,$0806 : db $00
	dw 6,0,$0807 : db $00
.tiles:
	incbin "data/gfx/SpriteFrames88.bin":31561..32009
SpriteFrame539:
	db $04,$80
	dw $000A
	dw -9,8,-23,4
	dw $00C0,$0080
	dw .tiles-SpriteFrame539
	db $08,$FE,$08,$FE
	dw -8,-23,$0800 : db $FF
	dw -9,-7,$0802 : db $FF
	dw 7,-7,$0804 : db $00
	dw 7,1,$0805 : db $00
.tiles:
	incbin "data/gfx/SpriteFrames88.bin":32059..32379
SpriteFrame540:
	db $03,$80
	dw $0009
	dw -11,9,-18,7
	dw $00A0,$0080
	dw .tiles-SpriteFrame540
	db $00,$07,$FC,$FA
	dw -11,-18,$0800 : db $FF
	dw -6,-2,$0802 : db $FF
	dw 5,-10,$0804 : db $00
.tiles:
	incbin "data/gfx/SpriteFrames88.bin":32422..32710
CenterIceMapNHL:	; width, height and a word, then the map words, one row per line
	dw $0006,$0004,$0308
	dw $0401,$0402,$0403,$0404,$0405,$0406
	dw $0407,$0408,$0409,$040A,$040B,$040C
	dw $040D,$040E,$040F,$0410,$0411,$0412
	dw $0000,$0413,$0414,$0415,$0416,$0000
	db $FF,$FF,$FF,$FF
