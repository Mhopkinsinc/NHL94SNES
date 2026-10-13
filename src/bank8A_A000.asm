; Bank $8A, third 4 KB: SpriteFrames continued (see bank82_8000), tiles from data/gfx/SpriteFrames8A.bin.

org $8AA099
SpriteFrame632:
	db $07,$80
	dw $000D
	dw -13,7,-22,15
	dw $00E0,$00C0
	dw .tiles-SpriteFrame632
	db $F5,$0D,$F5,$0D
	dw -12,-22,$0800 : db $FF
	dw -12,-6,$0802 : db $FF
	dw 4,-22,$0804 : db $00
	dw 4,-14,$0805 : db $00
	dw 4,-6,$0814 : db $00
	dw 4,2,$0815 : db $00
	dw -13,10,$0806 : db $00
.tiles:
	incbin "data/gfx/SpriteFrames8A.bin":8416..8832
SpriteFrame633:
	db $05,$80
	dw $000E
	dw -21,6,-18,10
	dw $0100,$00C0
	dw .tiles-SpriteFrame633
	db $EC,$0A,$EC,$0A
	dw -13,-18,$0800 : db $FF
	dw -21,-2,$0802 : db $FF
	dw -5,-2,$0804 : db $FF
	dw 3,-18,$0806 : db $00
	dw 3,-10,$0807 : db $00
.tiles:
	incbin "data/gfx/SpriteFrames8A.bin":8889..9337
SpriteFrame634:
	db $04,$80
	dw $000D
	dw -19,5,-22,11
	dw $00E0,$00C0
	dw .tiles-SpriteFrame634
	db $EE,$0A,$EE,$0A
	dw -10,-22,$0800 : db $FF
	dw -10,-6,$0802 : db $FF
	dw -26,-3,$0804 : db $FF
	dw -18,-11,$0806 : db $00
.tiles:
	incbin "data/gfx/SpriteFrames8A.bin":9387..9803
SpriteFrame635:
	db $07,$80
	dw $0010
	dw -25,10,-21,10
	dw $0100,$0100
	dw .tiles-SpriteFrame635
	db $E8,$09,$E8,$09
	dw -18,-21,$0800 : db $FF
	dw -25,-5,$0802 : db $FF
	dw -9,-5,$0804 : db $FF
	dw -2,-21,$0806 : db $00
	dw -2,-13,$0807 : db $00
	dw 7,-5,$0816 : db $00
	dw 7,3,$0817 : db $00
.tiles:
	incbin "data/gfx/SpriteFrames8A.bin":9874..10386
SpriteFrame636:
	db $04,$80
	dw $000D
	dw -23,6,-22,9
	dw $00E0,$00C0
	dw .tiles-SpriteFrame636
	db $EA,$09,$EA,$09
	dw -15,-22,$0800 : db $FF
	dw -23,-6,$0802 : db $FF
	dw -7,-6,$0804 : db $FF
	dw 1,-14,$0806 : db $00
.tiles:
	incbin "data/gfx/SpriteFrames8A.bin":10436..10852
SpriteFrame637:
	db $03,$80
	dw $000C
	dw -24,7,-21,6
	dw $00C0,$00C0
	dw .tiles-SpriteFrame637
	db $E9,$03,$E9,$03
	dw -24,-9,$0800 : db $FF
	dw -8,-9,$0802 : db $FF
	dw -14,-25,$0804 : db $FF
.tiles:
	incbin "data/gfx/SpriteFrames8A.bin":10895..11279
SpriteFrame638:
	db $03,$80
	dw $000C
	dw -25,4,-23,6
	dw $00C0,$00C0
	dw .tiles-SpriteFrame638
	db $E8,$03,$E8,$03
	dw -15,-23,$0800 : db $FF
	dw -25,-7,$0802 : db $FF
	dw -9,-7,$0804 : db $FF
.tiles:
	incbin "data/gfx/SpriteFrames8A.bin":11322..11706
SpriteFrame639:
	db $06,$80
	dw $000F
	dw -25,10,-22,7
	dw $0100,$00E0
	dw .tiles-SpriteFrame639
	db $E8,$02,$E8,$02
	dw -14,-22,$0800 : db $FF
	dw -25,-6,$0802 : db $FF
	dw -9,-6,$0804 : db $FF
	dw 2,-14,$0806 : db $00
	dw 7,-6,$0807 : db $00
	dw 7,2,$0816 : db $00
.tiles:
	incbin "data/gfx/SpriteFrames8A.bin":11770..12250
SpriteFrame640:
	db $03,$80
	dw $000C
	dw -23,8,-24,4
	dw $00C0,$00C0
	dw .tiles-SpriteFrame640
	db $EA,$FE,$EA,$FE
	dw -23,-11,$0800 : db $FF
	dw -7,-11,$0802 : db $FF
	dw -11,-27,$0804 : db $FF
.tiles:
	incbin "data/gfx/SpriteFrames8A.bin":12293..12677
