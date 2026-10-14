; Unidentified routine.
CODE_9EE47E:
	lda.w gmclock
	bne CODE_9EE471
	lda.w Ypos,x
	sta.b d0
	ldy.w pfgoal,x
	bne .2
	lda.w #$0000
	sec
	sbc.b d0
	sta.b d0
.2:
	lda.w pflags,x
	bit.w #$0002
	beq .1
	and.w #$FFFD
	sta.w pflags,x
	stz.w $1003,x
	stz.w $1023,x
	lda.w #$0008
	sta.w $10A3,x
	stz.w $1EA7
	lda.w $0792
	and.w #$0003
	sta.w $1043,x
	jsr.w CODE_9EE5E6
.1:
	lda.w $1EA5
	bmi .4
	lda.b d0
	cmp.w $1EA5
	bmi .3
	jsr.w CODE_9EE593
	lda.w facedir,x
	sta.w $1EAB
.3:
	lda.w $1EA1
	sta.b d0
	lda.w $1EA3
	sta.b d1
	lda.w pfgoal,x
	bne .1x
	lda.w #$0000
	sec
	sbc.b d1
	sta.b d1
.1x:
	lda.w #$009E
	sta.b $8B
	lda.w #$E592
	sta.b a0
	lda.w $1023,x
	sec
	sbc.w $0CDD
	sta.w $1023,x
	jml.l CODE_9EA5A4
.4:
	lda.w facedir,x
	sec
	sbc.w $1EAB
	beq .3
	inc a
	and.w #$0007
	cmp.w #$0003
	bcs .t1
	jsl.l RandomWord
	and.w #$0F80
	bne .3
	bra .5

.t1:
	jsl.l RandomWord
	and.w #$0600
	bne .3
.5:
	jsl.l RandomWord
	and.w #$0001
	inc a
	inc a
	sta.b d0
	ldy.w $1EA9
	bpl .1xx
	lda.b d0
	clc
	adc.w #$0003
	sta.b d0
.1xx:
	lda.b d0
	sta.w passdir
	lda.w #$0014
	sta.w passspeed
	lda.w #$0000
	sec
	sbc.w Xpos,x
	sta.b d0
	lda.w pfgoal,x
	bne .t1x
	lda.w #$FEF8
	sec
	sbc.w Ypos,x
	sta.b d1
	bra .6

.t1x:
	lda.w #$0108
	sec
	sbc.w Ypos,x
	sta.b d1
.6:
	jsl.l vtoa
	jsl.l Findhittype
	beq .t1xx
	lda.w #$F020
	bra .7

.t1xx:
	lda.w #$EF6E
.7:
	jsl.l SetSPAFromA
	jsl.l CODE_9EA419
	lda.w #$0002
	sta.w SPAcnt,x
	jsl.l CODE_9EE220
	rtl
	rtl
