; Bank $90, seventh 4 KB: the end of the song DATA8_90C20C (see bank90_C000), then the start of a block for the sound
; CPU from the sound upload list DATA8_80E6C1 (bank80_E000), from Extracted/data/DATA8_90E08C.spc.

org $90E000
	db $00,$8E,"TRAK"
.orch:
	db $00,$E7,$05,"orch",$00
	db $00,$DC,$13,$00,$DF,$07,$61,$60,$E2,$7F,$01,$39,$6B,$16,$17,$39
	db $28,$17,$18,$39,$0D,$17,$18,$39,$05,$17,$89,$18,$39,$37,$17,$18
	db $39,$1F,$17,$18,$39,$16,$17,$18,$39,$10,$17,$18,$39,$0E,$17,$18
	db $39,$0C,$17,$18,$39,$09,$17,$30,$39,$37,$17,$18,$39,$1F,$17,$18
	db $39,$16,$17,$18,$39,$10,$17,$18,$39,$0E,$17,$18,$39,$0C,$17,$18
	db $39,$09,$17,$03,$39,$09,$14,$8D,$0D,$3B,$58,$17,$18,$3B,$30,$17
	db $18,$3B,$25,$17,$18,$3B,$1B,$17,$18,$3B,$0B,$17,$18,$3B,$04,$17
	db $85,$08,$DB,$00,$D9,$00,$00,$00,$00,$00,$00,$00,$00,$7B
DATA8_90E08C:		; for SPCUploadBlock: sound RAM address, length (big-endian words), then the bytes
	db $1D,$52
	db $1D,$52
	incbin "../Extracted/data/DATA8_90E08C.spc":4..3956
