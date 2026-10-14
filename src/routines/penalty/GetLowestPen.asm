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
	bne .t1
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

.t1:
	ldy.b a3
	lda.w tmap,y
	cmp.w #$0006
	beq .rtl
	lda.b d0
	sec
	sbc.b d3
	sta.b d0
	lda.b a3
	beq .1
	lda.w #$001A
.1:
	sta.b a0
.loop:
	ldy.b a0
	lda.w tmboxlist,y
	inc.b a0
	and.w #$00FF
	sta.b d2
	bit.w #$0080
	bne .rtl
	lda.b a3
	beq .2
	lda.w #$0034
.2:
	clc
	adc.b d2
	tay
	lda.w tmpdst,y
	bit.w #$4000
	bne .loop
	lda.b d0
	cmp.w tmpdst,y
	bmi .rtl
	lda.b d0
	clc
	adc.b d3
	sta.b d0
.rtl:
	rtl
