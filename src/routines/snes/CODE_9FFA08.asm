; Unidentified routine.
CODE_9FFA08:
	ldy.w #$0000
.loop:
	lda.b [$0C],y
	sta.b [$10],y
	iny
	iny
	cpy.w #$0020
	bmi .loop
	rts
	rep #$30
	lda.b $C3
	bit.w #$0080
	beq .t1
	jsl.l CODE_9FF92E
	lda.w #$0080
	trb.b $C3
	jmp.w .3

.t1:
	lda.b $C3
	bit.w #$0008
	beq .3
	lda.b $0C
	pha
	lda.b $0E
	pha
	lda.b tmp2
	sta.b $0C
	lda.b $CB
	sta.b $0E
	ldy.b tmp0
	ldx.b tmp1
	jsl.l CODE_808723
	lda.b $C3
	bit.w #$0200
	beq .2
.1:
	lda.b $D1
	sta.b $0C
	lda.b $D3
	sta.b $0E
	ldy.b $CD
	ldx.b $CF
	jsl.l CODE_808723
.2:
	pla
	sta.b $0E
	pla
	sta.b $0C
	lda.w #$0208
	trb.b $C3
.3:
	lda.b $C3
	bit.w #$0010
	beq .1x
	sep #$20
	lda.b $D5
	sta.w BG1HOFS
	lda.b $D6
	sta.w BG1HOFS
	lda.b $D7
	sta.w BG1VOFS
	lda.b $D8
	sta.w BG1VOFS
	rep #$20
	lda.w #$0010
	trb.b $C3
.1x:
	lda.b $C3
	bit.w #$0040
	beq .rtl
	sep #$20
	lda.b $D9
	sta.w M7A
	lda.b $DA
	sta.w M7A
	lda.b $DB
	sta.w M7D
	lda.b $DC
	sta.w M7D
	rep #$20
	lda.w #$0040
	trb.b $C3
.rtl:
	rtl
