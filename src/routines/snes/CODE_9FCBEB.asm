; Unidentified routine.
CODE_9FCBEB:
	lda.w $19D4,y
	bmi CODE_9FCBF9
	tay
	lda.w $19F6,y
	cmp.w $19F6,x
	beq CODE_9FCC06
CODE_9FCBF9:
	ldy.w #$0000
	lda.w pfgoal,x
	bne CODE_9FCC04
	ldy.w #$0004
CODE_9FCC04:
	sty.b $00
CODE_9FCC06:
	lda.w #$0006
	sta.b $A9
	ldy.b $B5
	lda.w #$FFFF
	sta.b $AD
	ldx.w #$0000
	lda.w $1C84,y
	cmp.w #$0001
	beq CODE_9FCC20
	ldx.w #$000C
CODE_9FCC20:
	lda.w position,x
	bmi CODE_9FCC96
	beq CODE_9FCC96
	lda.w pflags,x
	bit.w #$1000
	bne CODE_9FCC96
	lda.w SPA,x
	cmp.w #SPAturnl
	bcc CODE_9FCC3C
	cmp.w #SPAturnr+1
	bcc CODE_9FCC51
CODE_9FCC3C:
	cmp.w #DATA8_9DF196
	bcc CODE_9FCC46
	cmp.w #SPAburst+1
	bcc CODE_9FCC51
CODE_9FCC46:
	lda.w pflags,x
	and.w #$1000
	ora.w pfalock,x
	bne CODE_9FCC96
CODE_9FCC51:
	lda.w $19D4,x
	bmi CODE_9FCC5A
	cmp.b $B5
	bne CODE_9FCC96
CODE_9FCC5A:
	stz.b $14
	lda.w puckc
	bmi CODE_9FCC86
	lda.b $00
	cmp.w #$0008
	beq CODE_9FCC86
	eor.w $0B5D,x
	cmp.w #$0004
	bcc CODE_9FCC76
	eor.w #$FFFF
	adc.w #$0008
CODE_9FCC76:
	cmp.w #$0000
	beq CODE_9FCC86
	dec a
	asl a
	asl a
	asl a
	asl a
	asl a
	clc
	adc.b $14
	sta.b $14
CODE_9FCC86:
	lda.w $0B1D,x
	clc
	adc.b $14
	bcs CODE_9FCC96
	cmp.b $AD
	bcs CODE_9FCC96
	stx.b $B1
	sta.b $AD
CODE_9FCC96:
	inx
	inx
	dec.b $A9
	bne CODE_9FCC20
	ldx.b $95
	lda.b $AD
	cmp.w #$FFFF
	beq CODE_9FCCFB
	ldy.b $B5
	lda.b $B1
	cmp.w $19EC,y
	bne CODE_9FCCF5
CODE_9FCCAE:
	lda.w pfalock,x
	bne CODE_9FCCFB
	lda.b $B5
	pha
	lda.b $B7
	pha
	lda.b $B9
	pha
	lda.b $BB
	pha
	lda.b $BD
	pha
	lda.b $BF
	pha
	lda.b $89
	pha
	lda.b $8B
	pha
	lda.b $8D
	pha
	lda.b $8F
	pha
	jsl.l CODE_9EA242
	pla
	sta.b $8F
	pla
	sta.b $8D
	pla
	sta.b $8B
	pla
	sta.b $89
	pla
	sta.b $BF
	pla
	sta.b $BD
	pla
	sta.b $BB
	pla
	sta.b $B9
	pla
	sta.b $B7
	pla
	sta.b $B5
	bra CODE_9FCCFB
