; Unidentified routine.
CODE_9FC231:
	lda.b $A9
	bit.w #$4000
	bne CODE_9FC277
	lda.w pfalock,x
	bne CODE_9FC26C
	lda.b $A9
	bit.w #$0040
	bne CODE_9FC2BA
	bit.w #$8000
	bne CODE_9FC27B
	lda.w position,x
	beq CODE_9FC287
	lda.b $A9
	bit.w #$0020
	bne CODE_9FC27F
	bit.w #$0010
	bne CODE_9FC283
	lda.w $0D07
	cmp.b $E4
	beq CODE_9FC26C
	lda.b $A9
	bit.w #$0080
	bne CODE_9FC2B6
	jml.l doplayeracc
