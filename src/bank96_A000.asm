; Bank $96, third 4 KB: the end of DATA8_969C09, then DATA8_96A103, tiles packed for DecompressPairs, then
; DATA8_96A5E5, LZ-packed tiles, then DATA8_96AA64, a block for the sound CPU (upload list DATA8_80DD16), then the
; start of DATA8_96AEBB, a song from the TeamSongs table (laid out as in bank81_F000).

org $96A000
	db $A3,$79,$02,$0A,$A3,$7D,$02,$00,$87,$77,$0D,$0B
	db $A3,$72,$02,$09,$A2,$7F,$06,$00,$8E,$7A,$0D,$0B,$A3,$77,$03,$0B
	db $A3,$7D,$02,$00,$87,$79,$0E,$0A,$A3,$7D,$02,$0A,$A3,$7E,$02,$00
	db $8E,$7D,$09,$0A,$A3,$79,$02,$0A,$A3,$7F,$02,$00,$87,$7A,$0E,$0A
	db $A3,$7B,$02,$0A,$A3,$7F,$02,$00,$8E,$7E,$0A,$0A,$A3,$7E,$02,$09
	db $A3,$7F,$02,$00,$87,$77,$0F,$0A,$A3,$7B,$02,$0A,$A3,$7F,$02,$00
	db $8E,$7B,$09,$09,$A3,$7A,$02,$0A,$A3,$79,$02,$00,$87,$77,$0E,$08
	db $A3,$7D,$02,$0B,$A4,$7F,$07,$00,$8C,$7B,$09,$0A,$A4,$73,$02,$09
	db $A4,$7E,$02,$00,$87,$79,$0D,$0A,$A4,$77,$02,$09,$A4,$7F,$02,$00
	db $8C,$7E,$0B,$0A,$A4,$7B,$02,$09,$A4,$7F,$02,$00,$87,$79,$0D,$09
	db $A4,$79,$02,$0A,$A6,$7F,$03,$00,$8E,$7D,$0D,$08,$A6,$7D,$02,$0A
	db $A6,$7F,$04,$00,$87,$79,$0E,$09,$A6,$7D,$02,$0A,$A6,$7F,$03,$00
	db $8E,$7E,$0B,$09,$A6,$7A,$03,$09,$A6,$7D,$03,$00,$87,$77,$0C,$0A
	db $AB,$7F,$03,$00,$A6,$79,$03,$09,$A8,$7F,$0B,$00,$8C,$7F,$0D,$37
	db $A4,$7F,$09,$09,$A9,$75,$0A,$09,$AD,$75,$0B,$0B,$B0,$7F,$06,$13
	db $AD,$75,$09,$0A,$B0,$7F,$81,$10,$49,$91,$75,$46,$47,$D9,$00,$00
	db $00,$00,$00,$00,$00,$00,$00
DATA8_96A103:		; tiles packed for DecompressPairs that screen setups in banks $9D and $9F send to VRAM; not identified yet
	db $46,$FB
	db $00,$0D,$40
	incbin "../Extracted/data/DATA8_96A103.chr.pairs":5..1250
DATA8_96A5E5:		; tiles packed for DecompressLZ that a screen setup in bank $9D sends to VRAM; not identified yet
	db $10,$FB
	db $00,$12,$C0
	incbin "../Extracted/data/DATA8_96A5E5.chr.lz":5..1151
DATA8_96AA64:		; for SPCUploadBlock, as DATA8_968000
	db $04,$53
	db $04,$53
	incbin "../Extracted/data/DATA8_96AA64.spc":4..1111
DATA8_96AEBB:		; a song (see bank81_F000): header, track offsets ($0000 ends them), padding, then the tracks
	db $01,$78,$01,$00,$00,$00,$02,$00
	dw .left-DATA8_96AEBB,.right-DATA8_96AEBB,$0000
	db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	db $02,$46,"TRAK"
.left:
	db $00,$E7,$05,"left",$00
	db $00,$DC,$0B,$00,$A8,$6E,$0D,$00,$AC,$6E,$07,$0C,$A9,$6E,$03,$00
	db $AD,$6E,$03,$0B,$AD,$6E,$02,$00,$A9,$6E,$02,$06,$AD,$6E,$02,$00
	db $A9,$6E,$02,$06,$AD,$6E,$02,$00,$A9,$6E,$02,$0B,$A9,$6E,$01,$05
	db $AD,$6E,$01,$05,$A9,$6E,$02,$00,$AD,$6E,$02,$0C,$A9,$6E,$01,$00
	db $AD,$6E,$01,$05,$AD,$6E,$01,$00,$A9,$6E,$02,$05,$A9,$6E,$01,$00
	db $AD,$6E,$01,$0C,$AD,$6E,$02,$00,$A9,$6E,$01,$0A,$A8,$6E,$01,$00
	db $AB,$6E,$02,$0B,$AB,$6E,$02,$00,$A8,$6E,$01,$05,$A8,$6E,$02,$00
	db $AB,$6E,$02,$06,$AB,$6E,$02,$00,$A8,$6E,$02,$0B,$A8,$6E,$01,$00
	db $AB,$6E,$01,$05,$A8,$6E,$02,$00,$AB,$6E,$02,$05,$A8,$6E,$03,$00
	db $AB,$6E,$02,$0B,$A8,$6E,$02,$0A,$A8,$6E,$07,$00,$A4,$6E,$06,$0A
	db $AB,$6E,$03,$00,$A8,$6E,$03,$0C,$AD,$6E,$02,$00,$A9,$6E,$02,$0A
	db $A9,$6E,$01,$00,$AD,$6E,$02,$06,$A9,$6E,$01,$00,$AD,$6E,$01,$05
	db $AD,$6E,$02,$00,$A9,$6E,$02,$0B,$AD,$6E,$01,$05,$AD,$6E,$01,$05
	db $A9,$6E,$06,$00,$AD,$6E,$06,$0B,$B0,$6E,$02,$00,$A9,$6E,$01,$0B
	db $B2,$6E,$07,$00,$A9,$6E,$04,$0C,$A9,$6E,$02,$0A,$A8,$6E,$05,$00
	db $AB,$6E,$08,$0A,$A9,$6E,$03,$0A,$A8,$6E,$03,$00,$A4,$6E,$03,$0B
	db $A1,$6E,$02,$0B,$A6,$6E,$1C,$00,$A1,$6E,$1B,$1B,$89
