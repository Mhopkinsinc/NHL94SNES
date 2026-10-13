; Unidentified routine.
CODE_9FA476:
	lda.b $B1
	asl a
	sta.b $89
	tax
	lda.l $7E3598,x
	bit.w #$0006
	bne CODE_9FA461
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF867
	sta.b $8D
	jsl.l CODE_9EC7BE
	pla
	sta.b $8D
	pla
	sta.b $8F
	lda.w sflags
	bit.w #$0001
	bne CODE_9FA4C1
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF86C
	sta.b $8D
	jsl.l CODE_9EC7BE
	pla
	sta.b $8D
	pla
	sta.b $8F
CODE_9FA4C1:
	lda.w sfhormode
	bne CODE_9FA4D0
	lda.w printy
	sec
	sbc.w #$0005
	sta.w printy
CODE_9FA4D0:
	lda.w #$001C
	sta.b $A5
	lda.w #$0005
	sta.b $A9
	jsl.l CODE_9D8000
	lda.b $83
	sta.w $0D33
	inc.w printx
	lda.w printy
	sec
	sbc.w #$0004
	sta.w printy
	lda.w printx
	pha
	jsl.l GetShifter
	lda.w #$2400
	sta.w printa
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF871
	sta.b $8D
	jsl.l CODE_9EC7BE
	pla
	sta.b $8D
	pla
	sta.b $8F
	lda.b $01,s
	sta.w printx
	lda.l $7E35D4
	inc a
	sta.b $A5
	lda.l $7E34BC
	bne CODE_9FA52C
	stz.b $A5
CODE_9FA52C:
	lda.w #$0080
	sta.b $8F
	lda.w #GameLabels
	sta.b $8D
	jsl.l CODE_9ECFC6
	lda.b $01,s
	clc
	adc.w #$0015
	sta.w printx
	ldx.b $89
	lda.l $7E3568,x
	dec a
	sta.b $A5
	lda.w #$0080
	sta.b $8F
	lda.w #$D6E1
	sta.b $8D
	jsl.l CODE_9ECFC6
	lda.w #$2000
	sta.w printa
	ldx.b $89
	lda.l $7E3528,x
	sta.b $A5
	lda.l $7E3578,x
	sta.b $A9
	jsl.l CODE_9FA586
	ldx.b $89
	lda.l $7E3538,x
	sta.b $A5
	lda.l $7E3588,x
	sta.b $A9
	jsl.l CODE_9FA586
	pla
	rtl
