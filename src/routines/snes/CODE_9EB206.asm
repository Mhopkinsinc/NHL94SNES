; Unidentified routine.
CODE_9EB206:
	lda.w gmode
	bit.w #$0004
	bne CODE_9EB25F
	dec.b $89
	dec.b $89
	lda.b ($89)
	inc.b $89
	inc.b $89
	and.w #$00FF
	sta.b $A5
	tay
	lda.w #$0080
	sta.b $8F
	lda.w #DATA8_80D3EB
	sta.b $8D
	lda.b [$8D],y
	clc
	adc.b $8D
	sta.b $8D
	lda.b [$8D]
	and.w #$00FF
	beq CODE_9EB25B
	lda.w puckc
	bmi CODE_9EB2B5
	lsr a
	sec
	sbc.w #$0006
	sta.b $A5
	dec.b $89
	lda.b ($89)
	inc.b $89
	and.w #$00FF
	bit.w #$0080
	beq CODE_9EB253
	ora.w #$FF00
CODE_9EB253:
	sec
	sbc.w #$0006
	eor.b $A5
	bmi CODE_9EB2B5
CODE_9EB25B:
	jsl.l CODE_9EB2C9
CODE_9EB25F:
	dec.b $89
	lda.b ($89)
	tay
	ora.w #$0080
	sta.b ($89)
	inc.b $89
	tya
	bit.w #$0080
	beq CODE_9EB274
	jmp.w $B1F2
