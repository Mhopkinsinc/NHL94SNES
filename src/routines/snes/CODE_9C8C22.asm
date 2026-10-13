; Unidentified routine.
CODE_9C8C22:
	phx
	phy
	lda.b $A5
	pha
	sep #$20
	lda.w $1DFB,y
	rep #$20
	and.w #$00FF
	tay
	sep #$20
	lda.w $1DFB,x
	rep #$20
	and.w #$00FF
	tax
	stx.w $1DC9
	lda.b $91
	beq CODE_9C8C47
CODE_9C8C44:
	lda.w #$001A
CODE_9C8C47:
	clc
	adc.w $1DC9
	tax
	sty.w $1DC9
	lda.b $91
	beq CODE_9C8C56
CODE_9C8C53:
	lda.w #$001A
CODE_9C8C56:
	clc
	adc.w $1DC9
	tay
	lda.w $1DF9
	cmp.w #$0001
	beq CODE_9C8C80
CODE_9C8C63:
	cmp.w #$0002
	beq CODE_9C8C91
	cmp.w #$0003
	beq CODE_9C8CA1
	cmp.w #$0004
	bne CODE_9C8C75
	jmp.w $8CE5
