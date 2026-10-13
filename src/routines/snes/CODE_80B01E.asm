; Unidentified routine.
CODE_80B01E:		; A = the first VRAM tile of the frame at [$0C], loaded now if needed; negative if there is no room
	ldy.w $07BA
	beq CODE_80B030
	ldx.w $07C6
	beq CODE_80B069
	ldx.w $07C4
	lda.w $2740,x
	bpl CODE_80B059
CODE_80B030:
	lda.b $14
	pha
	sep #$20
	lda.b #$80
	pha
	rep #$20
	lda.w #CODE_80B044-1
	pha
	phx
	phy
	phb
	jmp.w CODE_80B3E1
