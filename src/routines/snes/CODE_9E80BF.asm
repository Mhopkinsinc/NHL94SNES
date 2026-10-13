; Unidentified routine.
CODE_9E80BF:
	lda.w #$0002
	sta.b $A9
	lda.b $AD
	cmp.w #$00E2
	bcs CODE_9E80D2
	stz.b $A9
	lda.w position,x
	beq CODE_9E814E
CODE_9E80D2:
	lda.w sflags
	bit.w #$2000
	beq CODE_9E80EC
	dec.b $A9
	dec.b $A9
	jsl.l chkpk2
	bne CODE_9E80EC
	inc.b $A9
	inc.b $A9
	inc.b $A9
	inc.b $A9
CODE_9E80EC:
	lda.w #$0014
	sec
	sbc.w aggress,x
	sta.b $A5
	lda.b $A9
	sta.b $C5
CODE_9E80F9:
	dec.b $C5
	bmi CODE_9E813D
	asl.b $A5
	bra CODE_9E80F9
