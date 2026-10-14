; Build the playoff tree from the seeds and the series wins
maketree:
	stx.b xsave
	ldx.w #$0000
.loop:
	lda.b d0,x
	pha
	inx
	inx
	cpx.w #$0014
	bne .loop
	ldx.b xsave
	stx.b xsave
	ldx.w #$0000
.loop2:
	lda.b a0,x
	pha
	inx
	inx
	cpx.w #$0010
	bne .loop2
	ldx.b xsave
	lda.l $7E34D0
	asl a
	asl a
	asl a
	asl a
	sta.b d1
	lda.w #$007E
	sta.b $8B
	lda.w #$34D2
	sta.b a0
	lda.w #$ED59
	clc
	adc.b d1
	sta.b a1
	lda.w #$009C
	sta.b $8F
	ldy.w #$000E
	sty.b d2
.loop3:
	lda.b [a1],y
	sta.b [a0],y
	dey
	dey
	bpl .loop3
	lda.w #$34E2
	sta.b a1
	lda.b $8B
	sta.b $8F
	lda.w $0AD5
	sta.b d0
.loop4:
	lda.b d0
	and.w #$0001
	sta.b d1
	tay
	sep #$20
	lda.b [a0],y
	sta.b [a1]
	rep #$20
	inc.b a1
	inc.b a0
	inc.b a0
	lsr.b d0
	dec.b d2
	bpl .loop4
	jsl.l GetShifter
	lda.b d1
	bmi .1
	lda.b d2
	asl a
	adc.w #$34D2
	sta.b a0
	lda.w #$007E
	sta.b $8B
	stz.b a1
.loop5:
	ldx.b a1
	lda.w #$0000
	sta.l $7E3578,x
	sta.l $7E3588,x
	sta.l $7E3568,x
	lda.l $7E3598,x
	and.w #$FFFD
	sta.l $7E3598,x
	jsl.l .t2
	inc.b a1
	inc.b a1
	dec.b d1
	bpl .loop5
	jsl.l CODE_9D995D
.1:
	stx.b xsave
	ldx.w #$000E
.loop6:
	pla
	sta.b a0,x
	dex
	dex
	bpl .loop6
	ldx.b xsave
	stx.b xsave
	ldx.w #$0012
.loop7:
	pla
	sta.b d0,x
	dex
	dex
	bpl .loop7
	ldx.b xsave
	ldx.b a3
	rtl

.t2:
	lda.w $0ACF
	cmp.w #$0002
	beq .t1
	cmp.w #$0003
	beq .t1
	cmp.w #$0005
	beq .t1
	lda.l $7E3598,x
	ora.w #$0001
	sta.l $7E3598,x
	lda.b [a0]
	inc.b a0
	and.w #$00FF
	sta.l $7E3538,x
	lda.b [a0]
	inc.b a0
	and.w #$00FF
	sta.l $7E3528,x
	rtl

.t1:
	lda.l $7E3598,x
	and.w #$FFFE
	sta.l $7E3598,x
	lda.b [a0]
	inc.b a0
	and.w #$00FF
	sta.l $7E3528,x
	lda.b [a0]
	inc.b a0
	and.w #$00FF
	sta.l $7E3538,x
	rtl
