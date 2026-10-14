; Unidentified routine.
CODE_9FD633:
	and.w #$00FF
	bit.w #$0080
	beq CODE_9FD63E
	ora.w #$FF00
CODE_9FD63E:
	dec a
	asl a
	sta.b $B1
	lda.b $91
	beq CODE_9FD649
	lda.w #$0034
CODE_9FD649:
	clc
	adc.b $B1
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
	lda.b $95
	pha
	jsl.l CODE_9B9320
	lda.b $97
	sta.b $8F
	lda.b $95
	sta.b $8D
	pla
	sta.b $95
	pla
	sta.b $97
	lda.b $B5
	clc
	adc.w #$0006
	tay
	lda.b [$99],y
	and.w #$00FF
	asl a
	sta.b $A5
	lda.w #$0080
	sta.b $8B
	lda.w #$D646
	sta.b $89
	ldy.b $A5
	lda.b [$89],y
	clc
	adc.b $89
	sta.b $89
CODE_9FD69B:
	lda.b [$89]
	inc.b $89
	and.w #$00FF
	sta.b $A5
	bit.w #$0080
	bne CODE_9FD6C0
	ldy.b $A5
	lda.b [$8D],y
	and.w #$00FF
	sta.b $A5
	jsl.l TryAddPlayerToList
	beq CODE_9FD69B
CODE_9FD6B8:
	dec.b $B5
	bmi CODE_9FD6BF
	jmp.w CODE_9FD625
