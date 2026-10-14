; Unidentified routine.
CODE_80B0C8:
	ldy.w #$0016
	lda.b $14
	bit.w #$8000
	beq .t1
	jmp.w CODE_80B286

.t1:
	bit.w #$4000
	beq CODE_80B0DD
	jmp.w CODE_80B1A7
