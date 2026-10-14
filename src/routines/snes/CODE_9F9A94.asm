; Unidentified routine.
CODE_9F9A94:
	ldx.b $08
	bne .t1
	tax
	lda.w #$000A
	bra CODE_9F9AA2

.t1:
	tax
	lda.w #$0007
CODE_9F9AA2:
	jsl.l DivX8U
	clc
	adc.b d0
	sta.b d0
	lda.b d0
	bpl CODE_9F9AB4
	stz.b d0
	lda.w #$0000
CODE_9F9AB4:
	sta.b d0
	plx
	lda.b $08
	beq CODE_9F9ABD
	lsr.b d0
CODE_9F9ABD:
	lda.b $A7
	bne .rtl
	lda.b d0
	cmp.w #$0064
	bcc .1
	lda.w #$0064
.1:
	cmp.w #$0032
	bcs .2
	lsr a
	clc
	adc.w #$0019
.2:
	sta.b d0
.rtl:
	rtl
