; Script code %h: the home city (the first team String)
ScoutHomeCity:
	lda.w tmdata
	sta.b a1
ScoutTeamCity:
	lda.w #$009C
	sta.b a1+2
	ldy.w #$0004
	lda.b a1
	clc
	adc.b [a1],y
	sta.b a1
ScoutAppend:
	lda.w #mesarea>>16
	sta.b a3+2
	lda.w #mesarea
	sta.b a3
	lda.w #$0002
	sta.b [a3]
	jsl.l appstring
	lda.w #mesarea>>16
	sta.b a1+2
	lda.w #mesarea
	sta.b a1
ScoutTypeText:
	ldy.w #$0003
.loop:
	lda.b [a1],y
	and.w #$00FF
	cmp.w #$0020
	bne .2
	lda.b [a1]
	pha
	tya
	dec a
	dec a
	sta.b d4
	tya
	sta.b [a1]
	lda.b a1
	pha
	jsl.l .3
	dec.w PlayerScrollCtr
	pla
	sta.b a1
	lda.b a1
	clc
	adc.b d4
	sta.b a1
	pla
	sec
	sbc.b d4
	sta.b [a1]
	lda.b d0
	cmp.w #$0015
	bmi .1
	lda.b d4
	sta.b d0
.1:
	ldy.w #$0002
.2:
	iny
	tya
	cmp.b [a1]
	bmi .loop
.3:
	inc.w PlayerScrollCtr
	lda.b d0
	clc
	adc.b [a1]
	dec a
	sta.b d0
	lda.b [a1]
	dec a
	tay
	dec a
	sta.b d1
	lda.b [a1],y
	and.w #$00FF
	beq .t1
	jmp.w ScoutTypeWord

.t1:
	dec.b d1
	jmp.w ScoutTypeWord
