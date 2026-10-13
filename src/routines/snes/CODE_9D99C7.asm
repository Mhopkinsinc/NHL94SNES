; Unidentified routine.
CODE_9D99C7:
	stz.b $A5
	lda.l $7E3538,x
	sta.l $7E34C0
CODE_9D99D1:
	lda.b $A5
	clc
	adc.l $7E34CE
	sta.b $A5
	lda.b $A9
	sta.l $7E35D6
	lda.l $7E3528,x
	sta.w HomeTeam
	lda.l $7E3538,x
	sta.w VisTeam
	asl.b $A5
	asl.b $A5
	phb
	phk
	plb
	ldy.b $A5
	ldx.w #$0000
CODE_9D99FA:
	lda.w $1C84,x
	beq CODE_9D9A05
	lda.w DATA8_9D9A28,y
	sta.w $1C84,x
CODE_9D9A05:
	inx
	inx
	cpx.w #$000A
	bcc CODE_9D99FA
	plb
	rtl
