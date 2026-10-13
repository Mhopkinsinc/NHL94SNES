; Unidentified routine.
CODE_80A5B1:
	cpy.b #$D9
	beq CODE_80A60F
	cpy.b #$DA
	beq CODE_80A60F
	cpy.b #$DB
	beq CODE_80A60F
	cpy.b #$E3
	beq CODE_80A60F
	cpy.b #$DC
	beq CODE_80A5D5
	cpy.b #$EA
	beq CODE_80A5D5
	cpy.b #$DD
	beq CODE_80A5D5
	cpy.b #$DE
	beq CODE_80A5D5
	cpy.b #$E2
	bne CODE_80A5DF
CODE_80A5D5:
	lda.b [$56]
	inc.b $56
	tay
	sty.b $5A
	jmp.w CODE_80A60F
