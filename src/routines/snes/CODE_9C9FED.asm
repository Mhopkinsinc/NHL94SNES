; Unidentified routine.
CODE_9C9FED:
	lda.w $0C23
	beq .5
	lda.w $0C29
	and.w #$0007
	sta.w $0C29
	lda.w $0C27
	sec
	sbc.w $0ADB
org $9CA002
	bpl .t1
	clc
	adc.w #$000B
	sta.w $0C27
	lda.w $0C25
	cmp.w #$0004
	beq .2
	lda.w $0C29
	inc a
	cmp.w #$0006
	bne .3
	lda.w $0C25
	inc a
	sta.w $0C25
	cmp.w #$0004
	beq .4
	lda.w #$0002
	bra .3

.t1:
	sta.w $0C27
	bra .4
.1:
	stz.w $0C23
	bra .5
.2:
	lda.w $0C29
	dec a
	bmi .1
.3:
	sta.w $0C29
.4:
	lda.w $0C23
	asl a
	asl a
	asl a
	adc.w $0C29
	sta.w $0C29
	rtl
.5:
	lda.w #$FFFF
	sta.w $0C29
	rtl
