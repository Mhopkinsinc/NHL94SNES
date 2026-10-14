; Unidentified routine.
CODE_9EB274:
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
	ldy.w #$0001
	lda.b [a1],y
	and.w #$00FF
	asl a
	asl a
	asl a
	asl a
	asl a
	sta.b d1
	sec
	sbc.w Pencntdwn
	beq CODE_9EB2B1
	bmi CODE_9EB2B1
	lda.b d1
	sta.w Pencntdwn
CODE_9EB2B1:
	jmp.w CODE_9EB1F2
