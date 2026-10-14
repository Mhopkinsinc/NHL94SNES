; d0 = the power play time left, from the penalty box times. a2 = team on the power play
GetLowestPen:
	stz.b d0
	stz.b d3
	lda.b a2
	beq .a
	lda.w #$001A
.a:
	sta.b a0
.top:
	ldy.b a0
	inc.b a0
	lda.w tmboxlist,y
	and.w #$00FF
	sta.b d2
	bit.w #$0080
	bne CODE_9EBBD7
	lda.b a2
	beq .h0
	lda.w #$0034
.h0:
	clc
	adc.b d2
	tay
	lda.w tmpdst,y
	sta.b d2
	bit.w #$4000
	bne .top
	lda.b d2
	sec
	sbc.b d3
	sta.b d2
	clc
	adc.b d0
	sta.b d0
	lda.b d2
	sta.b d3
	bra .top
