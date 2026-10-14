; Unidentified routine.
CODE_9E80BF:
	lda.w #$0002
	sta.b d1
	lda.b d2
	cmp.w #$00E2
	bcs .1
	stz.b d1
	lda.w position,x
	beq CODE_9E814E
.1:
	lda.w sflags
	bit.w #$2000
	beq .2
	dec.b d1
	dec.b d1
	jsl.l chkpk2
	bne .2
	inc.b d1
	inc.b d1
	inc.b d1
	inc.b d1
.2:
	lda.w #$0014
	sec
	sbc.w $1483,x
	sta.b d0
	lda.b d1
	sta.b tmp0
.loop:
	dec.b tmp0
	bmi CODE_9E813D
	asl.b d0
	bra .loop
