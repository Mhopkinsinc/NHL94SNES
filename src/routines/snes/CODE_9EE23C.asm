; Unidentified routine.
CODE_9EE23C:
	lda.w #$0001
	sta.b $01,s
	lda.w #$1000
	tsb.w sflags
	lda.w SPA,x
	cmp.w #SPAshotb
	bne CODE_9EE264
	lda.w #$0001
	sta.b $01,s
	lda.w passspeed
	lsr a
	lsr a
	eor.w #$FFFF
	inc a
	clc
	adc.w passspeed
	sta.w passspeed
CODE_9EE264:
	lda.w passspeed
	sta.w $0BC5
	cmp.w #$001E
	bcc CODE_9EE274
	lda.w #$0002
	sta.b $01,s
CODE_9EE274:
	lda.w $1363,x
	stx.b $89
	jsl.l CODE_9FDCEB
	adc.w #$0014
	tax
	lda.w passspeed
	jsl.l CODE_808F98
	ldx.b $08
	lda.w #$2570
	jsl.l Mul16U
	lda.b $0A
	sta.w passspeed
	lda.w $1E8B
	beq CODE_9EE2A5
	jsl.l CODE_9EC64B
	lda.w $1638
	sta.w $1E8B
CODE_9EE2A5:
	ldx.b $E4
	lda.w #$FFFF
	sta.w puckc
	lda.w #$0010
	sta.w nopuck,x
	txa
	lsr a
	sta.w $0CF3
	ldy.w #$0108
	lda.w pfgoal,x
	bne CODE_9EE2C3
	ldy.w #$FEF8
CODE_9EE2C3:
	sty.b $A9
	lda.w passdir
	asl a
	asl a
	tay
	lda.w #$009E
	sta.b $8B
	lda.w #DATA8_9EE43F
	sta.b $89
	lda.b [$89],y
	sec
	sbc.w puckx
	sta.b $A5
	iny
	iny
	lda.b [$89],y
	sta.b $AD
	pha
	lda.b $A9
	sec
	sbc.w pucky
	sta.b $A9
	pha
	lda.b $A5
	pha
	lda.b $A5
	ldy.b $A9
	jsl.l CODE_9CA554
	cmp.w #$0000
	bne CODE_9EE2FE
	inc a
CODE_9EE2FE:
	sta.b $B1
	lda.w gmode
	bit.w #$0010
	beq CODE_9EE30B
	jmp.w $E387
