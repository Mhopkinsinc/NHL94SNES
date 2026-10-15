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
	sty.b $46
	sta.b $3E
	stz.b $40
	stz.b $42
	stz.b $44
	ldy.b #$07
.loop:
	asl.b $3E
	rol.b $40
	lda.b $46
	beq .done
	lsr a
	sta.b $46
	bcc .next
	lda.b $42
	clc
	adc.b $3E
	sta.b $42
	lda.b $44
	adc.b $40
	sta.b $44
.next:
	dey
	bne .loop
.done:
	lda.b $43
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
	sta.b $43
	rts
