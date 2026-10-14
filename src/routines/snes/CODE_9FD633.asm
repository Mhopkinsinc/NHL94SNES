; Unidentified routine.
CODE_9FD633:
	and.w #$00FF
	bit.w #$0080
	beq CODE_9FD63E
	ora.w #$FF00
CODE_9FD63E:
	dec a
	asl a
	sta.b d3
	lda.b a2
	beq CODE_9FD649
	lda.w #$0034
CODE_9FD649:
	clc
	adc.b d3
	tay
	lda.w tmpdst,y
	cmp.w #$FFFD
	beq CODE_9FD661
	cmp.w #$FFFC
	beq CODE_9FD661
	lda.w tmpdst,y
	bmi CODE_9FD6B8
	beq CODE_9FD6B8
CODE_9FD661:
	lda.b $97
	pha
	lda.b a3
	pha
	jsl.l CODE_9B9320
	lda.b $97
	sta.b $8F
	lda.b a3
	sta.b a1
	pla
	sta.b a3
	pla
	sta.b $97
	lda.b d4
	clc
	adc.w #$0006
	tay
	lda.b [a4],y
	and.w #$00FF
	asl a
	sta.b d0
	lda.w #$0080
	sta.b $8B
	lda.w #$D646
	sta.b a0
	ldy.b d0
	lda.b [a0],y
	clc
	adc.b a0
	sta.b a0
CODE_9FD69B:
	lda.b [a0]
	inc.b a0
	and.w #$00FF
	sta.b d0
	bit.w #$0080
	bne CODE_9FD6C0
	ldy.b d0
	lda.b [a1],y
	and.w #$00FF
	sta.b d0
	jsl.l TryAddPlayerToList
	beq CODE_9FD69B
CODE_9FD6B8:
	dec.b d4
	bmi CODE_9FD6BF
	jmp.w CODE_9FD625
