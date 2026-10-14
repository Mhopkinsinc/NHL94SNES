; Unidentified routine.
CODE_80B069:
	lda.b $0C
	cmp.w $2540,x
	bne .1
	lda.b $0E
	cmp.w $2640,x
	beq CODE_80B05F
.1:
	inx
	inx
	dey
	bne CODE_80B069
	bra CODE_80B030

.t1:		; DrawSprite with the frame at [$0C]
	sta.b $14
	stx.b $1C
	sty.b $1E
	phb
	pea.w $7E7E
	plb
	plb
	jmp.w CODE_80B0B0
