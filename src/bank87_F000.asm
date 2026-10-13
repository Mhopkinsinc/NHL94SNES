; Bank $87, last 4 KB: the last SpriteFrames frames of the bank (see bank82_8000), tiles from
; Extracted/data/SpriteFrames87.bin, then a small packed block from Extracted/data/DATA8_87FF91.lz and the last bytes.

org $87F18A
SpriteFrame462:
	db $04,$80
	dw $0010
	dw -11,23,-26,3
	dw $0100,$0100
	dw .tiles-SpriteFrame462
	db $16,$FB,$09,$05
	dw -2,-26,$0800 : db $FF
	dw 14,-26,$0802 : db $FF
	dw -11,-10,$0804 : db $FF
	dw 5,-10,$0806 : db $FF
.tiles:
	incbin "../Extracted/data/SpriteFrames87.bin":29116..29628
SpriteFrame463:
	db $07,$80
	dw $0010
	dw -11,16,-31,4
	dw $0100,$0100
	dw .tiles-SpriteFrame463
	db $0D,$FD,$00,$05
	dw -8,-31,$0800 : db $FF
	dw -11,-15,$0802 : db $FF
	dw 5,-15,$0804 : db $FF
	dw 8,-31,$0806 : db $00
	dw 8,-23,$0807 : db $00
	dw -5,1,$0816 : db $00
	dw 3,1,$0817 : db $00
.tiles:
	incbin "../Extracted/data/SpriteFrames87.bin":29699..30211
SpriteFrame464:
	db $06,$80
	dw $0012
	dw -9,17,-30,10
	dw $0140,$0100
	dw .tiles-SpriteFrame464
	db $10,$08,$01,$05
	dw -9,-30,$0800 : db $FF
	dw -9,-14,$0802 : db $FF
	dw 7,-22,$0804 : db $FF
	dw 7,0,$0806 : db $FF
	dw -9,2,$0808 : db $00
	dw -1,2,$0809 : db $00
.tiles:
	incbin "../Extracted/data/SpriteFrames87.bin":30275..30851
SpriteFrame465:
	db $06,$80
	dw $000F
	dw -10,21,-26,7
	dw $0100,$00E0
	dw .tiles-SpriteFrame465
	db $14,$06,$05,$04
	dw -3,-26,$0800 : db $FF
	dw -10,-10,$0802 : db $FF
	dw 6,-10,$0804 : db $FF
	dw 13,-26,$0806 : db $00
	dw 13,-18,$0807 : db $00
	dw 12,6,$0816 : db $00
.tiles:
	incbin "../Extracted/data/SpriteFrames87.bin":30915..31395
SpriteFrame466:
	db $06,$80
	dw $0012
	dw -17,10,-28,5
	dw $0140,$0100
	dw .tiles-SpriteFrame466
	db $06,$09,$00,$06
	dw -17,-28,$0800 : db $FF
	dw -1,-28,$0802 : db $FF
	dw -17,-12,$0804 : db $FF
	dw -1,-12,$0806 : db $FF
	dw -10,4,$0808 : db $00
	dw -2,4,$0809 : db $00
.tiles:
	incbin "../Extracted/data/SpriteFrames87.bin":31459..32035
SpriteFrame467:
	db $08,$80
	dw $0011
	dw -17,15,-27,7
	dw $0120,$0100
	dw .tiles-SpriteFrame467
	db $FF,$0C,$05,$05
	dw -17,-27,$0800 : db $FF
	dw -1,-27,$0802 : db $FF
	dw -14,-11,$0804 : db $FF
	dw 15,-19,$0806 : db $00
	dw 2,-11,$0807 : db $00
	dw 2,-3,$0816 : db $00
	dw 0,5,$0817 : db $00
	dw 8,5,$0808 : db $00
.tiles:
	incbin "../Extracted/data/SpriteFrames87.bin":32113..32657
DATA8_87FF91:		; packed for DecompressLZ: unpacked, three words (10, 12, 16) and then 10 x 12 bytes, a byte map. The
			;   screen setup in bank $9D unpacks it to $7F0000; its use is not traced yet
	db $10,$FB
	db $00,$00,$7E
	incbin "../Extracted/data/DATA8_87FF91.lz":5..106
	db $FF,$FF,$FF,$FF,$FF
