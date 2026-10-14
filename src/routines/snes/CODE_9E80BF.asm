; Unidentified routine.
CODE_9E80BF:
	lda.w #$0002
	sta.b d1
	lda.b d2
	cmp.w #$00E2
	bcs CODE_9E80D2
	stz.b d1
	lda.w position,x
	beq CODE_9E814E
CODE_9E80D2:
	lda.w sflags
	bit.w #$2000
	beq CODE_9E80EC
	dec.b d1
	dec.b d1
	jsl.l chkpk2
	bne CODE_9E80EC
	inc.b d1
	inc.b d1
	inc.b d1
	inc.b d1
CODE_9E80EC:
	lda.w #$0014
	sec
	sbc.w $1483,x
	sta.b d0
	lda.b d1
	sta.b tmp0
CODE_9E80F9:
	dec.b tmp0
	bmi CODE_9E813D
	asl.b d0
	bra CODE_9E80F9
