; Unidentified routine.
CODE_9FC2CE:
	lda.w pfalock,x
	bne CODE_9FC26C
	jsl.l CODE_9EC417
	lda.w position,x
	bne CODE_9FC2E1
	lda.w $1543,x
	bne CODE_9FC298
CODE_9FC2E1:
	lda.w sflags
	bit.w #$0004
	bne CODE_9FC311
	bit.w #$0008
	bne CODE_9FC315
	lda.w $0BA3
	cmp.b $E4
	beq CODE_9FC371
	lda.b d1
	bit.w #$8000
	bne CODE_9FC322
	bit.w #$4000
	bne CODE_9FC319
	lda.w position,x
	beq CODE_9FC32E
	lda.b d1
	bit.w #$0080
	bne CODE_9FC32A
	jml.l CODE_9EA8A9
