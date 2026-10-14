; Unidentified routine.
CODE_9EF042:
	lda.w gmode
	bit.w #$0010
	beq .t1
	jmp.w CODE_9EF1CA

.t1:
	stz.b d2
	lda.w $0DF9
	cmp.w #$0008
	bpl .1
	inc.b d2
	inc.b d2
.1:
	lda.w #$0000
	sec
	sbc.b d0
	sta.b d0
	lda.w #$0000
	sec
	sbc.b d1
	sta.b d1
	jsl.l vtoa
	ldy.b a2
	lda.b d0
	sec
	sbc.w facedir,y
	and.w #$0007
	sta.b d0
	and.w #$0003
	sta.b d1
	bne .2
	lda.w $0792
	sta.b d0
.2:
	lda.b d0
	and.w #$0004
	lsr a
	lsr a
	eor.w #$0001
	clc
	adc.b d2
	asl a
	sta.b d2
	lda.w $1443,y
	sta.b d1
	lda.b d2
	beq .3
	lda.w $13A3,y
	sta.b d1
	lda.b d2
	cmp.w #$0002
	beq .3
	lda.w $13E3,y
	sta.b d1
	lda.b d2
	cmp.w #$0004
	beq .3
	lda.w $1423,y
	sta.b d1
.3:
	lda.b d1
	clc
	adc.w #$000F
	sta.b d1
	lda.w attribute,y
	bit.w #$0800
	beq .4
	lda.b d2
	eor.w #$0002
	sta.b d2
.4:
	lda.w $0D97,y
	sec
	sbc.w #$0296
	cmp.w #$0010
	bcs .t2
	lda.w $0DF9
	cmp.w #$0005
	bmi .t2
	jmp.w CODE_9EF1CA

.t2:
	jsl.l ChkShotStat
	jsl.l a2touchpuck
	lda.w #$0006
	jsl.l CODE_9C9ABC
	lda.w puckvy
	cmp.w #$3000
	bpl .1x
	cmp.w #$D000
	bpl .5
.1x:
	lda.w $19BE
	clc
	adc.w #$000A
	bmi .2x
	sta.w $19BE
.2x:
	ldy.b a2
	lda.w pfteam,y
	beq .t1x
	lda.w #$0004
	jsl.l CODE_9C9A7F
	bra .5

.t1x:
	lda.l crowdlevel
	clc
	adc.w #$0258
	sta.l crowdlevel
	lda.w #$003C
	sta.b $81
.5:
	lda.w puckc
	bmi .1xx
	lsr a
.1xx:
	sta.b d2
	bpl .t2x
	jmp.w CODE_9EF1CE

.t2x:
	cpx.w puckc
	bne .t1xx
	jmp.w CODE_9EF1CE

.t1xx:
	lda.w #$FF00
	tsb.w puckc
	asl.b d2
	lda.b d2
	sta.b a0
	tay
	lda.w #$0014
	sta.w $1203,y
	tya
	lsr a
	sta.w $0CF3
	lda.w #$000C
	trb.w sflags
CODE_9EF168:
	stz.w $0E01
	ldy.b a2
	lda.w #$000A
	sta.w $1203,y
	lda.w #$0004
	sta.w $1063,y
	lda.w Xpos,x
	sec
	sbc.w Xpos,y
	sta.b d0
	lda.w Ypos,x
	sec
	sbc.w Ypos,y
	sta.b d1
	bne .1
	lda.b a2
	jsl.l GetHot
.1:
	lda.b d1
	and.w #$00FF
	bit.w #$0080
	beq .2
	ora.w #$FF00
.2:
	sta.b d1
	lda.b d1
	beq .3
	inc.b d1
.3:
	ldy.b a2
	lda.w $0EE3,y
	eor.b d1
	bmi .4
	lda.w #$0000
	sec
	sbc.b d1
	sta.b d1
.4:
	sep #$20
	lda.b d0
	sta.w $0EC4,x
	lda.b d1
	sta.w $0EE4,x
	rep #$20
	jmp.w puckflip
CODE_9EF1CA:
	rtl
