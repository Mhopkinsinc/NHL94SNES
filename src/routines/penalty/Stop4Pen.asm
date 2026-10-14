; Stop play for a penalty: stop the clock, set the face off spot and blow the whistle
Stop4Pen:
	lda.w #$FFFF
	tsb.w gmclock
	beq .t1
	jmp.w .6

.t1:
	stz.b d0
	stz.b d1
	dec.b a0
	dec.b a0
	lda.b (a0)
	inc.b a0
	inc.b a0
	and.w #$00FF
	cmp.w #$000E
	beq .1
	pha
	lda.l $7E30F8
	sta.b d0
	lda.l $7E30FA
	sta.b d1
	pla
	cmp.w #$0006
	beq .1
	ldy.w $0D71
	sty.b d0
	ldy.w pucky
	sty.b d1
	cmp.w #$000C
	bne .1
	dec.b a0
	lda.b (a0)
	inc.b a0
	and.w #$00FF
	asl a
	tay
	lda.w #$0258
	sta.b d1
	lda.w pfgoal,y
	beq .1
	lda.w #$FDA8
	sta.b d1
.1:
	lda.b d0
	sta.b tmp0
	sec
	sbc.w #$0046
	bmi .2
	lda.w #$0046
	sta.b d0
.2:
	lda.b d0
	sec
	sbc.w #$FFBA
	bpl .3
	lda.w #$FFBA
	sta.b d0
.3:
	lda.b d1
	sec
	sbc.w #$00A6
	bmi .4
	lda.w #$00CE
	sta.b d1
	lda.w #$0046
	sta.b d0
	lda.b tmp0
	bpl .4
	lda.w #$FFBA
	sta.b d0
.4:
	lda.b d1
	sec
	sbc.w #$FF5A
	bpl .5
	lda.w #$FF32
	sta.b d1
	lda.w #$0046
	sta.b d0
	lda.b tmp0
	bpl .5
	lda.w #$FFBA
	sta.b d0
.5:
	lda.b d0
	sta.l $7E3136
	lda.b d1
	sta.l $7E3138
	jsl.l limitfo
.6:
	lda.b $83
	sec
	sbc.w $0D2B
	cmp.w #$003C
	bcc .1x
.1x:
	lda.w $0CA9
	bne .2x
	lda.w #$001E
	sta.w $0CA9
.2x:
	lda.w #$7000
	sta.b $64
	lda.w #$0015
	jsl.l QueueSound
	stz.w Pencntdwn
	lda.w #$0004
	tsb.w gmode
	lda.w #$000A
	sta.b d0
	jml.l SetPA
