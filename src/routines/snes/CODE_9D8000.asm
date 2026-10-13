; Unidentified routine.
CODE_9D8000:
	phx
	phy
	lda.l $7E35BC
	clc
	adc.l $7E35A8
	ora.w printa
	sta.b $C5
	lda.w #$009C
	sta.b $0E
	lda.w #$8086
	sta.b $0C
	jsr.w $804F
	lda.b $C9
	lsr a
	cmp.w $0CD5
	bcs CODE_9D8028
	sta.w $0CD5
CODE_9D8028:
	dec.b $A9
	dec.b $A9
CODE_9D802C:
	lda.w #$808C
	sta.b $0C
	jsr.w $804F
	dec.b $A9
	bne CODE_9D802C
	lda.w #$8092
	sta.b $0C
	jsr.w $804F
	inx
	inx
	txa
	lsr a
	cmp.w $0CD7
	bcc CODE_9D804C
	sta.w $0CD7
CODE_9D804C:
	ply
	plx
	rtl
