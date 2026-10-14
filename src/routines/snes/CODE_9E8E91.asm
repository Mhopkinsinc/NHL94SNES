; Unidentified routine.
CODE_9E8E91:
	cpx.w #$001C
	bne CODE_9E8E8B
	lda.w $0DF9
	cmp.w #$0021
	bpl CODE_9E8E8E
	lda.w $0DF9
	cmp.w #$0016
	bcc CODE_9E8E8B
	lda.w pucky
	cmp.w #$0112
	bmi CODE_9E8E8E
	lda.w $0D71
	cmp.w #$000D
	bmi CODE_9E8E8B
	lda.w $0D71
	cmp.w #$0010
	bpl CODE_9E8E8B
	lda.w puckvy
	cmp.w #$0FA0
	bmi CODE_9E8E8B
	phx
	lda.w puckvy
	pha
	asl a
	pla
	ror a
	sta.w puckvy
	inx
	inx
	stx.b a3
	lda.w #$F8E8
	sta.b d1
	jsl.l SetSPA
	plx
	stx.b a3
	lda.w #$0006
	jsl.l CODE_9C9A7F
	lda.l $7E35E0
	clc
	adc.w #$0258
	sta.l $7E35E0
	lda.w #$005A
	sta.b $81
	lda.w $19BE
	clc
	adc.w #$000F
	bmi CODE_9E8F05
	sta.w $19BE
CODE_9E8F05:
	lda.w #$0040
	tsb.w sflags
	sta.w $157F
	lda.w pucky
	bpl CODE_9E8F19
	lda.w #$8000
	tsb.w $0E1F
CODE_9E8F19:
	stz.w $0DB5
	lda.w gmclock
	bne CODE_9E8F37
	lda.l $7E30F6
	asl a
	sta.b a3
	tax
	lda.w #$0006
	sta.b d0
	jsl.l ShootoutWonBy
	ldx.w #$001C
	stx.b a3
CODE_9E8F37:
	jsl.l CODE_9EC791
	stz.w $1E8B
	stz.w $1E89
	rtl
