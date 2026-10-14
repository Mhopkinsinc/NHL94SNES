; Unidentified routine.
CODE_9FD352:
	jsl.l CODE_9FA669
	jsl.l CODE_9FE089
CODE_9FD35A:
	jsl.l CODE_9D8000
	dec.w printy
	dec.w printy
	inc.w printx
	lda.w #$0002
	sta.b d4
	lda.w printx
	pha
CODE_9FD370:
	lda.b $01,s
	sta.w printx
	lda.b d4
	sta.b d0
	jsl.l getlchoice
	lda.b d0
	bmi CODE_9FD3D8
	ldy.b a2
	lda.w tmflags,y
	bit.w #$0008
	bne CODE_9FD397
	lda.b d4
	cmp.w $17E6,y
	bne CODE_9FD3D5
	lda.w tmline,y
	sta.b d0
CODE_9FD397:
	lda.w #$0000
	sta.b $8F
	lda.w #mesarea
	sta.b a1
	lda.w #$0004
	sta.b [a1]
	phx
	ldx.b d4
	lda.l DATA8_9FD404,x
	plx
	and.w #$00FF
	ora.w #$2000
	ldy.w #$0002
	sta.b [a1],y
	jsl.l print
	lda.b d0
	pha
	lda.w #$0080
	sta.b $8F
	lda.w #$D6BE
	sta.b a1
	jsl.l CODE_9ECFC6
	pla
	sta.b d0
	jsl.l CODE_9FDFA6
CODE_9FD3D5:
	dec.w printy
CODE_9FD3D8:
	dec.b d4
	bpl CODE_9FD370
	pla
	clc
	adc.w #$0005
	sta.w printx
	ldy.b a2
	lda.w HomeTeam,y
	lda.w #$009C
	sta.b $8F
	lda.w tmdata,y
	sta.b a1
	ldy.w #$0004
	clc
	adc.b [a1],y
	sta.b a1
	clc
	adc.b [a1]
	sta.b a1
	jml.l print
