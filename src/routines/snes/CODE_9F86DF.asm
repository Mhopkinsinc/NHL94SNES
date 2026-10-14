; Unidentified routine.
CODE_9F86DF:
	stx.w $0B9D
CODE_9F86E2:
	jsl.l CODE_9EA419
	lda.w $1203,x
	sec
	sbc.w $0ADB
	bpl CODE_9F86F2
	lda.w #$0000
CODE_9F86F2:
	sta.w $1203,x
	lda.w $1223,x
	sec
	sbc.w $0ADB
	bpl CODE_9F8701
	lda.w #$0000
CODE_9F8701:
	sta.w $1223,x
	lda.w sflags3
	bit.w #$0020
	beq CODE_9F8727
	lda.w pnum,x
	and.w #$00FF
	cmp.w #$0080
	bcc CODE_9F871A
	ora.w #$FF00
CODE_9F871A:
	sta.b d0
	cmp.w #$0000
	bmi CODE_9F8727
	asl.b d0
	jsl.l CODE_9FC757
CODE_9F8727:
	lda.w $0BEB,x
	beq CODE_9F8738
	sec
	sbc.w $0ADB
	bpl CODE_9F8735
	lda.w #$0000
CODE_9F8735:
	sta.w $0BEB,x
CODE_9F8738:
	cpx.w $0D07
	bne CODE_9F8742
	lda.w $1E89
	bne CODE_9F8796
CODE_9F8742:
	lda.w SPA,x
	cmp.w #$F90E
	bne CODE_9F874D
	jmp.w CODE_9F8834
