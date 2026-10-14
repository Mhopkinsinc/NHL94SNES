; Unidentified routine.
CODE_9C9D25:
	lda.w #$0000
	sta.w $1E33
	lda.w #$0000
	sta.w $1E31
	lda.w #$0000
	sta.w $1E37
	lda.w #$0000
	sta.w $1E35
	lda.w #$0000
	sta.w $1E3B
	lda.w #$0000
	sta.w $1E39
	lda.w #$FFFF
	sta.w $1E1F
	lda.w #$007E
	sta.b $8F
	lda.w #$3136
	sta.b a1
	ldy.w #$0000
	lda.b [a1],y
	and.w #$F000
	xba
	lsr a
	lsr a
	lsr a
	lsr a
	lsr a
	lsr a
	cmp.w #$0003
	bne CODE_9C9D8A
	iny
	iny
	iny
	lda.b [a1],y
	and.w #$00FF
	sta.w $1E1F
	dey
	lda.b [a1],y
	and.w #$00F0
	beq CODE_9C9D8A
	lda.w $1E1F
	clc
	adc.w #$001A
	sta.w $1E1F
CODE_9C9D8A:
	stz.b a2
	jsl.l GetPlayerCount
	lda.b d0
	sta.w $1E21
	jsl.l GoalieCount
	lda.b d0
	sta.w $1E23
	ldx.w #$0000
CODE_9C9DA1:
	phx
	cpx.w $1E21
	bmi CODE_9C9DAA
	jmp.w CODE_9C9E8E
