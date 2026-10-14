; Unidentified routine.
CODE_9BB19D:
	lda.b d1
	pha
	inc.w $0CB9
	sep #$20
	ldx.b a4
	stx.w WMADDL
	lda.b $9B
	sta.w WMADDH
	lda.b #$0F
	sta.b d1
	ldx.w #$0000
.loop:
	lda.w WMDATA
	sta.w Xpos,x
	lda.w WMDATA
	sta.b $14
	and.b #$0F
	bit.b #$08
	beq .1
	ora.b #$F0
.1:
	sta.w $0D56,x
	lda.w WMDATA
	sta.w Ypos,x
	lda.b $14
	lsr a
	lsr a
	lsr a
	lsr a
	bit.b #$08
	beq .2
	ora.b #$F0
.2:
	sta.w $0DB8,x
	lda.w WMDATA
	sta.w frame,x
	lda.w WMDATA
	sta.b $14
	and.b #$3F
	sta.w $0D98,x
	lda.w $0E04,x
	and.b #$E7
	sta.w $0E04,x
	lda.b $14
	lsr a
	lsr a
	lsr a
	and.b #$18
	ora.w $0E04,x
	sta.w $0E04,x
	inx
	inx
	dec.b d1
	bpl .loop
	lda.b #$05
	sta.b d1
	ldx.w #$0000
.loop2:
	lda.w WMDATA
	sta.w $13C3,x
	lda.w WMDATA
	sta.w $13C5,x
	stz.w $0F44,x
	lda.w WMDATA
	sta.b $14
	and.b #$0F
	cmp.b #$0F
	bne .3
	lda.b #$FF
	sta.w $0F44,x
.3:
	sta.w position,x
	stz.w $0F46,x
	lda.b $14
	lsr a
	lsr a
	lsr a
	lsr a
	and.b #$0F
	cmp.b #$0F
	bne .4
	lda.b #$FF
	sta.w $0F46,x
.4:
	sta.w $0F45,x
	inx
	inx
	inx
	inx
	dec.b d1
	bpl .loop2
	lda.w WMDATA
	sta.w $0DF9
	bpl .t1
	lda.b #$FF
	bra CODE_9BB262

.t1:
	lda.b #$00
CODE_9BB262:
	sta.w $0DFA
	lda.w WMDATA
	sta.w $0DFB
	bpl .t1
	lda.b #$FF
	bra CODE_9BB273

.t1:
	lda.b #$00
CODE_9BB273:
	sta.w $0DFC
	lda.w WMDATA
	sta.w $0CAD
	lda.w WMDATA
	sta.w $0CAF
	lda.w WMDATA
	sta.w $0CB0
	lda.w WMDATA
	sta.w $0CB2
	lda.w WMDATA
	sta.w $0CB3
	lda.w WMDATA
	sta.w $0CB5
	lda.w WMDATA
	sta.w $0CB6
	lda.w WMDATA
	sta.w $0CB8
	lda.w WMDATA
	sta.b d7
	lda.w WMDATA
	sta.b $14
	and.b #$0F
	sta.w $0AE7
	lda.b $14
	lsr a
	lsr a
	lsr a
	lsr a
	sta.w $0AE9
	lda.w WMDATA
	sta.b $14
	and.b #$0F
	sta.w $0AEB
	lda.b $14
	lsr a
	lsr a
	lsr a
	lsr a
	sta.w $0AED
	lda.w WMDATA
	sta.b $14
	and.b #$0F
	sta.w $0AEF
	lda.b $14
	lsr a
	lsr a
	lsr a
	lsr a
	sta.w $0AF1
	lda.w WMDATA
	sta.l $7E35E0
	lda.w WMDATA
	sta.l $7E35E1
	lda.w WMDATA
	sta.w PBnum
	bpl .t1
	lda.b #$FF
	bra CODE_9BB300

.t1:
	lda.b #$00
CODE_9BB300:
	sta.w $1625
	lda.w sflags
	bit.b #$20
	bne .t1
	lda.w WMDATA
	sta.w Hpos
	lda.w WMDATA
	sta.w $0CEC
	lda.w WMDATA
	sta.w Vpos
	lda.w WMDATA
	sta.w $0D38
	lda.w WMDATA
	sta.w $0C29
	lda.w WMDATA
	sta.w $0C2A
	bra CODE_9BB348

.t1:
	lda.w WMDATA
	lda.w WMDATA
	lda.w WMDATA
	lda.w WMDATA
	lda.w WMDATA
	sta.w $0C29
	lda.w WMDATA
	sta.w $0C2A
CODE_9BB348:
	rep #$20
	lda.w $0CAD
	and.w #$00FF
	cmp.w #$0080
	bcc .1
	ora.w #$FF00
.1:
	sta.w $0CAD
	lda.w $0CB3
	and.w #$00FF
	cmp.w #$0080
	bcc .2
	ora.w #$FF00
.2:
	sta.w $0CB3
	pla
	sta.b d1
	rtl
