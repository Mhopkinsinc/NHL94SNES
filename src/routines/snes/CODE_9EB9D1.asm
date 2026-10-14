; Unidentified routine.
CODE_9EB9D1:
	jsl.l ClearPenaltyBuffer
CODE_9EB9D5:
	ldy.b a2
	lda.w tmap,y
	ldy.b a1
	sec
	sbc.w tmap,y
	beq .3
	bmi .3
	lda.b a1
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
	bne .3
	lda.b a1
	beq .2
	lda.w #$0034
.2:
	clc
	adc.b d2
	tay
	lda.w tmpdst,y
	bit.w #$4000
	bne .loop
	lda.w #$0000
	sta.w tmpdst,y
	jsl.l RemovePlayerFromList
	ldy.b a1
	lda.w tmap,y
	inc a
	sta.w tmap,y
	ldy.b a2
	lda.w $1742,y
	inc a
	sta.w $1742,y
	lda.w #$0001
	tsb.w tmflags
	tsb.w $17E0
.3:
	pla
	sta.b $8B
	pla
	sta.b a0
	pla
	sta.b $AF
	pla
	sta.b d2
	pla
	sta.b $AB
	pla
	sta.b d1
	pla
	sta.b $A7
	pla
	sta.b d0
	rtl
