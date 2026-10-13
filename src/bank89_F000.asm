; Bank $89, last 4 KB: the last SpriteFrames frames of the bank (see bank82_8000), tiles from
; Extracted/data/SpriteFrames89.bin, then a packed palette from Extracted/data/DATA8_89FFC7.pal.lz and $FF fill.

org $89F1BF
SpriteFrame605:
	db $05,$80
	dw $000E
	dw -16,8,-23,8
	dw $0100,$00C0
	dw .tiles-SpriteFrame605
	db $F8,$02,$F0,$FD
	dw -15,-23,$0800 : db $FF
	dw -16,-7,$0802 : db $FF
	dw 0,-7,$0804 : db $FF
	dw 1,-23,$0806 : db $00
	dw 1,-15,$0807 : db $00
.tiles:
	incbin "../Extracted/data/SpriteFrames89.bin":29176..29624
SpriteFrame606:
	db $03,$80
	dw $000C
	dw -12,18,-20,5
	dw $00C0,$00C0
	dw .tiles-SpriteFrame606
	db $0C,$00,$11,$FB
	dw -12,-10,$0800 : db $FF
	dw 4,-10,$0802 : db $FF
	dw -7,-26,$0804 : db $FF
.tiles:
	incbin "../Extracted/data/SpriteFrames89.bin":29667..30051
SpriteFrame607:
	db $05,$80
	dw $000E
	dw -18,16,-21,9
	dw $0100,$00C0
	dw .tiles-SpriteFrame607
	db $F5,$01,$EF,$FB
	dw -16,-21,$0800 : db $FF
	dw -18,-5,$0802 : db $FF
	dw -2,-5,$0804 : db $FF
	dw 0,-13,$0806 : db $00
	dw 14,-5,$0807 : db $00
.tiles:
	incbin "../Extracted/data/SpriteFrames89.bin":30108..30556
SpriteFrame608:
	db $04,$80
	dw $0010
	dw -16,17,-19,7
	dw $0100,$0100
	dw .tiles-SpriteFrame608
	db $0C,$02,$11,$00
	dw -16,-19,$0800 : db $FF
	dw 0,-19,$0802 : db $FF
	dw -11,-3,$0804 : db $FF
	dw 5,-3,$0806 : db $FF
.tiles:
	incbin "../Extracted/data/SpriteFrames89.bin":30606..31118
SpriteFrame609:
	db $07,$80
	dw $0010
	dw -20,13,-21,7
	dw $0100,$0100
	dw .tiles-SpriteFrame609
	db $FB,$FD,$F6,$F9
	dw -14,-21,$0800 : db $FF
	dw -20,-5,$0802 : db $FF
	dw -4,-5,$0804 : db $FF
	dw 2,-21,$0806 : db $00
	dw 2,-13,$0807 : db $00
	dw 12,-5,$0816 : db $00
	dw 12,3,$0817 : db $00
.tiles:
	incbin "../Extracted/data/SpriteFrames89.bin":31189..31701
SpriteFrame610:
	db $05,$80
	dw $000E
	dw -15,10,-18,13
	dw $0100,$00C0
	dw .tiles-SpriteFrame610
	db $05,$08,$00,$07
	dw -15,-18,$0800 : db $FF
	dw 1,-18,$0802 : db $FF
	dw -13,-2,$0804 : db $FF
	dw 3,-2,$0806 : db $00
	dw 3,6,$0807 : db $00
.tiles:
	incbin "../Extracted/data/SpriteFrames89.bin":31758..32206
SpriteFrame611:
	db $05,$80
	dw $000E
	dw -12,15,-23,8
	dw $0100,$00C0
	dw .tiles-SpriteFrame611
	db $03,$F6,$FF,$F4
	dw -12,-23,$0800 : db $FF
	dw 4,-23,$0802 : db $FF
	dw -12,-7,$0804 : db $FF
	dw 4,-7,$0806 : db $00
	dw 4,1,$0807 : db $00
.tiles:
	incbin "../Extracted/data/SpriteFrames89.bin":32263..32711
DATA8_89FFC7:		; packed for DecompressLZ: unpacked, BGR555 colours. A screen setup in bank $9D unpacks it and loads
			;   its first 16 colours into colours $40-$4F; the screen is not identified yet
	db $10,$FB
	db $00,$01,$00
	incbin "../Extracted/data/DATA8_89FFC7.pal.lz":5..45
	db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
