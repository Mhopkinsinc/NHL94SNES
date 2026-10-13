; Unidentified routine.
CODE_9F9559:
	bvs CODE_9F95C2
CODE_9F955B:
	jsl.l GetShifter
	lda.b $A9
	asl a
	sta.b $89
CODE_9F9564:
	ldx.b $89
	lda.b $A9
	cmp.l $7E35D6
	beq CODE_9F95A1
	lda.w #$0004
	cmp.l $7E3548,x
	beq CODE_9F95A1
	cmp.l $7E3558,x
	beq CODE_9F95A1
	lda.l $7E3548,x
	inc a
	sta.l $7E3548,x
	jsl.l RandomWord
	lsr a
	bcc CODE_9F9564
	lda.l $7E3548,x
	dec a
	sta.l $7E3548,x
	lda.l $7E3558,x
	inc a
	sta.l $7E3558,x
	bra CODE_9F9564
