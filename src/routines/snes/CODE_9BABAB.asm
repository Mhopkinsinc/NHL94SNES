; Unidentified routine.
CODE_9BABAB:
	lda.w $0CAB
	bpl .t2
	jmp.w CODE_80AC3E

.t2:
	tax
	lda.w Xpos,x
	sta.w $0D75
	cmp.w $0CBD
	bpl .t1
	lda.w $0CBD
	sec
	sbc.w #$0004
	cmp.w $0D75
	bpl .2
.1:
	lda.w $0D75
.2:
	bra CODE_9BABDF

.t1:
	lda.w $0CBD
	clc
	adc.w #$0004
	cmp.w $0D75
	bmi CODE_9BABDF
	lda.w $0D75
CODE_9BABDF:
	cmp.w #$FFC0
	bpl .1
	lda.w #$FFC0
.1:
	cmp.w #$0040
	bmi .2
	lda.w #$0040
.2:
	sta.w Hpos
	sta.w $0CBD
	lda.w Ypos,x
	sta.w $0DD7
	cmp.w $0CBF
	bpl .t1
	lda.w $0CBF
	sec
	sbc.w #$0004
	cmp.w $0DD7
	bpl .4
.3:
	lda.w $0DD7
.4:
	bra CODE_9BAC20

.t1:
	lda.w $0CBF
	clc
	adc.w #$0004
	cmp.w $0DD7
	bmi CODE_9BAC20
	lda.w $0DD7
CODE_9BAC20:
	cmp.w #$FF39
	bpl .2
.1:
	lda.w #$FF39
.2:
	cmp.w #$0100
	bmi .4
.3:
	lda.w #$0100
.4:
	sta.w Vpos
	sta.w $0CBF
	txa
	lsr a
	sta.w $0AF3
	jmp.w CODE_9BACCD

.t1:
	cmp.w #$FFFF
	beq CODE_9BACC1
	lda.w $0D75
	cmp.w $0CBD
	bpl .t2
	lda.w $0CBD
	sec
	sbc.w #$0002
	cmp.w $0D75
	bpl .1x
	lda.w $0D75
.1x:
	bra CODE_9BAC6B

.t2:
	lda.w $0CBD
	clc
	adc.w #$0002
	cmp.w $0D75
	bmi CODE_9BAC6B
	lda.w $0D75
CODE_9BAC6B:
	cmp.w #$FFC0
	bpl .1
	lda.w #$FFC0
.1:
	cmp.w #$0040
	bmi .2
	lda.w #$0040
.2:
	sta.w Hpos
	sta.w $0CBD
	lda.w $0DD7
	cmp.w $0CBF
	bpl .t1
	lda.w $0CBF
	sec
	sbc.w #$0002
	cmp.w $0DD7
	bpl .3
	lda.w $0DD7
.3:
	bra CODE_9BACA9

.t1:
	lda.w $0CBF
	clc
	adc.w #$0002
	cmp.w $0DD7
	bmi CODE_9BACA9
	lda.w $0DD7
CODE_9BACA9:
	cmp.w #$FF39
	bpl .2
.1:
	lda.w #$FF39
.2:
	cmp.w #$0100
	bmi .4
.3:
	lda.w #$0100
.4:
	sta.w Vpos
	sta.w $0CBF
	bra CODE_9BACCD
