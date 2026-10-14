; Unidentified routine.
CODE_9DB44B:
	php
	rep #$30
	lda.w $0BFF
	bit.w #$0002
	beq .4
	bit.w #$0001
	bne .1
	lda.w $0BF1
	clc
	adc.w #$0C00
	sta.w $0BF1
	bcc .1
	inc.w $0BEF
.1:
	sep #$20
	lda.w $0BEF
	xba
	lda.w $0BF2
	rep #$20
	cmp.w #$0500
	bcc .2
	lda.w #$0001
	tsb.w $0BFF
	lda.w $0BFD
	eor.w #$0001
	sta.w $0BFD
	lda.w #$0000
.2:
	asl a
	tax
	lda.l $7F8000,x
	sta.w $0BFB
	lda.l $7F8A00,x
	ldy.w $0BFD
	beq .3
	eor.w #$FFFF
	inc a
.3:
	clc
	adc.w #$0190
	sta.w $0BF7
	lda.l $7F9400,x
	sta.w $0BF9
.4:
	plp
	rts
	lda.w JoyPad
	bit.w $0BEB
	beq .5
	lda.w #$0001
	sta.w $0BE9
.5:
	sep #$20
	lda.w $0AD3
	sta.w INIDISP
	lda.b #$17
	sta.w TM
	lda.b #$54
	sta.w BG1SC
	lda.b #$44
	sta.w BG12NBA
	lda.b #$C3
	sta.w W12SEL
	lda.w $0BD1
	sta.w BGMODE
	lda.w $0BCB
	sta.w WH1
	lda.w $0BCD
	sta.w WH3
	rep #$20
	lda.w #$009D
	sta.w $0791
	lda.w #$B50C
	sta.w $078F
	lda.w #$0046
	sta.w VTIMEL
	lda.w #$0000
	sta.w HTIMEL
	jsr.w CODE_9DB44B
	rtl
	sep #$20
	lda.w $0BCF
	sta.w WH3
	rep #$20
	lda.w #$009D
	sta.w $0791
	lda.w #$B52F
	sta.w $078F
	lda.w #$0050
	sta.w VTIMEL
	lda.w #$00A0
	sta.w HTIMEL
	rtl
	sep #$20
	lda.b #$07
	sta.w BGMODE
	lda.b #$00
	sta.w BG1SC
	lda.b #$00
	sta.w BG12NBA
	stz.w W12SEL
	lda.w $0BD3
	sta.w TM
	lda.w $0BF3
	sta.w M7X
	lda.w $0BF4
	sta.w M7X
	lda.w $0BF5
	sta.w M7Y
	lda.w $0BF6
	sta.w M7Y
	lda.w $0BF7
	sta.w BG1HOFS
	lda.w $0BF8
	sta.w BG1HOFS
	lda.w $0BF9
	sta.w BG1VOFS
	lda.w $0BFA
	sta.w BG1VOFS
	lda.w $0BFB
	sta.w M7A
	lda.w $0BFC
	sta.w M7A
	lda.w $0BFB
	sta.w M7D
	lda.w $0BFC
	sta.w M7D
	rep #$20
	lda.w #$009D
	sta.w $0791
	lda.w #$B5AC
	sta.w $078F
	lda.w #$00B0
	sta.w VTIMEL
	lda.w #$0000
	sta.w HTIMEL
	rtl
	sep #$20
	lda.b #$11
	sta.w TM
	rep #$20
	rtl
