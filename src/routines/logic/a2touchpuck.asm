; Unidentified routine.
a2touchpuck:
	ldy.b a2
	cpy.w #$0018
	bcc .t2
	jmp.w .6

.t2:
	lda.w Xpos,y
	sta.l $7E30F8
	lda.w Ypos,y
	sta.l $7E30FA
	tya
	lsr a
	sta.l $7E30F6
	stz.b a0
	lda.w pfteam,y
	beq .1
	inc.b a0
	inc.b a0
.1:
	lda.w pnum,y
	sta.b d0
	ldy.b a0
	cmp.w tmtouch1,y
	beq .4
	lda.w tmflags,y
	bit.w #$0004
	beq .t1
	and.w #$FFFB
	sta.w tmflags,y
	cpy.w #$0000
	bne .3
	lda.w $19BE
	clc
	adc.w #$000A
	bmi .2
	sta.w $19BE
.2:
	bra .3

.t1:
	lda.w tmtouch2,y
	sta.w tmtouch3,y
	lda.w tmtouch1,y
	sta.w tmtouch2,y
.3:
	lda.b d0
	sta.w tmtouch1,y
	cmp.w tmtouch3,y
	bne .4
	lda.w #$FFFF
	sta.w tmtouch3,y
.4:
	lda.w #$1000
	trb.w sflags
	jsl.l a2offsides
	ldy.b a2
	lda.w iflags
	bit.w #$0004
	beq .8
	bit.w #$0001
	beq .8
	lda.w position,y
	beq .8
	lda.w iflags
	bit.w #$0002
	bne .7
	lda.w pfgoal,y
	beq .8
.5:
	phx
	lda.w $0CF2
	and.w #$00FF
	asl a
	sta.b a3
	tax
	lda.w #$000C
	sta.b d0
	jsl.l AddPenalty
	plx
	stx.b a3
.6:
	rtl
.7:
	lda.w pfgoal,y
	beq .5
.8:
	tya
	lsr a
	xba
	sta.w iflags
	lda.w pucky
	sta.b d0
	lda.w pfgoal,y
	beq .1x
	lda.w #$0002
	tsb.w iflags
	lda.w #$0000
	sec
	sbc.b d0
	sta.b d0
.1x:
	lda.b d0
	bmi .6
	lda.w tmap
	sec
	sbc.w $17A8
	sta.b d0
	lda.w pfteam,y
	beq .2x
	lda.w #$0000
	sec
	sbc.b d0
	sta.b d0
.2x:
	lda.b d0
	bmi .6
	lda.w #$0004
	tsb.w iflags
	rtl
