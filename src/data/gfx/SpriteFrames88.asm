; More frames of SpriteFrames. A frame is the piece count, flags (bit 7: 16x16 tiles), tile
; count, four words not traced, the two transfer sizes, the tile offset, four bytes not
; traced, the pieces, then the tiles.

SpriteFrame468:
	db $05,$80
	dw $0011
	dw -28,15,-25,4
	dw $0120,$0100
	dw .tiles-SpriteFrame468
	db $E6,$00,$03,$04
	dw -28,-25,$0800 : db $FF
	dw -12,-25,$0802 : db $FF
	dw 4,-25,$0804 : db $FF
	dw -9,-9,$0806 : db $FF
	dw 7,-1,$0808 : db $00
.tiles:
	incbin "SpriteFrames88.bin":57..601
SpriteFrame469:
	db $05,$80
	dw $0011
	dw -19,13,-30,4
	dw $0120,$0100
	dw .tiles-SpriteFrame469
	db $EF,$FE,$06,$02
	dw -18,-30,$0800 : db $FF
	dw -2,-30,$0802 : db $FF
	dw -19,-14,$0804 : db $FF
	dw -3,-14,$0806 : db $FF
	dw 6,2,$0808 : db $00
.tiles:
	incbin "SpriteFrames88.bin":658..1202
SpriteFrame470:
	db $05,$80
	dw $000E
	dw -13,8,-37,7
	dw $0100,$00C0
	dw .tiles-SpriteFrame470
	db $FD,$08,$05,$04
	dw -7,-8,$0800 : db $FF
	dw -13,-24,$0802 : db $FF
	dw -12,-40,$0804 : db $FF
	dw 3,-24,$0806 : db $00
	dw 3,-16,$0807 : db $00
.tiles:
	incbin "SpriteFrames88.bin":1259..1707
SpriteFrame471:
	db $07,$80
	dw $0010
	dw -27,12,-27,2
	dw $0100,$0100
	dw .tiles-SpriteFrame471
	db $E7,$FE,$03,$04
	dw -5,-13,$0800 : db $FF
	dw -27,-29,$0802 : db $FF
	dw -11,-29,$0804 : db $FF
	dw -23,-5,$0806 : db $00
	dw -15,-5,$0807 : db $00
	dw 11,-13,$0816 : db $00
	dw 11,-5,$0817 : db $00
.tiles:
	incbin "SpriteFrames88.bin":1778..2290
SpriteFrame472:
	db $05,$80
	dw $0011
	dw -12,14,-41,4
	dw $0120,$0100
	dw .tiles-SpriteFrame472
	db $F5,$FC,$06,$06
	dw -12,-41,$0800 : db $FF
	dw -10,-25,$0802 : db $FF
	dw 6,-25,$0804 : db $FF
	dw -11,-9,$0806 : db $FF
	dw 5,-1,$0808 : db $00
.tiles:
	incbin "SpriteFrames88.bin":2347..2891
SpriteFrame473:
	db $0A,$80
	dw $0013
	dw -28,15,-27,7
	dw $0140,$0120
	dw .tiles-SpriteFrame473
	db $E7,$04,$05,$06
	dw -28,-26,$0800 : db $FF
	dw -12,-27,$0802 : db $FF
	dw -12,-11,$0804 : db $FF
	dw -28,1,$0806 : db $00
	dw -20,1,$0807 : db $00
	dw -12,5,$0816 : db $00
	dw -4,5,$0817 : db $00
	dw 4,-21,$0808 : db $00
	dw 12,-21,$0809 : db $00
	dw 4,0,$0818 : db $00
.tiles:
	incbin "SpriteFrames88.bin":2983..3591
SpriteFrame474:
	db $04,$80
	dw $0010
	dw -26,7,-25,5
	dw $0100,$0100
	dw .tiles-SpriteFrame474
	db $E7,$FD,$FF,$07
	dw -26,-25,$0800 : db $FF
	dw -10,-25,$0802 : db $FF
	dw -24,-9,$0804 : db $FF
	dw -8,-9,$0806 : db $FF
.tiles:
	incbin "SpriteFrames88.bin":3641..4153

SpriteFrame475:
	db $08,$80
	dw $000E
	dw -18,6,-30,4
	dw $0100,$00C0
	dw .tiles-SpriteFrame475
	db $F1,$FE,$06,$07
	dw -16,-30,$0800 : db $FF
	dw -18,-14,$0802 : db $FF
	dw 0,-30,$0804 : db $00
	dw 0,-22,$0805 : db $00
	dw -2,-14,$0814 : db $00
	dw -2,-6,$0815 : db $00
	dw -9,2,$0806 : db $00
	dw -1,2,$0807 : db $00
.tiles:
	incbin "SpriteFrames88.bin":4231..4679
SpriteFrame476:
	db $0A,$80
	dw $0010
	dw -25,8,-30,5
	dw $0100,$0100
	dw .tiles-SpriteFrame476
	db $E9,$FE,$05,$07
	dw -9,-30,$0800 : db $FF
	dw -7,-14,$0802 : db $FF
	dw -25,-22,$0804 : db $00
	dw -17,-22,$0805 : db $00
	dw 7,-30,$0814 : db $00
	dw 7,-22,$0815 : db $00
	dw -23,-6,$0806 : db $00
	dw -15,-6,$0807 : db $00
	dw -12,2,$0816 : db $00
	dw -4,2,$0817 : db $00
.tiles:
	incbin "SpriteFrames88.bin":4771..5283
SpriteFrame477:
	db $06,$80
	dw $000C
	dw -14,9,-30,6
	dw $00C0,$00C0
	dw .tiles-SpriteFrame477
	db $F6,$F1,$05,$06
	dw -7,-9,$0800 : db $FF
	dw -14,-25,$0802 : db $FF
	dw 2,-25,$0804 : db $00
	dw 2,-17,$0805 : db $00
	dw -13,-33,$0814 : db $00
	dw -5,-33,$0815 : db $00
.tiles:
	incbin "SpriteFrames88.bin":5347..5731
SpriteFrame478:
	db $06,$80
	dw $000C
	dw -9,14,-32,7
	dw $00C0,$00C0
	dw .tiles-SpriteFrame478
	db $06,$F3,$03,$04
	dw -5,-8,$0800 : db $FF
	dw -9,-24,$0802 : db $FF
	dw 7,-24,$0804 : db $00
	dw 7,-16,$0805 : db $00
	dw 1,-32,$0814 : db $00
	dw 9,-32,$0815 : db $00
.tiles:
	incbin "SpriteFrames88.bin":5795..6179
SpriteFrame479:
	db $05,$80
	dw $000E
	dw -9,14,-41,2
	dw $0100,$00C0
	dw .tiles-SpriteFrame479
	db $08,$F6,$04,$03
	dw 4,-41,$0800 : db $FF
	dw -7,-25,$0802 : db $FF
	dw -9,-9,$0804 : db $FF
	dw 9,-25,$0806 : db $00
	dw 7,-9,$0807 : db $00
.tiles:
	incbin "SpriteFrames88.bin":6236..6684
SpriteFrame480:
	db $03,$80
	dw $0009
	dw -6,7,-29,5
	dw $00A0,$0080
	dw .tiles-SpriteFrame480
	db $00,$E9,$05,$07
	dw -6,-29,$0800 : db $FF
	dw -6,-13,$0802 : db $FF
	dw 0,3,$0804 : db $00
.tiles:
	incbin "SpriteFrames88.bin":6727..7015
SpriteFrame481:
	db $04,$80
	dw $000A
	dw -11,10,-28,5
	dw $00C0,$0080
	dw .tiles-SpriteFrame481
	db $09,$E8,$05,$06
	dw -5,-28,$0800 : db $FF
	dw -5,-12,$0802 : db $FF
	dw -13,-6,$0804 : db $00
	dw -13,2,$0805 : db $00
.tiles:
	incbin "SpriteFrames88.bin":7065..7385
SpriteFrame482:
	db $03,$80
	dw $000C
	dw -8,19,-24,5
	dw $00C0,$00C0
	dw .tiles-SpriteFrame482
	db $12,$FD,$06,$07
	dw -8,-24,$0800 : db $FF
	dw -8,-8,$0802 : db $FF
	dw 8,-14,$0804 : db $FF
.tiles:
	incbin "SpriteFrames88.bin":7428..7812
SpriteFrame483:
	db $03,$80
	dw $0009
	dw -9,9,-23,6
	dw $00A0,$0080
	dw .tiles-SpriteFrame483
	db $08,$FB,$03,$08
	dw -9,-23,$0800 : db $FF
	dw -8,-7,$0802 : db $FF
	dw 7,-15,$0804 : db $00
.tiles:
	incbin "SpriteFrames88.bin":7855..8143
SpriteFrame484:
	db $03,$80
	dw $000C
	dw -9,20,-25,5
	dw $00C0,$00C0
	dw .tiles-SpriteFrame484
	db $13,$00,$03,$06
	dw -9,-25,$0800 : db $FF
	dw -9,-9,$0802 : db $FF
	dw 7,-12,$0804 : db $FF
.tiles:
	incbin "SpriteFrames88.bin":8186..8570

SpriteFrame485:
	db $05,$80
	dw $000E
	dw -12,22,-23,6
	dw $0100,$00C0
	dw .tiles-SpriteFrame485
	db $15,$FE,$03,$08
	dw -8,-23,$0800 : db $FF
	dw -12,-7,$0802 : db $FF
	dw 4,-7,$0804 : db $FF
	dw 8,-15,$0806 : db $00
	dw 16,-15,$0807 : db $00
.tiles:
	incbin "SpriteFrames88.bin":8627..9075
SpriteFrame486:
	db $03,$80
	dw $000C
	dw -9,22,-26,4
	dw $00C0,$00C0
	dw .tiles-SpriteFrame486
	db $15,$05,$03,$04
	dw -6,-26,$0800 : db $FF
	dw -9,-10,$0802 : db $FF
	dw 7,-10,$0804 : db $FF
.tiles:
	incbin "SpriteFrames88.bin":9118..9502
SpriteFrame487:
	db $03,$80
	dw $000C
	dw -8,18,-22,5
	dw $00C0,$00C0
	dw .tiles-SpriteFrame487
	db $11,$03,$02,$08
	dw -8,-10,$0800 : db $FF
	dw 8,-10,$0802 : db $FF
	dw -8,-26,$0804 : db $FF
.tiles:
	incbin "SpriteFrames88.bin":9545..9929
SpriteFrame488:
	db $03,$80
	dw $0009
	dw -9,5,-24,9
	dw $00A0,$0080
	dw .tiles-SpriteFrame488
	db $FF,$0F,$03,$05
	dw -8,-24,$0800 : db $FF
	dw -9,-8,$0802 : db $FF
	dw -6,8,$0804 : db $00
.tiles:
	incbin "SpriteFrames88.bin":9972..10260
SpriteFrame489:
	db $03,$80
	dw $0009
	dw -8,8,-23,6
	dw $00A0,$0080
	dw .tiles-SpriteFrame489
	db $07,$0B,$02,$06
	dw -8,-9,$0800 : db $FF
	dw -8,-25,$0802 : db $FF
	dw 8,-9,$0804 : db $00
.tiles:
	incbin "SpriteFrames88.bin":10303..10591
SpriteFrame490:
	db $03,$80
	dw $000C
	dw -17,9,-23,8
	dw $00C0,$00C0
	dw .tiles-SpriteFrame490
	db $F0,$09,$06,$06
	dw -3,-23,$0800 : db $FF
	dw -17,-7,$0802 : db $FF
	dw -1,-7,$0804 : db $FF
.tiles:
	incbin "SpriteFrames88.bin":10634..11018
SpriteFrame491:
	db $04,$80
	dw $000D
	dw -21,14,-22,2
	dw $00E0,$00C0
	dw .tiles-SpriteFrame491
	db $EC,$04,$03,$06
	dw -21,-13,$0800 : db $FF
	dw -5,-13,$0802 : db $FF
	dw -5,-29,$0804 : db $FF
	dw 11,-5,$0806 : db $00
.tiles:
	incbin "SpriteFrames88.bin":11068..11484
SpriteFrame492:
	db $03,$80
	dw $000C
	dw -21,9,-25,5
	dw $00C0,$00C0
	dw .tiles-SpriteFrame492
	db $EC,$00,$07,$05
	dw -21,-11,$0800 : db $FF
	dw -5,-25,$0802 : db $FF
	dw -5,-9,$0804 : db $FF
.tiles:
	incbin "SpriteFrames88.bin":11527..11911
SpriteFrame493:
	db $04,$80
	dw $0010
	dw -24,12,-25,4
	dw $0100,$0100
	dw .tiles-SpriteFrame493
	db $E9,$F9,$07,$05
	dw -24,-25,$0800 : db $FF
	dw -8,-25,$0802 : db $FF
	dw -18,-9,$0804 : db $FF
	dw -2,-9,$0806 : db $FF
.tiles:
	incbin "SpriteFrames88.bin":11961..12473

SpriteFrame494:
	db $06,$80
	dw $000C
	dw -16,7,-24,4
	dw $00C0,$00C0
	dw .tiles-SpriteFrame494
	db $F1,$F4,$06,$07
	dw -16,-24,$0800 : db $FF
	dw -14,-8,$0802 : db $FF
	dw 0,-24,$0804 : db $00
	dw 0,-16,$0805 : db $00
	dw 2,-8,$0814 : db $00
	dw 2,0,$0815 : db $00
.tiles:
	incbin "SpriteFrames88.bin":12537..12921
SpriteFrame495:
	db $04,$80
	dw $000A
	dw -11,7,-23,7
	dw $00C0,$0080
	dw .tiles-SpriteFrame495
	db $F6,$F2,$05,$08
	dw -11,-23,$0800 : db $FF
	dw -7,-7,$0802 : db $FF
	dw 5,-23,$0804 : db $00
	dw 5,-15,$0805 : db $00
.tiles:
	incbin "SpriteFrames88.bin":12971..13291
SpriteFrame496:
	db $04,$80
	dw $000A
	dw -12,10,-25,6
	dw $00C0,$0080
	dw .tiles-SpriteFrame496
	db $F8,$FC,$04,$06
	dw -12,-25,$0800 : db $FF
	dw -10,-9,$0802 : db $FF
	dw 4,-25,$0804 : db $00
	dw 4,-17,$0805 : db $00
.tiles:
	incbin "SpriteFrames88.bin":13341..13661
SpriteFrame497:
	db $04,$80
	dw $000A
	dw -13,8,-25,6
	dw $00C0,$0080
	dw .tiles-SpriteFrame497
	db $F6,$FD,$05,$06
	dw -4,-25,$0800 : db $FF
	dw -13,-9,$0802 : db $FF
	dw 3,-9,$0804 : db $00
	dw 3,-1,$0805 : db $00
.tiles:
	incbin "SpriteFrames88.bin":13711..14031
SpriteFrame498:
	db $02,$80
	dw $0008
	dw -6,9,-23,5
	dw $0080,$0080
	dw .tiles-SpriteFrame498
	db $FE,$FA,$04,$06
	dw -5,-23,$0800 : db $FF
	dw -6,-7,$0802 : db $FF
.tiles:
	incbin "SpriteFrames88.bin":14067..14323
SpriteFrame499:
	db $03,$80
	dw $0009
	dw -6,14,-23,5
	dw $00A0,$0080
	dw .tiles-SpriteFrame499
	db $08,$FB,$05,$06
	dw -5,-23,$0800 : db $FF
	dw -6,-7,$0802 : db $FF
	dw 11,-15,$0804 : db $00
.tiles:
	incbin "SpriteFrames88.bin":14366..14654
SpriteFrame500:
	db $03,$80
	dw $0009
	dw -8,10,-26,5
	dw $00A0,$0080
	dw .tiles-SpriteFrame500
	db $06,$FB,$03,$05
	dw -8,-26,$0800 : db $FF
	dw -8,-10,$0802 : db $FF
	dw 8,-18,$0804 : db $00
.tiles:
	incbin "SpriteFrames88.bin":14697..14985
SpriteFrame501:
	db $03,$80
	dw $0009
	dw -8,10,-26,5
	dw $00A0,$0080
	dw .tiles-SpriteFrame501
	db $04,$FC,$03,$05
	dw -8,-26,$0800 : db $FF
	dw -8,-10,$0802 : db $FF
	dw 8,-18,$0804 : db $00
.tiles:
	incbin "SpriteFrames88.bin":15028..15316
SpriteFrame502:
	db $04,$80
	dw $000D
	dw -9,16,-25,2
	dw $00E0,$00C0
	dw .tiles-SpriteFrame502
	db $07,$FD,$03,$04
	dw -9,-25,$0800 : db $FF
	dw 7,-25,$0802 : db $FF
	dw -9,-9,$0804 : db $FF
	dw 8,-9,$0806 : db $00
.tiles:
	incbin "SpriteFrames88.bin":15366..15782
SpriteFrame503:
	db $03,$80
	dw $000C
	dw -8,17,-24,4
	dw $00C0,$00C0
	dw .tiles-SpriteFrame503
	db $02,$02,$03,$06
	dw -8,-24,$0800 : db $FF
	dw -8,-8,$0802 : db $FF
	dw 8,-14,$0804 : db $FF
.tiles:
	incbin "SpriteFrames88.bin":15825..16209
SpriteFrame504:
	db $03,$80
	dw $0009
	dw -9,9,-26,4
	dw $00A0,$0080
	dw .tiles-SpriteFrame504
	db $07,$02,$04,$05
	dw -9,-26,$0800 : db $FF
	dw -8,-10,$0802 : db $FF
	dw 7,-26,$0804 : db $00
.tiles:
	incbin "SpriteFrames88.bin":16252..16540

SpriteFrame505:
	db $02,$80
	dw $0008
	dw -9,7,-23,4
	dw $0080,$0080
	dw .tiles-SpriteFrame505
	db $FF,$01,$04,$05
	dw -9,-23,$0800 : db $FF
	dw -8,-7,$0802 : db $FF
.tiles:
	incbin "SpriteFrames88.bin":16576..16832
SpriteFrame506:
	db $04,$80
	dw $000A
	dw -10,6,-24,7
	dw $00C0,$0080
	dw .tiles-SpriteFrame506
	db $02,$05,$01,$05
	dw -9,-24,$0800 : db $FF
	dw -10,-8,$0802 : db $FF
	dw 6,-8,$0804 : db $00
	dw 6,0,$0805 : db $00
.tiles:
	incbin "SpriteFrames88.bin":16882..17202
SpriteFrame507:
	db $04,$80
	dw $000A
	dw -11,7,-25,6
	dw $00C0,$0080
	dw .tiles-SpriteFrame507
	db $F8,$03,$03,$03
	dw -11,-25,$0800 : db $FF
	dw -9,-9,$0802 : db $FF
	dw 7,-9,$0804 : db $00
	dw 7,-1,$0805 : db $00
.tiles:
	incbin "SpriteFrames88.bin":17252..17572
SpriteFrame508:
	db $06,$80
	dw $000C
	dw -14,6,-25,5
	dw $00C0,$00C0
	dw .tiles-SpriteFrame508
	db $F6,$04,$03,$03
	dw -13,-25,$0800 : db $FF
	dw -14,-9,$0802 : db $FF
	dw 3,-25,$0804 : db $00
	dw 3,-17,$0805 : db $00
	dw 2,-9,$0814 : db $00
	dw 2,-1,$0815 : db $00
.tiles:
	incbin "SpriteFrames88.bin":17636..18020
SpriteFrame509:
	db $03,$80
	dw $0009
	dw -18,5,-25,5
	dw $00A0,$0080
	dw .tiles-SpriteFrame509
	db $FA,$FF,$02,$03
	dw -10,-25,$0800 : db $FF
	dw -10,-9,$0802 : db $FF
	dw -18,-11,$0804 : db $00
.tiles:
	incbin "SpriteFrames88.bin":18063..18351
SpriteFrame510:
	db $04,$80
	dw $000A
	dw -17,6,-24,5
	dw $00C0,$0080
	dw .tiles-SpriteFrame510
	db $F7,$00,$04,$05
	dw -10,-24,$0800 : db $FF
	dw -17,-8,$0802 : db $FF
	dw -1,-8,$0804 : db $00
	dw -1,0,$0805 : db $00
.tiles:
	incbin "SpriteFrames88.bin":18401..18721
SpriteFrame511:
	db $04,$80
	dw $000A
	dw -17,6,-24,5
	dw $00C0,$0080
	dw .tiles-SpriteFrame511
	db $FC,$FD,$03,$04
	dw -7,-24,$0800 : db $FF
	dw -17,-8,$0802 : db $FF
	dw -1,-8,$0804 : db $00
	dw -1,0,$0805 : db $00
.tiles:
	incbin "SpriteFrames88.bin":18771..19091
SpriteFrame512:
	db $03,$80
	dw $0006
	dw 0,23,-16,-2
	dw $0080,$0040
	dw .tiles-SpriteFrame512
	db $00,$FF,$00,$FF
	dw 0,-16,$0200 : db $FF
	dw 16,-16,$0202 : db $00
	dw 16,-8,$0203 : db $00
.tiles:
	incbin "SpriteFrames88.bin":19134..19326
SpriteFrame513:
	db $04,$80
	dw $0010
	dw 0,31,-24,7
	dw $0100,$0100
	dw .tiles-SpriteFrame513
	db $00,$FF,$00,$FF
	dw 0,-24,$0200 : db $FF
	dw 16,-24,$0202 : db $FF
	dw 0,-8,$0204 : db $FF
	dw 16,-8,$0206 : db $FF
.tiles:
	incbin "SpriteFrames88.bin":19376..19888
SpriteFrame514:
	db $06,$80
	dw $0012
	dw 0,31,-16,24
	dw $0140,$0100
	dw .tiles-SpriteFrame514
	db $00,$FF,$00,$FF
	dw 0,-16,$0200 : db $FF
	dw 16,-16,$0202 : db $FF
	dw 0,0,$0204 : db $FF
	dw 9,16,$0206 : db $FF
	dw 16,0,$0208 : db $00
	dw 16,8,$0209 : db $00
.tiles:
	incbin "SpriteFrames88.bin":19952..20528

SpriteFrame515:
	db $04,$80
	dw $0010
	dw 0,31,-16,25
	dw $0100,$0100
	dw .tiles-SpriteFrame515
	db $00,$FF,$00,$FF
	dw 0,-16,$0200 : db $FF
	dw 0,13,$0202 : db $FF
	dw 16,-16,$0204 : db $FF
	dw 16,13,$0206 : db $FF
.tiles:
	incbin "SpriteFrames88.bin":20578..21090
SpriteFrame516:
	db $04,$80
	dw $0010
	dw 0,31,-16,26
	dw $0100,$0100
	dw .tiles-SpriteFrame516
	db $00,$FF,$00,$FF
	dw 0,-16,$0200 : db $FF
	dw 16,-16,$0202 : db $FF
	dw 1,16,$0204 : db $FF
	dw 17,16,$0206 : db $FF
.tiles:
	incbin "SpriteFrames88.bin":21140..21652
SpriteFrame517:
	db $05,$80
	dw $0011
	dw -19,16,-30,1
	dw $0120,$0100
	dw .tiles-SpriteFrame517
	db $F1,$FF,$00,$00
	dw -19,-30,$0800 : db $FF
	dw -3,-30,$0802 : db $FF
	dw -15,-14,$0804 : db $FF
	dw 1,-14,$0806 : db $FF
	dw 13,-22,$0808 : db $00
.tiles:
	incbin "SpriteFrames88.bin":21709..22253
SpriteFrame518:
	db $06,$80
	dw $000F
	dw -22,15,-26,1
	dw $0100,$00E0
	dw .tiles-SpriteFrame518
	db $EF,$FC,$00,$00
	dw -6,-26,$0800 : db $FF
	dw -15,-10,$0802 : db $FF
	dw 1,-10,$0804 : db $FF
	dw -22,-26,$0806 : db $00
	dw -14,-26,$0807 : db $00
	dw 10,-26,$0816 : db $00
.tiles:
	incbin "SpriteFrames88.bin":22317..22797
SpriteFrame519:
	db $05,$80
	dw $000B
	dw -7,13,-30,2
	dw $00C0,$00A0
	dw .tiles-SpriteFrame519
	db $0C,$01,$00,$00
	dw -5,-30,$0800 : db $FF
	dw -7,-14,$0802 : db $FF
	dw 11,-22,$0804 : db $00
	dw 9,-6,$0805 : db $00
	dw 2,2,$0814 : db $00
.tiles:
	incbin "SpriteFrames88.bin":22854..23206
SpriteFrame520:
	db $04,$80
	dw $000D
	dw -6,19,-26,2
	dw $00E0,$00C0
	dw .tiles-SpriteFrame520
	db $FC,$00,$00,$00
	dw -6,-26,$0800 : db $FF
	dw 10,-26,$0802 : db $FF
	dw -6,-10,$0804 : db $FF
	dw 10,-2,$0806 : db $00
.tiles:
	incbin "SpriteFrames88.bin":23256..23672
SpriteFrame521:
	db $03,$80
	dw $0009
	dw -6,6,-30,3
	dw $00A0,$0080
	dw .tiles-SpriteFrame521
	db $04,$01,$00,$00
	dw -5,-30,$0800 : db $FF
	dw -6,-14,$0802 : db $FF
	dw -5,2,$0804 : db $00
.tiles:
	incbin "SpriteFrames88.bin":23715..24003
SpriteFrame522:
	db $05,$80
	dw $000B
	dw -6,19,-28,5
	dw $00C0,$00A0
	dw .tiles-SpriteFrame522
	db $10,$01,$00,$00
	dw 4,-28,$0800 : db $FF
	dw -12,-7,$0802 : db $FF
	dw 4,-2,$0804 : db $00
	dw -4,-23,$0805 : db $00
	dw -4,-15,$0814 : db $00
.tiles:
	incbin "SpriteFrames88.bin":24060..24412
SpriteFrame523:
	db $05,$80
	dw $000E
	dw -8,18,-30,4
	dw $0100,$00C0
	dw .tiles-SpriteFrame523
	db $11,$FE,$00,$00
	dw -8,-30,$0800 : db $FF
	dw 8,-30,$0802 : db $FF
	dw -7,-14,$0804 : db $FF
	dw 9,-6,$0806 : db $00
	dw -7,2,$0807 : db $00
.tiles:
	incbin "SpriteFrames88.bin":24469..24917

SpriteFrame524:
	db $06,$80
	dw $000C
	dw -7,23,-27,3
	dw $00C0,$00C0
	dw .tiles-SpriteFrame524
	db $17,$FF,$00,$00
	dw -4,-27,$0800 : db $FF
	dw -7,-11,$0802 : db $FF
	dw 12,-27,$0804 : db $00
	dw 12,-19,$0805 : db $00
	dw 9,-3,$0814 : db $00
	dw 17,-3,$0815 : db $00
.tiles:
	incbin "SpriteFrames88.bin":24981..25365
SpriteFrame525:
	db $05,$80
	dw $0011
	dw -14,20,-30,1
	dw $0120,$0100
	dw .tiles-SpriteFrame525
	db $12,$00,$00,$00
	dw -14,-30,$0800 : db $FF
	dw 2,-30,$0802 : db $FF
	dw -13,-14,$0804 : db $FF
	dw 3,-14,$0806 : db $FF
	dw 18,-30,$0808 : db $00
.tiles:
	incbin "SpriteFrames88.bin":25422..25966
SpriteFrame526:
	db $05,$80
	dw $0011
	dw -14,20,-26,3
	dw $0120,$0100
	dw .tiles-SpriteFrame526
	db $11,$02,$00,$00
	dw -14,-26,$0800 : db $FF
	dw 2,-26,$0802 : db $FF
	dw -14,-10,$0804 : db $FF
	dw 2,-10,$0806 : db $FF
	dw 18,-26,$0808 : db $00
.tiles:
	incbin "SpriteFrames88.bin":26023..26567
SpriteFrame527:
	db $05,$80
	dw $000E
	dw -15,15,-30,4
	dw $0100,$00C0
	dw .tiles-SpriteFrame527
	db $12,$03,$00,$00
	dw -15,-30,$0800 : db $FF
	dw 1,-30,$0802 : db $FF
	dw -10,-14,$0804 : db $FF
	dw -4,2,$0806 : db $00
	dw 4,2,$0807 : db $00
.tiles:
	incbin "SpriteFrames88.bin":26624..27072
SpriteFrame528:
	db $05,$80
	dw $000E
	dw -19,6,-28,3
	dw $0100,$00C0
	dw .tiles-SpriteFrame528
	db $05,$03,$00,$00
	dw -19,-28,$0800 : db $FF
	dw -3,-28,$0802 : db $FF
	dw -12,-12,$0804 : db $FF
	dw 4,-12,$0806 : db $00
	dw 4,-4,$0807 : db $00
.tiles:
	incbin "SpriteFrames88.bin":27129..27577
SpriteFrame529:
	db $03,$80
	dw $0009
	dw -7,7,-30,2
	dw $00A0,$0080
	dw .tiles-SpriteFrame529
	db $FA,$01,$00,$00
	dw -7,-30,$0800 : db $FF
	dw -6,-14,$0802 : db $FF
	dw -1,2,$0804 : db $00
.tiles:
	incbin "SpriteFrames88.bin":27620..27908
SpriteFrame530:
	db $05,$80
	dw $000E
	dw -19,6,-28,2
	dw $0100,$00C0
	dw .tiles-SpriteFrame530
	db $F1,$01,$00,$00
	dw -19,-28,$0800 : db $FF
	dw -3,-28,$0802 : db $FF
	dw -15,-12,$0804 : db $FF
	dw 1,-12,$0806 : db $00
	dw 1,-4,$0807 : db $00
.tiles:
	incbin "SpriteFrames88.bin":27965..28413
SpriteFrame531:
	db $05,$80
	dw $000B
	dw -14,5,-30,2
	dw $00C0,$00A0
	dw .tiles-SpriteFrame531
	db $ED,$00,$00,$00
	dw -14,-30,$0800 : db $FF
	dw -10,-14,$0802 : db $FF
	dw 2,-30,$0804 : db $00
	dw 2,-22,$0805 : db $00
	dw -11,2,$0814 : db $00
.tiles:
	incbin "SpriteFrames88.bin":28470..28822

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
	incbin "SpriteFrames88.bin":28879..29327
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
	incbin "SpriteFrames88.bin":29377..29793
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
	incbin "SpriteFrames88.bin":29857..30241
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
	incbin "SpriteFrames88.bin":30291..30803
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
	incbin "SpriteFrames88.bin":30846..31134
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
	incbin "SpriteFrames88.bin":31184..31504
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
	incbin "SpriteFrames88.bin":31561..32009
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
	incbin "SpriteFrames88.bin":32059..32379
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
	incbin "SpriteFrames88.bin":32422..32710
