; Unidentified routine.
CODE_9FA1B8:
	lda.b a2
	beq .1
	lda.w #$001A
.1:
	sta.b a0
.loop:
	ldy.b a0
	lda.w tmboxlist,y
	inc.b a0
	and.w #$00FF
	sta.b d0
	bit.w #$0080
	bne .t1
	lda.b a2
	beq .2
	lda.w #$0034
.2:
	clc
	adc.b d0
	tay
	lda.w tmpdst,y
	bit.w #$4000
	bne .loop
	jsl.l pplpen
	bra .loop

.t1:
	lda.b a2
	beq .1x
	lda.w #$001A
.1x:
	sta.b a0
.loopx:
	ldy.b a0
	lda.w tmboxlist,y
	inc.b a0
	and.w #$00FF
	sta.b d0
	bit.w #$0080
	bne CODE_9FA1B7
	lda.b a2
	beq .2x
	lda.w #$0034
.2x:
	clc
	adc.b d0
	tay
	lda.w tmpdst,y
	bit.w #$4000
	beq .loopx
	jsl.l pplpen
	bra .loopx
