; Unidentified routine.
CODE_9E9B52:
	lda.w $19BE
	clc
	adc.w #$000F
	bmi .1
	sta.w $19BE
.1:
	ldy.b a2
	cpy.w #$0018
	bcs .t1
	lda.w SPA,y
	cmp.w #$F90E
	beq .t1
	cmp.w #$F7B2
	beq .t1
	cmp.w #$F49C
	beq .t1
	cmp.w #$F54E
	beq .t1
	cmp.w #$F6C0
	beq .t1
	lda.w #$F7B2
	sta.b d1
	lda.w gmclock
	bne .t2
	lda.w $1403,y
	cmp.w #$000C
	bcc .t2
	lda.w $1223,y
	bne .t2
	lda.w $0792
	and.w #$000F
	adc.w #$000A
	sta.b d0
	sec
	sbc.w $0F23,y
	bmi .t2
	lda.w #$003C
	sta.w $1223,y
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
