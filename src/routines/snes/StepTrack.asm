; Track X: count down its wait, or play its events until the next wait
StepTrack:
	txa
	sta.b $4A
	asl a
	tax
	stx.w $07FF
CODE_80A877:
	rep #$20
	lda.w $0848,x
	beq .t1
	jmp.w CODE_80ABBF

.t1:
	lda.w $0804,x
	sta.b $4C
CODE_80A886:
	jsr.w ReadTrackEvent
	lda.b $56
	sta.b $4C
	ldx.w $07FF
	ldy.b $60
	cpy.b #$D9
	bcs .t1
	jmp.w CODE_80AB63

.t1:
	cpy.b #$D9
	beq .1
	cpy.b #$DA
	bne .t3
.1:
	jsl.l MusicStop
	jmp.w CODE_80ABC2

.t3:
	cpy.b #$E2
	bne .t1x
	lda.w $0804,x
	sta.w $0826,x
	jmp.w CODE_80ABA5

.t1x:
	cpy.b #$DB
	bne .t2
	lda.w $0826,x
	sta.w $0804,x
	bra CODE_80A877

.t2:
	cpy.b #$DD
	bne .t1xx
.1x:
	ldy.b $5A
	sty.w $07F6
	jmp.w CODE_80ABA5

.t1xx:
	cpy.b #$DE
	beq CODE_80A8D4
	jmp.w CODE_80A965
