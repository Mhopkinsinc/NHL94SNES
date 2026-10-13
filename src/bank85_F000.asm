; Bank $85, last 4 KB: the last SpriteFrames frames of the bank (see bank82_8000), tiles from
; Extracted/data/SpriteFrames85.bin, then 33 bytes of data to the end of the bank.

org $85F0B4
SpriteFrame297:
	db $05,$80
	dw $0011
	dw -16,12,-22,16
	dw $0120,$0100
	dw .tiles-SpriteFrame297
	db $F2,$03,$00,$07
	dw -13,1,$0800 : db $FF
	dw 3,1,$0802 : db $FF
	dw -15,-15,$0804 : db $FF
	dw 1,-15,$0806 : db $FF
	dw -16,-23,$0808 : db $00
.tiles:
	incbin "../Extracted/data/SpriteFrames85.bin":28909..29453
SpriteFrame298:
	db $06,$80
	dw $0012
	dw -12,13,-26,18
	dw $0140,$0100
	dw .tiles-SpriteFrame298
	db $02,$E9,$01,$03
	dw -9,-26,$0800 : db $FF
	dw -12,-10,$0802 : db $FF
	dw 4,-10,$0804 : db $FF
	dw -10,6,$0806 : db $FF
	dw 6,6,$0808 : db $00
	dw 6,14,$0809 : db $00
.tiles:
	incbin "../Extracted/data/SpriteFrames85.bin":29517..30093
SpriteFrame299:
	db $05,$80
	dw $000B
	dw -15,10,-18,13
	dw $00C0,$00A0
	dw .tiles-SpriteFrame299
	db $F4,$0D,$00,$04
	dw -15,-18,$0800 : db $FF
	dw -12,-2,$0802 : db $FF
	dw 1,-10,$0804 : db $00
	dw 4,-2,$0805 : db $00
	dw 4,6,$0814 : db $00
.tiles:
	incbin "../Extracted/data/SpriteFrames85.bin":30150..30502
SpriteFrame300:
	db $05,$80
	dw $000E
	dw -16,10,-17,15
	dw $0100,$00C0
	dw .tiles-SpriteFrame300
	db $F2,$0C,$01,$0A
	dw -5,-13,$0800 : db $FF
	dw -5,3,$0802 : db $FF
	dw -21,-17,$0804 : db $FF
	dw -13,0,$0806 : db $00
	dw -13,8,$0807 : db $00
.tiles:
	incbin "../Extracted/data/SpriteFrames85.bin":30559..31007
SpriteFrame301:
	db $06,$80
	dw $0012
	dw -17,13,-27,14
	dw $0140,$0100
	dw .tiles-SpriteFrame301
	db $FB,$04,$01,$08
	dw -5,-27,$0800 : db $FF
	dw -16,-11,$0802 : db $FF
	dw 0,-11,$0804 : db $FF
	dw -17,5,$0806 : db $FF
	dw -1,5,$0808 : db $00
	dw 7,5,$0809 : db $00
.tiles:
	incbin "../Extracted/data/SpriteFrames85.bin":31071..31647
SpriteFrame302:
	db $06,$80
	dw $0012
	dw -17,22,-26,15
	dw $0140,$0100
	dw .tiles-SpriteFrame302
	db $13,$EA,$01,$01
	dw 7,-26,$0800 : db $FF
	dw 7,-9,$0802 : db $FF
	dw -9,-15,$0804 : db $FF
	dw -9,1,$0806 : db $FF
	dw -17,1,$0808 : db $00
	dw -17,9,$0809 : db $00
.tiles:
	incbin "../Extracted/data/SpriteFrames85.bin":31711..32287
SpriteFrame303:
	db $06,$80
	dw $000C
	dw -13,9,-25,13
	dw $00C0,$00C0
	dw .tiles-SpriteFrame303
	db $F7,$08,$02,$05
	dw -13,-2,$0800 : db $FF
	dw -9,-18,$0802 : db $FF
	dw 3,-2,$0804 : db $00
	dw 3,6,$0805 : db $00
	dw 7,-10,$0814 : db $00
	dw -10,-26,$0815 : db $00
.tiles:
	incbin "../Extracted/data/SpriteFrames85.bin":32351..32735
DATA8_85FFDF:		; a long pointer table in bank $9D points here, just after its packed per-team entries; no reader
			;   found. Its 16 words look like the 16-colour tables the next pointers lead to, which share its first words
	dw $7C1F,$4EFE,$C6BD,$BE7B,$3239,$29F8,$9DB6,$9575
	dw $0D33,$0911,$04EF,$808A,$8027,$037C,$0000,$77BD
	db $FF
