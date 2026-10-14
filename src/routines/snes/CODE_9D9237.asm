; Unidentified routine.
CODE_9D9237:
	lda.b $83
	cmp.b $C1
	beq CODE_9D9221
	sta.b $C1
	ldx.w #$3622
	ldy.w #$007E
	jsl.l CODE_9D96A9
	lda.w #$007E
	sta.b $0E
	lda.w #$3614
	sta.b $0C
	ldy.w #$0010
	ldx.w #$0010
	jsl.l CODE_808723
	lda.w $0776
	ora.w $0778
	bit.w #$0200
	bne CODE_9D9274
	bit.w #$0100
	bne CODE_9D927C
	lda.b $B3
	bne CODE_9D9281
	jmp.w CODE_9D9221
