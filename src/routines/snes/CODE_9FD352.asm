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
	sta.b $B5
	lda.w printx
	pha
CODE_9FD370:
	lda.b $01,s
	sta.w printx
	lda.b $B5
	sta.b $A5
	jsl.l getlchoice
	lda.b $A5
	bmi CODE_9FD3D8
	ldy.b $91
	lda.w tmflags,y
	bit.w #$0008
	bne CODE_9FD397
	lda.b $B5
	cmp.w tmlcchoice,y
	bne CODE_9FD3D5
	lda.w tmline,y
	sta.b $A5
CODE_9FD397:
	lda.w #$0000
	sta.b $8F
	lda.w #$0A2A
	sta.b $8D
	lda.w #$0004
	sta.b [$8D]
	phx
	ldx.b $B5
	lda.l DATA8_9FD404,x
	plx
	and.w #$00FF
	ora.w #$2000
	ldy.w #$0002
	sta.b [$8D],y
	jsl.l CODE_9EC7BE
	lda.b $A5
	pha
	lda.w #$0080
	sta.b $8F
	lda.w #$D6BE
	sta.b $8D
	jsl.l CODE_9ECFC6
	pla
	sta.b $A5
	jsl.l linebar
CODE_9FD3D5:
	dec.w printy
CODE_9FD3D8:
	dec.b $B5
	bpl CODE_9FD370
	pla
	clc
	adc.w #$0005
	sta.w printx
	ldy.b $91
	lda.w HomeTeam,y
	lda.w #$009C
	sta.b $8F
	lda.w tmdata,y
	sta.b $8D
	ldy.w #$0004
	clc
	adc.b [$8D],y
	sta.b $8D
	clc
	adc.b [$8D]
	sta.b $8D
	jml.l CODE_9EC7BE
