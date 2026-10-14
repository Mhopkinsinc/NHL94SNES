; Unidentified routine.
CODE_80ABC7:
	rep #$20
	lda.w $092A,x
	cmp.w #$E1C0
	bcc .1
	cmp.w #$E2B1
	bcs .1
	lda.w #$0000
	sta.l $7E35E8
	lda.w #$0000
	sta.l $7E35E6
.1:
	sep #$30
	lda.b #$00
	sta.w $08F2,y
	lda.b #$FF
	sta.w $08FA,y
	lda.b #$9F
	sta.b $5B
	jmp.w CODE_80A44A
