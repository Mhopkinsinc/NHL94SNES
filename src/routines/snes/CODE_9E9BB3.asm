; Unidentified routine.
CODE_9E9BB3:
	lda.w position,x
	beq CODE_9E9BD2
	stz.b a0
	lda.w pfteam,x
	beq CODE_9E9BC4
	lda.w #$0002
	sta.b a0
CODE_9E9BC4:
	lda.w gmclock
	bne CODE_9E9BD2
	ldy.b a0
	lda.w $17B6,y
	inc a
	sta.w $17B6,y
CODE_9E9BD2:
	ldy.b a2
	lda.w #$0078
	sta.w $1203,y
	lda.w Xpos,x
	sec
	sbc.w Xpos,y
	sta.b d0
	lda.w Ypos,x
	sec
	sbc.w Ypos,y
	sta.b d1
	jsl.l vtoa
	lda.w Xpos,y
	cmp.w #$0068
	bpl CODE_9E9C16
	cmp.w #$FF98
	bmi CODE_9E9C43
	lda.w Ypos,y
	cmp.w #$0112
	bpl CODE_9E9C10
	cmp.w #$FEED
	bmi CODE_9E9C0D
CODE_9E9C0A:
	jmp.w CODE_9E9D0D
