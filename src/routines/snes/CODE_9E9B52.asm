; Unidentified routine.
CODE_9E9B52:
	lda.w $19BE
	clc
	adc.w #$000F
	bmi FallDown
	sta.w $19BE
FallDown:
	ldy.b a2
	cpy.w #$0018
	bcs .t1
	lda.w SPA,y
	cmp.w #SPAinjury1
	beq .t1
	cmp.w #SPAstumble
	beq .t1
	cmp.w #SPAfallfwd
	beq .t1
	cmp.w #SPAfallback
	beq .t1
	cmp.w #SPAflip
	beq .t1
	lda.w #SPAstumble
	sta.b d1
	lda.w gmclock
	bne .t2
	lda.w stickhand,y
	cmp.w #$000C
	bcc .t2
	lda.w nopuckb,y
	bne .t2
	lda.w seed
	and.w #$000F
	adc.w #$000A
	sta.b d0
	sec
	sbc.w $0F23,y
	bmi .t2
	lda.w #$003C
	sta.w nopuckb,y
	jmp.w CODE_9E9D59

.t1:
	rtl

.t2:
	lda.w position,x
	beq .2
	stz.b a0
	lda.w pfteam,x
	beq .1x
	lda.w #$0002
	sta.b a0
.1x:
	lda.w gmclock
	bne .2
	ldy.b a0
	lda.w $17B6,y
	inc a
	sta.w $17B6,y
.2:
	ldy.b a2
	lda.w #$0078
	sta.w nopuck,y
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
