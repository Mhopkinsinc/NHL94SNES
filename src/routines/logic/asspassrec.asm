; Assignment: waiting for a pass
asspassrec:
	lda.w pflags,x
	bit.w #$0002
	beq .3
	and.w #$FFFD
	ora.w #$0001
	sta.w pflags,x
	stz.w temp2,x
	lda.w #$0008
	sta.w temp2b,x
.3:
	lda.w $0BAD,x
	sec
	sbc.w $0ADB
	sta.w $0BAD,x
	bmi .6
	lda.w puckc
	bpl .6
	lda.w $0BAB
	bne .8
	ldy.w $19D4,x
	bmi .t2
	lda.w padnew,y
	bit.w #$8000
	bne .6
	bit.w #$0080
	beq .t2
.4:
	inc.w $0BAB
	bra .8

.t1:
	rtl

.t2:
	ldy.b a2
	lda.w $19D0,y
	bne .5
	lda.w pfgoal,x
	bne .2
	lda.w Ypos,x
	cmp.w #$FFA8
	bpl .5
.1:
	jsl.l RandomWord
	and.w #$0080
	bne .5
	inc.w $0BAB
	jmp.w .8
.2:
	lda.w Ypos,x
	cmp.w #$0058
	bpl .1
.5:
	lda.w puckc
	bmi .7
.6:
	lda.w #$FFFF
	sta.w passReceiverPlayerNum
	stz.w pfalock,x
	stz.w $0BAB
	lda.w pflags,x
	and.w #$FFFE
	sta.w pflags,x
	jmp.w assexit
.7:
	rtl
.8:
	lda.w SPA,x
	cmp.w #SPAonetimerf
	beq .10
	cmp.w #SPAonetimerb
	beq .10
	phy
	ldy.w #$0000
	cpx.w #$000C
	bmi .1x
	ldy.w #$0002
.1x:
	lda.w $17D2,y
	inc a
	sta.w $17D2,y
	ply
	lda.w #$0000
	sec
	sbc.w $0BA7
	sta.b d0
	lda.w pfgoal,x
	bne .t1x
	lda.w #$FEF8
	sec
	sbc.w $0BA9
	sta.b d1
	bra .2x

.t1x:
	lda.w #$0108
	sec
	sbc.w $0BA9
	sta.b d1
.2x:
	jsl.l vtoa
	jsl.l Findhittype
	beq .t1xx
	lda.w #SPAonetimerb
	bra .3x

.t1xx:
	lda.w #SPAonetimerf
.3x:
	jsl.l SetSPAFromA
	jmp.w .7
.9:
	jmp.w .6
.10:
	lda.w #$000A
	sta.w nopuck,x
	lda.w SPAnum,x
	cmp.w #$0010
	bcs .9
	txa
	jsl.l GetHot
	lda.w Xpos,x
	clc
	adc.b d0
	sec
	sbc.w puckx
	sta.b d0
	lda.w Ypos,x
	clc
	adc.b d1
	sec
	sbc.w pucky
	sta.b d1
	ldy.b d0
	jsl.l ApproxLength
	cmp.w #$0008
	bcs .5x
	stz.w SPAcnt,x
	cmp.w #$000C
	bcs .5x
	stx.w puckc
	ldy.w $19D4,x
	bmi .t1xxx
.1xx:
	lda.w paddir,y
	sta.w passdir
	bra .4x

.t1xxx:
	lda.w #$0008
	sta.w passdir
.4x:
	lda.w #$0024
	sta.w passspeed
	sta.w pfalock,x
	lda.w gmclock
	bne .2xx
	phy
	ldy.w #$0000
	cpx.w #$000C
	bmi .1xxx
	ldy.w #$0002
.1xxx:
	lda.w $17D6,y
	inc a
	sta.w $17D6,y
	ply
.2xx:
	lda.w #$0001
	sta.w $1E89
	lda.w CwdExciteLvl
	clc
	adc.w #$000A
	bmi .3xx
	sta.w CwdExciteLvl
.3xx:
	lda.b a2
	pha
	stx.b a2
	jsl.l a2touchpuck
	pla
	sta.b a2
	jsl.l doshot
	jmp.w .6
.5x:
	lda.w puckc
	bmi .t1xxxx
.1xxxx:
	cpx.w puckc
	beq .t1xxxx
	jmp.w .6

.t1xxxx:
	rtl
