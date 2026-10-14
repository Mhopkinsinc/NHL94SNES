; Unidentified routine.
CODE_9EB206:
	lda.w gmode
	bit.w #$0004
	bne CODE_9EB25F
	dec.b a0
	dec.b a0
	lda.b (a0)
	inc.b a0
	inc.b a0
	and.w #$00FF
	sta.b d0
	tay
	lda.w #$0080
	sta.b $8F
	lda.w #DATA8_80D3EB
	sta.b a1
	lda.b [a1],y
	clc
	adc.b a1
	sta.b a1
	lda.b [a1]
	and.w #$00FF
	beq CODE_9EB25B
	lda.w $0AD9
	bmi CODE_9EB2B5
	lsr a
	sec
	sbc.w #$0006
	sta.b d0
	dec.b a0
	lda.b (a0)
	inc.b a0
	and.w #$00FF
	bit.w #$0080
	beq CODE_9EB253
	ora.w #$FF00
CODE_9EB253:
	sec
	sbc.w #$0006
	eor.b d0
	bmi CODE_9EB2B5
CODE_9EB25B:
	jsl.l Stop4Pen
CODE_9EB25F:
	dec.b a0
	lda.b (a0)
	tay
	ora.w #$0080
	sta.b (a0)
	inc.b a0
	tya
	bit.w #$0080
	beq CODE_9EB274
	jmp.w CODE_9EB1F2
