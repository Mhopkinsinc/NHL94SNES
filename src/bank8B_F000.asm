; Bank $8B, last 4 KB: the last SpriteFrames frames of the bank (see bank82_8000), tiles from
; data/gfx/SpriteFrames8B.bin, then a song from the TeamSongs table (laid out as in bank81_F000) and $FF fill.

org $8BF142
SpriteFrame752:
	db $05,$80
	dw $000E
	dw -13,33,-14,6
	dw $0100,$00C0
	dw .tiles-SpriteFrame752
	db $19,$FC,$1C,$FB
	dw -13,-9,$0800 : db $FF
	dw 3,-9,$0802 : db $FF
	dw 19,-9,$0804 : db $FF
	dw 6,-17,$0806 : db $00
	dw 14,-17,$0807 : db $00
.tiles:
	incbin "data/gfx/SpriteFrames8B.bin":29051..29499
SpriteFrame753:
	db $05,$80
	dw $0011
	dw -18,17,-23,3
	dw $0120,$0100
	dw .tiles-SpriteFrame753
	db $0E,$02,$11,$F6
	dw -18,-23,$0800 : db $FF
	dw -2,-23,$0802 : db $FF
	dw -13,-7,$0804 : db $FF
	dw 3,-7,$0806 : db $FF
	dw 14,-15,$0808 : db $00
.tiles:
	incbin "data/gfx/SpriteFrames8B.bin":29556..30100
SpriteFrame754:
	db $06,$80
	dw $0012
	dw -24,23,-20,4
	dw $0140,$0100
	dw .tiles-SpriteFrame754
	db $14,$FC,$17,$F6
	dw -24,-16,$0800 : db $FF
	dw -8,-20,$0802 : db $FF
	dw 8,-20,$0804 : db $FF
	dw 8,-4,$0806 : db $FF
	dw -8,-4,$0808 : db $00
	dw 0,-4,$0809 : db $00
.tiles:
	incbin "data/gfx/SpriteFrames8B.bin":30164..30740
SpriteFrame755:
	db $06,$80
	dw $000F
	dw -31,25,-12,6
	dw $0100,$00E0
	dw .tiles-SpriteFrame755
	db $16,$FD,$19,$FC
	dw -15,-12,$0800 : db $FF
	dw 1,-12,$0802 : db $FF
	dw 17,-12,$0804 : db $FF
	dw -31,-4,$0806 : db $00
	dw -23,-4,$0807 : db $00
	dw 16,4,$0816 : db $00
.tiles:
	incbin "data/gfx/SpriteFrames8B.bin":30804..31284
SpriteFrame756:
	db $05,$80
	dw $0011
	dw -19,16,-24,6
	dw $0120,$0100
	dw .tiles-SpriteFrame756
	db $0E,$02,$11,$F5
	dw -11,-24,$0800 : db $FF
	dw 5,-24,$0802 : db $FF
	dw -19,-8,$0804 : db $FF
	dw -3,-8,$0806 : db $FF
	dw 13,0,$0808 : db $00
.tiles:
	incbin "data/gfx/SpriteFrames8B.bin":31341..31885
SpriteFrame757:
	db $07,$80
	dw $000D
	dw -29,23,-16,5
	dw $00E0,$00C0
	dw .tiles-SpriteFrame757
	db $14,$01,$17,$F9
	dw -13,-10,$0800 : db $FF
	dw 3,-10,$0802 : db $FF
	dw -29,-2,$0804 : db $00
	dw -21,-2,$0805 : db $00
	dw 19,-10,$0814 : db $00
	dw 19,-2,$0815 : db $00
	dw 2,-18,$0806 : db $00
.tiles:
	incbin "data/gfx/SpriteFrames8B.bin":31956..32372
DATA8_8BFE74:		; a song (see bank81_F000): header, track offsets ($0000 ends them), padding, then the tracks
	db $01,$78,$01,$00,$00,$00,$02,$00
	dw .left-DATA8_8BFE74,.right-DATA8_8BFE74,$0000
	db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	db $AA,"TRAK"
.left:
	db $00,$E7,$05,"left",$00
	db $00,$DC,$0B,$00,$96,$6E,$17,$29,$91,$6E,$15,$25,$93,$6E,$18,$22
	db $95,$6E,$15,$20,$96,$6E,$15,$21,$91,$6E,$13,$20,$93,$6E,$12,$1E
	db $95,$6E,$11,$1C,$96,$6E,$0F,$1C,$91,$6E,$0A,$1A,$93,$6E,$0A,$18
	db $95,$6E,$0B,$18,$96,$6E,$0A,$17,$91,$6E,$09,$15,$93,$6E,$0B,$14
	db $95,$6E,$0A,$14,$96,$6E,$0A,$13,$91,$6E,$09,$11,$93,$6E,$0A,$11
	db $95,$6E,$08,$0F,$96,$6E,$08,$0F,$91,$6E,$08,$0E,$93,$6E,$07,$0D
	db $95,$6E,$07,$0E,$96,$6E,$06,$0E,$91,$6E,$07,$0D,$93,$6E,$07,$0C
	db $95,$6E,$08,$0C,$96,$6E,$0B,$29,$A9,$6E,$09,$0E,$AE,$6E,$09,$0C
	db $B2,$6E,$09,$0D,$B5,$6E,$0C,$19,$B2,$6E,$0C,$0D,$B5,$6E,$45,$46
	db $D9,$00,$00,$00,$00,$00,$00,$00,$00,$79,$00,$00,$00
	db $AA,"TRAK"
.right:
	db $00,$E7,$06,"right",$00
	db $00,$DC,$0C,$00,$8A,$6E,$16,$29,$85,$6E,$17,$25,$87,$6E,$19,$22
	db $89,$6E,$13,$21,$8A,$6E,$13,$21,$85,$6E,$11,$1F,$87,$6E,$12,$1E
	db $89,$6E,$0F,$1C,$8A,$6E,$0E,$1C,$85,$6E,$0A,$1B,$87,$6E,$0B,$18
	db $89,$6E,$09,$17,$8A,$6E,$0B,$17,$85,$6E,$0A,$15,$87,$6E,$0A,$14
	db $89,$6E,$0A,$14,$8A,$6E,$0A,$13,$85,$6E,$09,$11,$87,$6E,$09,$10
	db $89,$6E,$09,$10,$8A,$6E,$08,$0F,$85,$6E,$08,$0F,$87,$6E,$07,$0C
	db $89,$6E,$07,$0E,$8A,$6E,$06,$0E,$85,$6E,$07,$0D,$87,$6E,$07,$0C
	db $89,$6E,$09,$0C,$8A,$6E,$0B,$29,$A9,$6E,$09,$0E,$AE,$6E,$09,$0C
	db $B2,$6E,$09,$0D,$B5,$6E,$0C,$19,$B2,$6E,$0C,$0D,$B5,$6E,$45,$46
	db $D9,$00,$00,$00,$00,$00,$00,$00,$00
	db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
