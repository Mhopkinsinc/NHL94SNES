; Unidentified routine.
CODE_9EE463:
	cpx.w puckc
	bne .1
	lda.w $19D4,x
	bmi .8
.1:
	jmp.w assexit

.t1:
	rtl
.2:
	jsl.l CODE_9E8000
	lda.w #$003C
	sta.w $1203,x
	jmp.w assnothing
.8:
	lda.w gmclock
	bne .2
	lda.w Ypos,x
	sta.b d0
	ldy.w pfgoal,x
	bne .2x
	lda.w #$0000
	sec
	sbc.b d0
	sta.b d0
.2x:
	lda.w pflags,x
	bit.w #$0002
	beq .1x
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
.1x:
	lda.w $1EA5
	bmi .4
	lda.b d0
	cmp.w $1EA5
	bmi .3
	jsr.w .9
	lda.w facedir,x
	sta.w $1EAB
.3:
	lda.w $1EA1
	sta.b d0
	lda.w $1EA3
	sta.b d1
	lda.w pfgoal,x
	bne .1xx
	lda.w #$0000
	sec
	sbc.b d1
	sta.b d1
.1xx:
	lda.w #$009E
	sta.b $8B
	lda.w #$E592
	sta.b a0
	lda.w $1023,x
	sec
	sbc.w $0CDD
	sta.w $1023,x
	jml.l skateto
.4:
	lda.w facedir,x
	sec
	sbc.w $1EAB
	beq .3
	inc a
	and.w #$0007
	cmp.w #$0003
	bcs .t1x
	jsl.l RandomWord
	and.w #$0F80
	bne .3
	bra .5

.t1x:
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
	bpl .1xxx
	lda.b d0
	clc
	adc.w #$0003
	sta.b d0
.1xxx:
	lda.b d0
	sta.w passdir
	lda.w #$0014
	sta.w passspeed
	lda.w #$0000
	sec
	sbc.w Xpos,x
	sta.b d0
	lda.w pfgoal,x
	bne .t1xx
	lda.w #$FEF8
	sec
	sbc.w Ypos,x
	sta.b d1
	bra .6

.t1xx:
	lda.w #$0108
	sec
	sbc.w Ypos,x
	sta.b d1
.6:
	jsl.l vtoa
	jsl.l Findhittype
	beq .t1xxx
	lda.w #DATA8_9DF020
	bra .7

.t1xxx:
	lda.w #DATA8_9DEF6E
.7:
	jsl.l SetSPAFromA
	jsl.l updateanim
	lda.w #$0002
	sta.w SPAcnt,x
	jsl.l doshot
	rtl
	rtl
.9:
	lda.w $1EA7
	asl a
	adc.w $1EA7
	asl a
	tay
	lda.w #$009E
	sta.b $8B
	lda.w #DATA8_9EE5CE
	sta.b a0
	lda.b [a0],y
	sta.b d0
	lda.w $1EA9
	bpl .1xxxx
	lda.w #$0000
	sec
	sbc.b d0
	sta.b d0
.1xxxx:
	lda.b d0
	sta.w $1EA1
	iny
	iny
	lda.b [a0],y
	sta.w $1EA3
	iny
	iny
	lda.b [a0],y
	sta.w $1EA5
	inc.w $1EA7
	rts
