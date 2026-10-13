; Unidentified routine.
CODE_80A86F:
	txa
	sta.b $4A
	asl a
	tax
	stx.w $07FF
CODE_80A877:
	rep #$20
	lda.w $0848,x
	beq CODE_80A881
	jmp.w CODE_80ABBF
