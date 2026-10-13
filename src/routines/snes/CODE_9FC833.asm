; Unidentified routine.
CODE_9FC833:
	lda.l $7E35D4
	cmp.w #$0002
	bcs CODE_9FC87B
	jsl.l GetShifter
	lda.b $A9
	asl a
	sta.b $89
CODE_9FC845:
	lda.b $A9
	cmp.l $7E35D6
	beq CODE_9FC873
	ldx.b $89
	lda.l $7E3598,x
	bit.w #$0004
	bne CODE_9FC873
	lda.w #$0000
	sta.l $7E3568,x
	lda.w #$0003
	jsl.l CODE_9BB385
	inc a
	sta.b $A5
	bra CODE_9FC86F
