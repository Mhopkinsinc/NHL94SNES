; Unidentified routine.
CODE_9E9E59:
	ldy.b a2
	lda.w SPA,y
	cmp.w #SPAstumble
	beq .1
	lda.w #$FFFF
	sta.w puckc
.1:
	ldy.b a2
	lda.w pfteam,y
	bne .t1
	lda.w #$0003
	jsl.l CODE_9C9A7F
	rtl

.t1:
	lda.l $7E35E0
	clc
	adc.w #$0258
	sta.l $7E35E0
	lda.w #$002D
	sta.b $81
	rtl
