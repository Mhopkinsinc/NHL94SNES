; More frames of SpriteFrames. A frame is the piece count, flags (bit 7: 16x16 tiles), tile
; count, four words not traced, the two transfer sizes, the tile offset, four bytes not
; traced, the pieces, then the tiles.

SpriteFrame899:
	db $06,$80
	dw $0009
	dw -41,-20,-24,-2
	dw $00A0,$0080
	dw .tiles-SpriteFrame899
	db $00,$00,$00,$00
	dw -41,-24,$0800 : db $FF
	dw -25,-24,$0802 : db $00
	dw -25,-16,$0803 : db $00
	dw -36,-8,$0812 : db $00
	dw -28,-8,$0813 : db $00
	dw -20,-8,$0804 : db $00
.tiles:
	incbin "SpriteFrames8E.bin":64..352
SpriteFrame900:
	db $02,$80
	dw $0008
	dw -18,-1,-28,2
	dw $0080,$0080
	dw .tiles-SpriteFrame900
	db $00,$00,$E9,$E6
	dw -18,-28,$0800 : db $FF
	dw -14,-12,$0802 : db $FF
.tiles:
	incbin "SpriteFrames8E.bin":388..644
SpriteFrame901:
	db $05,$80
	dw $000B
	dw -32,-4,-23,-2
	dw $00C0,$00A0
	dw .tiles-SpriteFrame901
	db $00,$00,$E6,$E2
	dw -32,-23,$0800 : db $FF
	dw -16,-23,$0802 : db $FF
	dw -32,-7,$0804 : db $00
	dw -24,-7,$0805 : db $00
	dw -15,-7,$0814 : db $00
.tiles:
	incbin "SpriteFrames8E.bin":701..1053
SpriteFrame902:
	db $05,$80
	dw $000B
	dw -19,5,-28,2
	dw $00C0,$00A0
	dw .tiles-SpriteFrame902
	db $00,$00,$F4,$ED
	dw -19,-28,$0800 : db $FF
	dw -14,-12,$0802 : db $FF
	dw -3,-28,$0804 : db $00
	dw -3,-20,$0805 : db $00
	dw 2,-12,$0814 : db $00
.tiles:
	incbin "SpriteFrames8E.bin":1110..1462
SpriteFrame903:
	db $04,$80
	dw $000A
	dw -32,-4,-28,-4
	dw $00C0,$0080
	dw .tiles-SpriteFrame903
	db $00,$00,$EF,$E7
	dw -32,-22,$0800 : db $FF
	dw -16,-28,$0802 : db $FF
	dw -16,-12,$0804 : db $00
	dw -16,-4,$0805 : db $00
.tiles:
	incbin "SpriteFrames8E.bin":1512..1832
SpriteFrame904:
	db $06,$80
	dw $0009
	dw -41,-20,-24,-2
	dw $00A0,$0080
	dw .tiles-SpriteFrame904
	db $00,$00,$00,$00
	dw -41,-24,$0800 : db $FF
	dw -25,-24,$0802 : db $00
	dw -25,-16,$0803 : db $00
	dw -36,-8,$0812 : db $00
	dw -28,-8,$0813 : db $00
	dw -20,-8,$0804 : db $00
.tiles:
	incbin "SpriteFrames8E.bin":1896..2184
SpriteFrame905:
	db $05,$80
	dw $000B
	dw -15,2,-33,1
	dw $00C0,$00A0
	dw .tiles-SpriteFrame905
	db $00,$00,$F8,$EE
	dw -15,-33,$0800 : db $FF
	dw -14,-17,$0802 : db $FF
	dw 2,-9,$0804 : db $00
	dw -11,-1,$0805 : db $00
	dw -3,-1,$0814 : db $00
.tiles:
	incbin "SpriteFrames8E.bin":2241..2593
SpriteFrame906:
	db $05,$80
	dw $000B
	dw -30,-1,-40,-5
	dw $00C0,$00A0
	dw .tiles-SpriteFrame906
	db $00,$00,$FA,$E4
	dw -30,-29,$0800 : db $FF
	dw -14,-19,$0802 : db $FF
	dw -22,-13,$0804 : db $00
	dw -6,-40,$0805 : db $00
	dw -14,-32,$0814 : db $00
.tiles:
	incbin "SpriteFrames8E.bin":2650..3002
SpriteFrame907:
	db $06,$80
	dw $000F
	dw -14,15,-31,2
	dw $0100,$00E0
	dw .tiles-SpriteFrame907
	db $00,$00,$09,$DE
	dw -14,-31,$0800 : db $FF
	dw 2,-31,$0802 : db $FF
	dw -12,-15,$0804 : db $FF
	dw 4,-15,$0806 : db $00
	dw 4,-7,$0807 : db $00
	dw -10,1,$0816 : db $00
.tiles:
	incbin "SpriteFrames8E.bin":3066..3546
SpriteFrame908:
	db $04,$80
	dw $000D
	dw -31,-2,-29,-5
	dw $00E0,$00C0
	dw .tiles-SpriteFrame908
	db $00,$00,$FA,$DF
	dw -31,-29,$0800 : db $FF
	dw -15,-29,$0802 : db $FF
	dw -20,-13,$0804 : db $FF
	dw -4,-13,$0806 : db $00
.tiles:
	incbin "SpriteFrames8E.bin":3596..4012
SpriteFrame909:
	db $05,$80
	dw $0008
	dw -38,-19,-24,-3
	dw $0080,$0080
	dw .tiles-SpriteFrame909
	db $00,$00,$00,$00
	dw -38,-24,$0800 : db $FF
	dw -22,-24,$0802 : db $00
	dw -22,-16,$0803 : db $00
	dw -38,-8,$0812 : db $00
	dw -30,-8,$0813 : db $00
.tiles:
	incbin "SpriteFrames8E.bin":4069..4325

SpriteFrame910:
	db $04,$80
	dw $000A
	dw -24,-1,-29,1
	dw $00C0,$0080
	dw .tiles-SpriteFrame910
	db $00,$00,$D8,$DD
	dw -24,-29,$0800 : db $FF
	dw -14,-13,$0802 : db $FF
	dw -8,-29,$0804 : db $00
	dw -8,-21,$0805 : db $00
.tiles:
	incbin "SpriteFrames8E.bin":4375..4695
SpriteFrame911:
	db $03,$80
	dw $0009
	dw -33,-5,-30,-10
	dw $00A0,$0080
	dw .tiles-SpriteFrame911
	db $00,$00,$D6,$D8
	dw -33,-25,$0800 : db $FF
	dw -17,-25,$0802 : db $FF
	dw -30,-33,$0804 : db $00
.tiles:
	incbin "SpriteFrames8E.bin":4738..5026
SpriteFrame912:
	db $04,$80
	dw $000A
	dw -33,-2,-30,0
	dw $00C0,$0080
	dw .tiles-SpriteFrame912
	db $00,$00,$DF,$E3
	dw -17,-30,$0800 : db $FF
	dw -16,-14,$0802 : db $FF
	dw -33,-30,$0804 : db $00
	dw -25,-30,$0805 : db $00
.tiles:
	incbin "SpriteFrames8E.bin":5076..5396
SpriteFrame913:
	db $03,$80
	dw $0009
	dw -33,-5,-30,-10
	dw $00A0,$0080
	dw .tiles-SpriteFrame913
	db $00,$00,$D6,$D8
	dw -33,-25,$0800 : db $FF
	dw -17,-25,$0802 : db $FF
	dw -30,-33,$0804 : db $00
.tiles:
	incbin "SpriteFrames8E.bin":5439..5727
SpriteFrame914:
	db $06,$80
	dw $0009
	dw -41,-20,-24,-2
	dw $00A0,$0080
	dw .tiles-SpriteFrame914
	db $00,$00,$00,$00
	dw -41,-24,$0800 : db $FF
	dw -25,-24,$0802 : db $00
	dw -25,-16,$0803 : db $00
	dw -36,-8,$0812 : db $00
	dw -28,-8,$0813 : db $00
	dw -20,-8,$0804 : db $00
.tiles:
	incbin "SpriteFrames8E.bin":5791..6079
SpriteFrame915:
	db $02,$80
	dw $0008
	dw -32,-17,-27,-2
	dw $0080,$0080
	dw .tiles-SpriteFrame915
	db $00,$00,$00,$00
	dw -32,-27,$0800 : db $FF
	dw -31,-11,$0802 : db $FF
.tiles:
	incbin "SpriteFrames8E.bin":6115..6371
SpriteFrame916:
	db $08,$80
	dw $001A
	dw -3,14,-90,4
	dw $01C0,$0180
	dw .tiles-SpriteFrame916
	db $04,$00,$5D,$00
	dw -3,-90,$0800 : db $FF
	dw -3,-74,$0802 : db $FF
	dw -3,-58,$0804 : db $FF
	dw -3,-42,$0806 : db $FF
	dw -3,-26,$0808 : db $FF
	dw -3,-10,$080A : db $FF
	dw 13,-58,$080C : db $00
	dw 13,-42,$080D : db $00
.tiles:
	incbin "SpriteFrames8E.bin":6449..7281
SpriteFrame917:
	db $08,$80
	dw $001A
	dw -3,14,-89,5
	dw $01C0,$0180
	dw .tiles-SpriteFrame917
	db $07,$00,$5D,$00
	dw -3,-89,$0800 : db $FF
	dw -3,-73,$0802 : db $FF
	dw -3,-57,$0804 : db $FF
	dw -3,-41,$0806 : db $FF
	dw -3,-25,$0808 : db $FF
	dw -3,-9,$080A : db $FF
	dw 13,-59,$080C : db $00
	dw 13,-41,$080D : db $00
.tiles:
	incbin "SpriteFrames8E.bin":7359..8191
SpriteFrame918:
	db $0A,$80
	dw $001C
	dw -3,14,-88,8
	dw $01C0,$01C0
	dw .tiles-SpriteFrame918
	db $07,$00,$5D,$00
	dw -3,-88,$0800 : db $FF
	dw -3,-72,$0802 : db $FF
	dw -3,-56,$0804 : db $FF
	dw -3,-40,$0806 : db $FF
	dw -3,-24,$0808 : db $FF
	dw -3,-8,$080A : db $FF
	dw 13,-88,$080C : db $00
	dw 13,-48,$080D : db $00
	dw 13,-24,$081C : db $00
	dw 5,8,$081D : db $00
.tiles:
	incbin "SpriteFrames8E.bin":8283..9179

SpriteFrame919:
	db $09,$80
	dw $001B
	dw -3,14,-92,5
	dw $01C0,$01A0
	dw .tiles-SpriteFrame919
	db $08,$00,$5D,$00
	dw -3,-92,$0800 : db $FF
	dw -3,-76,$0802 : db $FF
	dw -3,-60,$0804 : db $FF
	dw -3,-44,$0806 : db $FF
	dw -3,-28,$0808 : db $FF
	dw -3,-12,$080A : db $FF
	dw 13,-92,$080C : db $00
	dw 13,-36,$080D : db $00
	dw 5,4,$081C : db $00
.tiles:
	incbin "SpriteFrames8E.bin":9264..10128
SpriteFrame920:
	db $0C,$80
	dw $001E
	dw -3,14,-91,5
	dw $0200,$01C0
	dw .tiles-SpriteFrame920
	db $08,$00,$5D,$00
	dw -3,-91,$0800 : db $FF
	dw -3,-75,$0802 : db $FF
	dw -3,-59,$0804 : db $FF
	dw -3,-43,$0806 : db $FF
	dw -3,-27,$0808 : db $FF
	dw -3,-11,$080A : db $FF
	dw 13,-91,$080C : db $00
	dw 13,-83,$080D : db $00
	dw 13,-51,$081C : db $00
	dw 13,-43,$081D : db $00
	dw 13,-35,$080E : db $00
	dw 5,5,$080F : db $00
.tiles:
	incbin "SpriteFrames8E.bin":10234..11194
SpriteFrame921:
	db $07,$80
	dw $0019
	dw -3,14,-89,5
	dw $01A0,$0180
	dw .tiles-SpriteFrame921
	db $08,$00,$5D,$00
	dw -3,-89,$0800 : db $FF
	dw -3,-73,$0802 : db $FF
	dw -3,-57,$0804 : db $FF
	dw -3,-41,$0806 : db $FF
	dw -3,-25,$0808 : db $FF
	dw -3,-9,$080A : db $FF
	dw 13,-25,$080C : db $00
.tiles:
	incbin "SpriteFrames8E.bin":11265..12065
SpriteFrame922:
	db $08,$80
	dw $001A
	dw -3,13,-89,6
	dw $01C0,$0180
	dw .tiles-SpriteFrame922
	db $00,$00,$00,$00
	dw -3,-89,$0800 : db $FF
	dw -3,-73,$0802 : db $FF
	dw -3,-57,$0804 : db $FF
	dw -3,-41,$0806 : db $FF
	dw -3,-25,$0808 : db $FF
	dw -3,-9,$080A : db $FF
	dw 13,-89,$080C : db $00
	dw 13,-49,$080D : db $00
.tiles:
	incbin "SpriteFrames8E.bin":12143..12975

SpriteFrame923:
	db $0A,$80
	dw $001B
	dw -3,14,-89,7
	dw $01C0,$01A0
	dw .tiles-SpriteFrame923
	db $00,$00,$00,$00
	dw -3,-89,$0800 : db $FF
	dw -3,-73,$0802 : db $FF
	dw -3,-57,$0804 : db $FF
	dw -3,-41,$0806 : db $FF
	dw -3,-25,$0808 : db $FF
	dw -3,-9,$080A : db $FF
	dw 13,-89,$080C : db $00
	dw 13,-49,$080D : db $00
	dw -3,7,$081C : db $00
	dw 5,7,$081C : db $00
.tiles:
	incbin "SpriteFrames8E.bin":13067..13931
SpriteFrame924:
	db $12,$80
	dw $0023
	dw -3,16,-89,7
	dw $0440,$0020
	dw .tiles-SpriteFrame924
	db $00,$00,$00,$00
	dw -3,-89,$0800 : db $FF
	dw -3,-73,$0802 : db $FF
	dw -3,-57,$0804 : db $FF
	dw -3,-41,$0806 : db $FF
	dw -3,-25,$0808 : db $FF
	dw -3,-9,$080A : db $FF
	dw 13,-89,$080C : db $00
	dw 13,-81,$080D : db $00
	dw 13,-73,$081C : db $00
	dw 13,-65,$081D : db $00
	dw 13,-57,$080E : db $00
	dw 13,-49,$080F : db $00
	dw 13,-41,$081E : db $00
	dw 13,-33,$081F : db $00
	dw 13,-25,$0820 : db $00
	dw 13,-17,$0821 : db $00
	dw -3,7,$0830 : db $00
	dw 5,7,$0830 : db $00
.tiles:
	incbin "SpriteFrames8E.bin":14079..15199
SpriteFrame925:
	db $0E,$80
	dw $001E
	dw -3,15,-89,7
	dw $0200,$01C0
	dw .tiles-SpriteFrame925
	db $FF,$00,$FF,$00
	dw -3,-89,$0800 : db $FF
	dw -3,-73,$0802 : db $FF
	dw -3,-57,$0804 : db $FF
	dw -3,-41,$0806 : db $FF
	dw -3,-25,$0808 : db $FF
	dw -3,-9,$080A : db $FF
	dw 13,-73,$080C : db $00
	dw 13,-57,$080D : db $00
	dw 13,-49,$880D : db $00
	dw 13,-33,$081C : db $00
	dw 13,-25,$081D : db $00
	dw 13,-17,$080E : db $00
	dw -3,7,$080F : db $00
	dw 5,7,$080F : db $00
.tiles:
	incbin "SpriteFrames8E.bin":15319..16279
SpriteFrame926:
	db $0C,$80
	dw $001D
	dw -3,17,-89,7
	dw $01E0,$01C0
	dw .tiles-SpriteFrame926
	db $FF,$00,$FF,$00
	dw -3,-89,$0800 : db $FF
	dw -3,-73,$0802 : db $FF
	dw -3,-57,$0804 : db $FF
	dw -3,-41,$0806 : db $FF
	dw -3,-25,$0808 : db $FF
	dw -3,-9,$080A : db $FF
	dw 13,-57,$080C : db $00
	dw 13,-33,$080D : db $00
	dw 13,-25,$081C : db $00
	dw 13,-17,$081D : db $00
	dw -3,7,$080E : db $00
	dw 5,7,$080E : db $00
.tiles:
	incbin "SpriteFrames8E.bin":16385..17313

SpriteFrame927:
	db $0B,$80
	dw $001C
	dw -3,15,-88,7
	dw $01C0,$01C0
	dw .tiles-SpriteFrame927
	db $FF,$01,$FF,$01
	dw -3,-88,$0800 : db $FF
	dw -3,-72,$0802 : db $FF
	dw -3,-56,$0804 : db $FF
	dw -3,-40,$0806 : db $FF
	dw -3,-24,$0808 : db $FF
	dw -3,-8,$080A : db $FF
	dw 13,-85,$080C : db $00
	dw 13,-50,$080D : db $00
	dw 13,-30,$081C : db $00
	dw 13,-22,$081D : db $00
	dw 13,-14,$080C : db $00
.tiles:
	incbin "SpriteFrames8E.bin":17412..18308
SpriteFrame928:
	db $02,$00
	dw $0002
	dw 0,6,0,9
	dw $0040,$0000
	dw .tiles-SpriteFrame928
	db $FA,$FE,$FA,$FE
	dw 0,0,$0000 : db $00
	dw 0,8,$0001 : db $00
.tiles:
	incbin "SpriteFrames8E.bin":18344..18408
SpriteFrame929:
	db $02,$00
	dw $0002
	dw 0,6,0,9
	dw $0040,$0000
	dw .tiles-SpriteFrame929
	db $F8,$FB,$F8,$FB
	dw 0,0,$0000 : db $00
	dw 0,8,$0001 : db $00
.tiles:
	incbin "SpriteFrames8E.bin":18444..18508
SpriteFrame930:
	db $02,$00
	dw $0002
	dw 0,5,0,9
	dw $0040,$0000
	dw .tiles-SpriteFrame930
	db $47,$A8,$47,$A8
	dw 0,0,$0000 : db $00
	dw 0,8,$0001 : db $00
.tiles:
	incbin "SpriteFrames8E.bin":18544..18608
SpriteFrame931:
	db $02,$00
	dw $0002
	dw 0,6,0,9
	dw $0040,$0000
	dw .tiles-SpriteFrame931
	db $46,$A5,$46,$A5
	dw 0,0,$0000 : db $00
	dw 0,8,$0001 : db $00
.tiles:
	incbin "SpriteFrames8E.bin":18644..18708
SpriteFrame932:
	db $02,$00
	dw $0002
	dw 0,5,0,9
	dw $0040,$0000
	dw .tiles-SpriteFrame932
	db $47,$A2,$47,$A2
	dw 0,0,$0000 : db $00
	dw 0,8,$0001 : db $00
.tiles:
	incbin "SpriteFrames8E.bin":18744..18808
SpriteFrame933:
	db $02,$00
	dw $0002
	dw 0,5,0,9
	dw $0040,$0000
	dw .tiles-SpriteFrame933
	db $42,$9F,$42,$9F
	dw 0,0,$0000 : db $00
	dw 0,8,$0001 : db $00
.tiles:
	incbin "SpriteFrames8E.bin":18844..18908
SpriteFrame934:
	db $02,$00
	dw $0002
	dw 0,6,0,9
	dw $0040,$0000
	dw .tiles-SpriteFrame934
	db $3F,$9C,$3F,$9C
	dw 0,0,$0000 : db $00
	dw 0,8,$0001 : db $00
.tiles:
	incbin "SpriteFrames8E.bin":18944..19008
SpriteFrame935:
	db $02,$00
	dw $0002
	dw 0,5,0,9
	dw $0040,$0000
	dw .tiles-SpriteFrame935
	db $3E,$99,$3E,$99
	dw 0,0,$0000 : db $00
	dw 0,8,$0001 : db $00
.tiles:
	incbin "SpriteFrames8E.bin":19044..19108
SpriteFrame936:
	db $02,$00
	dw $0002
	dw 0,1,0,9
	dw $0040,$0000
	dw .tiles-SpriteFrame936
	db $3F,$9C,$3F,$9C
	dw 0,0,$0000 : db $00
	dw 0,8,$0001 : db $00
.tiles:
	incbin "SpriteFrames8E.bin":19144..19208
SpriteFrame937:
	db $02,$00
	dw $0002
	dw 0,4,0,9
	dw $0040,$0000
	dw .tiles-SpriteFrame937
	db $3D,$97,$3D,$97
	dw 0,0,$0000 : db $00
	dw 0,8,$0001 : db $00
.tiles:
	incbin "SpriteFrames8E.bin":19244..19308
SpriteFrame938:
	db $02,$00
	dw $0002
	dw 0,6,0,9
	dw $0040,$0000
	dw .tiles-SpriteFrame938
	db $3C,$92,$3C,$92
	dw 0,0,$0000 : db $00
	dw 0,8,$0001 : db $00
.tiles:
	incbin "SpriteFrames8E.bin":19344..19408
SpriteFrame939:
	db $02,$00
	dw $0002
	dw 0,4,0,9
	dw $0040,$0000
	dw .tiles-SpriteFrame939
	db $3A,$8D,$3A,$8D
	dw 0,0,$0000 : db $00
	dw 0,8,$0001 : db $00
.tiles:
	incbin "SpriteFrames8E.bin":19444..19508
SpriteFrame940:
	db $02,$00
	dw $0002
	dw 0,7,0,9
	dw $0040,$0000
	dw .tiles-SpriteFrame940
	db $3C,$88,$3C,$88
	dw 0,0,$0000 : db $00
	dw 0,8,$0001 : db $00
.tiles:
	incbin "SpriteFrames8E.bin":19544..19608
SpriteFrame941:
	db $02,$00
	dw $0002
	dw 0,6,0,9
	dw $0040,$0000
	dw .tiles-SpriteFrame941
	db $36,$83,$36,$83
	dw 0,0,$0000 : db $00
	dw 0,8,$0001 : db $00
.tiles:
	incbin "SpriteFrames8E.bin":19644..19708
SpriteFrame942:
	db $02,$00
	dw $0002
	dw 0,7,0,9
	dw $0040,$0000
	dw .tiles-SpriteFrame942
	db $32,$7E,$32,$7E
	dw 0,0,$0000 : db $00
	dw 0,8,$0001 : db $00
.tiles:
	incbin "SpriteFrames8E.bin":19744..19808
SpriteFrame943:
	db $02,$00
	dw $0002
	dw 0,5,0,10
	dw $0040,$0000
	dw .tiles-SpriteFrame943
	db $30,$79,$30,$79
	dw 0,0,$0000 : db $00
	dw 0,8,$0001 : db $00
.tiles:
	incbin "SpriteFrames8E.bin":19844..19908
SpriteFrame944:
	db $02,$00
	dw $0002
	dw 0,7,0,9
	dw $0040,$0000
	dw .tiles-SpriteFrame944
	db $2D,$74,$2D,$74
	dw 0,0,$0000 : db $00
	dw 0,8,$0001 : db $00
.tiles:
	incbin "SpriteFrames8E.bin":19944..20008
SpriteFrame945:
	db $02,$00
	dw $0002
	dw 0,5,0,9
	dw $0040,$0000
	dw .tiles-SpriteFrame945
	db $2B,$6F,$2B,$6F
	dw 0,0,$0000 : db $00
	dw 0,8,$0001 : db $00
.tiles:
	incbin "SpriteFrames8E.bin":20044..20108
SpriteFrame946:
	db $02,$00
	dw $0002
	dw 0,4,0,9
	dw $0040,$0000
	dw .tiles-SpriteFrame946
	db $29,$6A,$29,$6A
	dw 0,0,$0000 : db $00
	dw 0,8,$0001 : db $00
.tiles:
	incbin "SpriteFrames8E.bin":20144..20208
SpriteFrame947:
	db $02,$00
	dw $0002
	dw 0,5,0,9
	dw $0040,$0000
	dw .tiles-SpriteFrame947
	db $28,$65,$28,$65
	dw 0,0,$0000 : db $00
	dw 0,8,$0001 : db $00
.tiles:
	incbin "SpriteFrames8E.bin":20244..20308
SpriteFrame948:
	db $02,$00
	dw $0002
	dw 0,5,0,9
	dw $0040,$0000
	dw .tiles-SpriteFrame948
	db $27,$60,$27,$60
	dw 0,0,$0000 : db $00
	dw 0,8,$0001 : db $00
.tiles:
	incbin "SpriteFrames8E.bin":20344..20408
SpriteFrame949:
	db $02,$00
	dw $0002
	dw 0,6,0,9
	dw $0040,$0000
	dw .tiles-SpriteFrame949
	db $28,$5B,$28,$5B
	dw 0,0,$0000 : db $00
	dw 0,8,$0001 : db $00
.tiles:
	incbin "SpriteFrames8E.bin":20444..20508

SpriteFrame950:
	db $02,$00
	dw $0002
	dw 0,7,0,9
	dw $0040,$0000
	dw .tiles-SpriteFrame950
	db $34,$56,$34,$56
	dw 0,0,$0000 : db $00
	dw 0,8,$0001 : db $00
.tiles:
	incbin "SpriteFrames8E.bin":20544..20608
SpriteFrame951:
	db $02,$00
	dw $0002
	dw 0,5,0,9
	dw $0040,$0000
	dw .tiles-SpriteFrame951
	db $33,$51,$33,$51
	dw 0,0,$0000 : db $00
	dw 0,8,$0001 : db $00
.tiles:
	incbin "SpriteFrames8E.bin":20644..20708
SpriteFrame952:
	db $02,$00
	dw $0002
	dw 0,5,0,9
	dw $0040,$0000
	dw .tiles-SpriteFrame952
	db $36,$4C,$36,$4C
	dw 0,0,$0000 : db $00
	dw 0,8,$0001 : db $00
.tiles:
	incbin "SpriteFrames8E.bin":20744..20808
SpriteFrame953:
	db $02,$00
	dw $0002
	dw 0,4,0,9
	dw $0040,$0000
	dw .tiles-SpriteFrame953
	db $34,$47,$34,$47
	dw 0,0,$0000 : db $00
	dw 0,8,$0001 : db $00
.tiles:
	incbin "SpriteFrames8E.bin":20844..20908
SpriteFrame954:
	db $01,$00
	dw $0001
	dw 1,3,7,9
	dw $0020,$0000
	dw .tiles-SpriteFrame954
	db $34,$46,$34,$46
	dw 1,7,$0000 : db $00
.tiles:
	incbin "SpriteFrames8E.bin":20937..20969
SpriteFrame955:
	db $02,$00
	dw $0002
	dw 0,7,0,9
	dw $0040,$0000
	dw .tiles-SpriteFrame955
	db $32,$7E,$32,$7E
	dw 0,0,$0000 : db $00
	dw 0,8,$0001 : db $00
.tiles:
	incbin "SpriteFrames8E.bin":21005..21069
SpriteFrame956:
	db $02,$00
	dw $0002
	dw 0,4,0,9
	dw $0040,$0000
	dw .tiles-SpriteFrame956
	db $FA,$FE,$FA,$FE
	dw 0,0,$0000 : db $00
	dw 0,8,$0001 : db $00
.tiles:
	incbin "SpriteFrames8E.bin":21105..21169
SpriteFrame957:
	db $02,$00
	dw $0002
	dw 0,3,0,9
	dw $0040,$0000
	dw .tiles-SpriteFrame957
	db $FA,$FE,$FA,$FE
	dw 0,0,$0000 : db $00
	dw 0,8,$0001 : db $00
.tiles:
	incbin "SpriteFrames8E.bin":21205..21269
SpriteFrame958:
	db $02,$00
	dw $0002
	dw 0,5,0,9
	dw $0040,$0000
	dw .tiles-SpriteFrame958
	db $FA,$FE,$FA,$FE
	dw 0,0,$0000 : db $00
	dw 0,8,$0001 : db $00
.tiles:
	incbin "SpriteFrames8E.bin":21305..21369
SpriteFrame959:
	db $02,$00
	dw $0002
	dw 0,5,0,9
	dw $0040,$0000
	dw .tiles-SpriteFrame959
	db $FA,$FE,$FA,$FE
	dw 0,0,$0000 : db $00
	dw 0,8,$0001 : db $00
.tiles:
	incbin "SpriteFrames8E.bin":21405..21469
SpriteFrame960:
	db $02,$00
	dw $0002
	dw 0,5,0,9
	dw $0040,$0000
	dw .tiles-SpriteFrame960
	db $FA,$FE,$FA,$FE
	dw 0,0,$0000 : db $00
	dw 0,8,$0001 : db $00
.tiles:
	incbin "SpriteFrames8E.bin":21505..21569
SpriteFrame961:
	db $02,$00
	dw $0002
	dw 0,4,0,9
	dw $0040,$0000
	dw .tiles-SpriteFrame961
	db $FA,$FE,$FA,$FE
	dw 0,0,$0000 : db $00
	dw 0,8,$0001 : db $00
.tiles:
	incbin "SpriteFrames8E.bin":21605..21669
SpriteFrame962:
	db $02,$00
	dw $0002
	dw 0,4,0,9
	dw $0040,$0000
	dw .tiles-SpriteFrame962
	db $FA,$FE,$FA,$FE
	dw 0,0,$0000 : db $00
	dw 0,8,$0001 : db $00
.tiles:
	incbin "SpriteFrames8E.bin":21705..21769
SpriteFrame963:
	db $02,$00
	dw $0002
	dw 0,5,0,9
	dw $0040,$0000
	dw .tiles-SpriteFrame963
	db $FA,$FE,$FA,$FE
	dw 0,0,$0000 : db $00
	dw 0,8,$0001 : db $00
.tiles:
	incbin "SpriteFrames8E.bin":21805..21869
SpriteFrame964:
	db $02,$00
	dw $0002
	dw 0,4,0,9
	dw $0040,$0000
	dw .tiles-SpriteFrame964
	db $FA,$FE,$FA,$FE
	dw 0,0,$0000 : db $00
	dw 0,8,$0001 : db $00
.tiles:
	incbin "SpriteFrames8E.bin":21905..21969
SpriteFrame965:
	db $02,$00
	dw $0002
	dw 0,4,0,9
	dw $0040,$0000
	dw .tiles-SpriteFrame965
	db $FA,$FE,$FA,$FE
	dw 0,0,$0000 : db $00
	dw 0,8,$0001 : db $00
.tiles:
	incbin "SpriteFrames8E.bin":22005..22069
SpriteFrame966:
	db $01,$00
	dw $0001
	dw -2,3,-4,-1
	dw $0020,$0000
	dw .tiles-SpriteFrame966
	db $FB,$F8,$FB,$F8
	dw -2,-4,$0200 : db $00
.tiles:
	incbin "SpriteFrames8E.bin":22098..22130
SpriteFrame967:
	db $01,$00
	dw $0001
	dw -2,3,-4,-1
	dw $0020,$0000
	dw .tiles-SpriteFrame967
	db $FB,$F8,$FB,$F8
	dw -2,-4,$0200 : db $00
.tiles:
	incbin "SpriteFrames8E.bin":22159..22191
SpriteFrame968:
	db $01,$00
	dw $0001
	dw -2,2,-3,-1
	dw $0020,$0000
	dw .tiles-SpriteFrame968
	db $FB,$F8,$FB,$F8
	dw -2,-3,$0200 : db $00
.tiles:
	incbin "SpriteFrames8E.bin":22220..22252
SpriteFrame969:
	db $01,$00
	dw $0001
	dw -2,3,-4,-1
	dw $0020,$0000
	dw .tiles-SpriteFrame969
	db $FB,$F8,$FB,$F8
	dw -2,-4,$0200 : db $00
.tiles:
	incbin "SpriteFrames8E.bin":22281..22313
SpriteFrame970:
	db $01,$00
	dw $0001
	dw -2,3,-4,-1
	dw $0020,$0000
	dw .tiles-SpriteFrame970
	db $FB,$F8,$FB,$F8
	dw -2,-4,$0200 : db $00
.tiles:
	incbin "SpriteFrames8E.bin":22342..22374
SpriteFrame971:
	db $01,$00
	dw $0001
	dw -1,2,-3,-1
	dw $0020,$0000
	dw .tiles-SpriteFrame971
	db $FC,$F8,$FC,$F8
	dw -1,-3,$0200 : db $00
.tiles:
	incbin "SpriteFrames8E.bin":22403..22435
SpriteFrame972:
	db $01,$00
	dw $0001
	dw -2,3,-4,-1
	dw $0020,$0000
	dw .tiles-SpriteFrame972
	db $FB,$F8,$FB,$F8
	dw -2,-4,$0200 : db $00
.tiles:
	incbin "SpriteFrames8E.bin":22464..22496
SpriteFrame973:
	db $01,$00
	dw $0001
	dw -2,3,-4,-1
	dw $0020,$0000
	dw .tiles-SpriteFrame973
	db $FB,$F8,$FB,$F8
	dw -2,-4,$0200 : db $00
.tiles:
	incbin "SpriteFrames8E.bin":22525..22557
SpriteFrame974:
	db $01,$00
	dw $0001
	dw -2,2,-3,-1
	dw $0020,$0000
	dw .tiles-SpriteFrame974
	db $FB,$F8,$FB,$F8
	dw -2,-3,$0200 : db $00
.tiles:
	incbin "SpriteFrames8E.bin":22586..22618
SpriteFrame975:
	db $01,$00
	dw $0001
	dw -2,2,0,1
	dw $0020,$0000
	dw .tiles-SpriteFrame975
	db $FB,$FA,$FB,$FA
	dw -2,0,$0200 : db $00
.tiles:
	incbin "SpriteFrames8E.bin":22647..22679
