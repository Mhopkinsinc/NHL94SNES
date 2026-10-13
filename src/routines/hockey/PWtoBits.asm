; Unidentified routine.
PWtoBits:
	jsl.l CODE_9BCD8F
	ldx.w #$0000
CODE_9BCD70:
	lda.w #$001E
	sta.b $A5
	jsl.l CODE_9CA4CF
	lda.l $7E34F4,x
	and.w #$00FF
	sta.b $A5
	stz.b $A7
	jsl.l SuperAdd
	inx
	cpx.w #$0010
	bne CODE_9BCD70
	rtl
