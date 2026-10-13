; Unidentified routine.
CODE_80A697:
	php
	rep #$20
	lda.w $086A,x
	beq CODE_80A6BB
	sta.b $4E
	cmp.w #$DF80
	beq CODE_80A6AB
	cmp.w #$DFB0
	bne CODE_80A6B1
CODE_80A6AB:
	lda.b $5E
	bmi CODE_80A6BB
	beq CODE_80A6BB
CODE_80A6B1:
	sep #$30
	jsr.w CODE_80A610
	stx.b $4B
	txa
	bpl CODE_80A6BD
CODE_80A6BB:
	plp
	rts
