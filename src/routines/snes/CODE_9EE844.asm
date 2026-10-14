; Unidentified routine.
CODE_9EE844:
	lda.w #$0008
	sta.w passdir
CODE_9EE84A:
	lda.w #$0024
	sta.w passspeed
	sta.w $14E3,x
	lda.w $15D6
	bne CODE_9EE86C
	phy
	ldy.w #$0000
	cpx.w #$000C
	bmi CODE_9EE864
	ldy.w #$0002
CODE_9EE864:
	lda.w $17D6,y
	inc a
	sta.w $17D6,y
	ply
CODE_9EE86C:
	lda.w #$0001
	sta.w $1E89
	lda.w $19BE
	clc
	adc.w #$000A
	bmi CODE_9EE87E
	sta.w $19BE
CODE_9EE87E:
	lda.b $91
	pha
	stx.b $91
	jsl.l a2touchpuck
	pla
	sta.b $91
	jsl.l CODE_9EE220
	jmp.w CODE_9EE77E
