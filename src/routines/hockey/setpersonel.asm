; Put team a2's wanted players on the ice, keeping the ones already there
setpersonel:
	stx.b xsave
	ldx.w #$0000
.save:
	lda.b d0,x
	pha
	inx
	inx
	cpx.w #$0018
	bne .save
	ldx.b xsave
	stx.b xsave
	ldx.w #$0000
.savea:
	lda.b a0,x
	pha
	inx
	inx
	cpx.w #$0014
	bne .savea
	ldx.b xsave
	ldy.b a2
	ldx.w tmsort,y
	stx.b a3
	lda.w #$0005
	sta.b d4
.l0:
	lda.w #$FFFF
	sta.w newpos,x
	sta.w newpnum,x
	inx
	inx
	stx.b a3
	dec.b d4
	bpl .l0
	jsl.l SetPlList
	lda.w #$0005
	sta.b d4
	lda.w #PlList>>16
	sta.b a4+2
	lda.w #PlList
	sta.b a4
CODE_9FD459:
	ldy.b d4
	lda.b [a4],y
	and.w #$00FF
	sta.b d5
	beq CODE_9FD4BE
	dec.b d5
	lda.w #$0005
	sta.b d3
	ldy.b a2
	ldx.w tmsort,y
	dex
	dex
.2:
	inx
	inx
	stx.b a3
	lda.w pnum,x
	and.w #$00FF
	sta.b tmp0
	lda.b d5
	and.w #$00FF
	cmp.b tmp0
	beq .t1
	dec.b d3
	bpl .2
	bra CODE_9FD4BE

.t1:
	lda.b d4
	clc
	adc.w #$0006
	tay
	lda.b [a4],y
	and.w #$00FF
	bit.w #$0080
	beq .1
	ora.w #$FF00
.1:
	sta.w newpos,x
	lda.b d5
	and.w #$00FF
	bit.w #$0080
	beq .2x
	ora.w #$FF00
.2x:
	sta.w newpnum,x
	ldy.b d4
	sep #$20
	lda.b #$00
	sta.b [a4],y
	rep #$20
CODE_9FD4BE:
	dec.b d4
	bpl CODE_9FD459
	lda.w #$0005
	sta.b d4
	lda.w #$007E
	sta.b $9B
	lda.w #$3114
	sta.b a4
CODE_9FD4D1:
	ldy.b d4
	lda.b [a4],y
	and.w #$00FF
	sta.b d5
	beq CODE_9FD53A
	dec.b d5
	lda.w #$0005
	sta.b d3
	ldy.b a2
	ldx.w tmsort,y
	dex
	dex
CODE_9FD4EA:
	inx
	inx
	stx.b a3
	lda.w newpnum,x
	bit.w #$0080
	bne .t1
	dec.b d3
	bpl CODE_9FD4EA
	bra CODE_9FD4FE

.t1:
	stx.b a0
CODE_9FD4FE:
	lda.w position,x
	bpl .1
	dec.b d3
	bpl CODE_9FD4EA
.1:
	lda.b d4
	clc
	adc.w #$0006
	tay
	lda.b [a4],y
	and.w #$00FF
	bit.w #$0080
	beq .2
	ora.w #$FF00
.2:
	ldy.b a0
	sta.w newpos,y
	lda.b d5
	and.w #$00FF
	bit.w #$0080
	beq .3
	ora.w #$FF00
.3:
	sta.w newpnum,y
	ldy.b d4
	sep #$20
	lda.b #$00
	sta.b [a4],y
	rep #$20
CODE_9FD53A:
	dec.b d4
	bpl CODE_9FD4D1
	stx.b xsave
	ldx.w #$0012
.loop:
	pla
	sta.b a0,x
	dex
	dex
	bpl .loop
	ldx.b xsave
	stx.b xsave
	ldx.w #$0016
.loop2:
	pla
	sta.b d0,x
	dex
	dex
	bpl .loop2
	ldx.b xsave
	ldx.b a3
	rtl
