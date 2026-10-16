; A * Y / 128 into A and $43; bit 6 of $07E2 set: shift-and-add loop instead of the mode 7 multiplier
MulFrac16:
	bit.w Mode7InUse-1
	bvc .hw
	cpy.b #$00
	beq .zero
	cmp.w #$0000
	bne .soft
.zero:
	lda.w #$0000
	rts
.soft:
	sty.b MulPlier
	sta.b MulCand
	stz.b MulCand+2
	stz.b MulProd
	stz.b MulProd+2
	ldy.b #$07
.loop:
	asl.b MulCand
	rol.b MulCand+2
	lda.b MulPlier
	beq .done
	lsr a
	sta.b MulPlier
	bcc .next
	lda.b MulProd
	clc
	adc.b MulCand
	sta.b MulProd
	lda.b MulProd+2
	adc.b MulCand+2
	sta.b MulProd+2
.next:
	dey
	bne .loop
.done:
	lda.b MulProd+1
	rts
.hw:
	sep #$20
	sta.w M7A
	xba
	sta.w M7A
	sty.w M7B
	rep #$20
	lda.w MPYM
	asl a
	sta.b MulProd+1
	rts
