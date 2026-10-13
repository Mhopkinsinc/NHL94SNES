; Bank $8B, first 4 KB: SpriteFrames continued (see bank82_8000), tiles from Extracted/data/SpriteFrames8B.bin.

org $8B8000
SpriteFrame684:
	db $04,$80
	dw $000D
	dw -9,29,-20,9
	dw $00E0,$00C0
	dw .tiles-SpriteFrame684
	db $1A,$09,$1C,$07
	dw -5,-20,$0800 : db $FF
	dw -9,-4,$0802 : db $FF
	dw 7,-4,$0804 : db $FF
	dw 23,4,$0806 : db $00
.tiles:
	incbin "../Extracted/data/SpriteFrames8B.bin":50..466
SpriteFrame685:
	db $05,$80
	dw $000E
	dw -11,15,-23,7
	dw $0100,$00C0
	dw .tiles-SpriteFrame685
	db $04,$08,$06,$06
	dw -11,-23,$0800 : db $FF
	dw 5,-23,$0802 : db $FF
	dw -11,-7,$0804 : db $FF
	dw 5,-7,$0806 : db $00
	dw 5,1,$0807 : db $00
.tiles:
	incbin "../Extracted/data/SpriteFrames8B.bin":523..971
SpriteFrame686:
	db $06,$80
	dw $000F
	dw -9,13,-22,11
	dw $0100,$00E0
	dw .tiles-SpriteFrame686
	db $04,$0C,$06,$0A
	dw -7,-22,$0800 : db $FF
	dw -9,-6,$0802 : db $FF
	dw -1,2,$0804 : db $FF
	dw 9,-22,$0806 : db $00
	dw 9,-14,$0807 : db $00
	dw 7,-6,$0816 : db $00
.tiles:
	incbin "../Extracted/data/SpriteFrames8B.bin":1035..1515
SpriteFrame687:
	db $04,$80
	dw $0010
	dw -20,11,-23,3
	dw $0100,$0100
	dw .tiles-SpriteFrame687
	db $EE,$03,$F0,$01
	dw -18,-23,$0800 : db $FF
	dw -2,-23,$0802 : db $FF
	dw -20,-7,$0804 : db $FF
	dw -4,-7,$0806 : db $FF
.tiles:
	incbin "../Extracted/data/SpriteFrames8B.bin":1565..2077
SpriteFrame688:
	db $07,$80
	dw $0013
	dw -32,12,-22,11
	dw $0140,$0120
	dw .tiles-SpriteFrame688
	db $E3,$0B,$E5,$09
	dw -19,-22,$0800 : db $FF
	dw -3,-22,$0802 : db $FF
	dw -32,-6,$0804 : db $FF
	dw -16,-6,$0806 : db $FF
	dw 0,-6,$0808 : db $00
	dw 8,-6,$0809 : db $00
	dw -29,10,$0818 : db $00
.tiles:
	incbin "../Extracted/data/SpriteFrames8B.bin":2148..2756
SpriteFrame689:
	db $04,$80
	dw $0007
	dw -18,6,-21,2
	dw $0080,$0060
	dw .tiles-SpriteFrame689
	db $EF,$01,$F1,$FF
	dw -9,-21,$0800 : db $FF
	dw -18,-5,$0802 : db $00
	dw -10,-5,$0803 : db $00
	dw -2,-5,$0812 : db $00
.tiles:
	incbin "../Extracted/data/SpriteFrames8B.bin":2806..3030
SpriteFrame690:
	db $05,$80
	dw $000E
	dw -27,8,-21,3
	dw $0100,$00C0
	dw .tiles-SpriteFrame690
	db $E6,$03,$E8,$01
	dw -27,-12,$0800 : db $FF
	dw -11,-12,$0802 : db $FF
	dw -8,-28,$0804 : db $FF
	dw 5,-12,$0806 : db $00
	dw 5,-4,$0807 : db $00
.tiles:
	incbin "../Extracted/data/SpriteFrames8B.bin":3087..3535
SpriteFrame691:
	db $04,$80
	dw $000D
	dw -21,10,-25,2
	dw $00E0,$00C0
	dw .tiles-SpriteFrame691
	db $EE,$FE,$F0,$FC
	dw -9,-25,$0800 : db $FF
	dw -21,-9,$0802 : db $FF
	dw -5,-9,$0804 : db $FF
	dw 7,-17,$0806 : db $00
.tiles:
	incbin "../Extracted/data/SpriteFrames8B.bin":3585..4001
SpriteFrame692:
	db $04,$80
	dw $0010
	dw -34,9,-23,3
	dw $0100,$0100
	dw .tiles-SpriteFrame692
	db $E2,$FD,$E4,$FB
	dw -34,-12,$0800 : db $FF
	dw -18,-12,$0802 : db $FF
	dw -2,-12,$0804 : db $FF
	dw -8,-28,$0806 : db $FF
.tiles:
	incbin "../Extracted/data/SpriteFrames8B.bin":4051..4563
