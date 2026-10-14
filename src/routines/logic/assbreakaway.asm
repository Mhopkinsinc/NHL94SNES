; Assignment: the puck carrier on a breakaway (asstab $10): skate in on the goal and shoot; anyone else exits
assbreakaway:
	cpx.w puckc
	bne .1
	lda.w $19D4,x
	bmi .8
.1:
	jmp.w assexit

.t1:
	rtl
.2:
	jsl.l GlideBack
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
	jsr.w .11
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
	lda.w #.nocallback>>16
	sta.b $8B
	lda.w #.nocallback
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
.nocallback:		; the skateto callback that does nothing
	rtl
.9:
	lda.w $1EA7
	asl a
	adc.w $1EA7
	asl a
	tay
	lda.w #$009E
	sta.b $8B
	lda.w #.10
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
.10:
	dw 40,120,74,-22,151,134,-22,224,177,44,227,-1
.11:
	lda.b d0
	cmp.w #$002C
	bpl .4x
	jsl.l RandomWord
	and.w #$00C0
	beq .t1xxxx
	lda.w attribute,x
	bit.w #$0800
	bne .1xxxxx
	bra .2xx

.t1xxxx:
	jsl.l RandomWord
	and.w #$00F0
	sta.b d0
	lda.w #$007F
	sec
	sbc.b d0
	bmi .2xx
.1xxxxx:
	lda.w #$002D
	bra .3x
.2xx:
	lda.w #$FFD3
.3x:
	ldy.w pfgoal,x
	bne .2xxx
.1xxxxxx:
	eor.w #$FFFF
	inc a
.2xxx:
	sta.w $1EA9
	sta.w $1EA1
	lda.w #$0028
	sta.w $1EA3
	lda.w #$001E
	sta.w $1EA5
	rts
.4x:
	lda.w Xpos,x
	cmp.w #$0020
	bpl .8x
	cmp.w #$FFE0
	bmi .8x
	jsl.l RandomWord
	and.w #$00C0
	beq .t1xxxxx
	lda.w attribute,x
	bit.w #$0800
	bne .1xxxxxxx
	bra .5x

.t1xxxxx:
	jsl.l RandomWord
	and.w #$00F0
	sta.b d0
	lda.w #$007F
	sec
	sbc.b d0
	bmi .5x
.1xxxxxxx:
	lda.w #$002C
	bra .6x
.5x:
	lda.w #$FFD4
.6x:
	ldy.w pfgoal,x
	bne .1xxxxxxxx
	eor.w #$FFFF
	inc a
.1xxxxxxxx:
	sta.w $1EA9
	sta.w $1EA1
.7x:
	lda.w #$0002
	sta.w $1EA7
	lda.w #$0097
	sta.w $1EA3
	lda.w #$0086
	sta.w $1EA5
	rts
.8x:
	sta.w $1EA9
	stz.w $1EA1
	bra .7x
