; Assignment: the player skates to the bench door and leaves
assbench:
	lda.w $1003,x
	cmp.w #$0064
	bne .t2
	jmp.w .5

.t2:
	jsl.l check4bench
	lda.w pflags,x
	bit.w #$4000
	beq .t1x
.1x:
	jml.l assexit

.t1x:
	bit.w #$0002
	beq .2
	and.w #$FFFD
	sta.w pflags,x
	stz.w $1023,x
	lda.w #$0008
	sta.w $10A3,x
	lda.w #$0050
	sta.b d0
	lda.w pfteam,x
	bne .1xx
	lda.w #$FFB0
	sta.b d0
.1xx:
	lda.b d0
	sta.w $1063,x
	lda.w #$FF70
	sta.w $1043,x
	stz.w $1003,x
.2:
	lda.w newpnum,x
	cmp.w pnum,x
	bne .t3
.3:
	jmp.w .7

.t3:
	lda.w position,x
	bne .1x2
	lda.w $0B05,x
	ora.w #$0003
	sta.w $0B05,x
.1x2:
	lda.w $1003,x
	sec
	sbc.b d7
	sta.w $1003,x
	bmi .t1x2
	jmp.w .6

.t1x2:
	lda.w $1003,x
	adc.w #$0008
	sta.w $1003,x
	lda.w Ypos,x
	sec
	sbc.w $1063,x
	bit.w #$8000
	beq .2x
.1xx2:
	eor.w #$FFFF
	inc a
.2x:
	cmp.w #$0029
	bcc .t2x
	jmp.w .6

.t2x:
	lda.w Xpos,x
	sec
	sbc.w $1043,x
	sta.b d0
	sec
	sbc.w #$0020
	beq .t1xx
	bmi .t1xx
	jmp.w .6

.t1xx:
	lda.w #SPAglide
	ldy.w position,x
	bne .1x2x
	lda.w #SPAgready
.1x2x:
	jsl.l SetSPAFromA
	lda.w #$0001
	sta.w $1563,x
	lda.w facedir,x
	cmp.w #$0004
	beq .2xx
	inc a
	and.w #$0007
	sta.w facedir,x
.2xx:
	stz.w $0EE3,x
	lda.w #$F800
	sta.w $0EC3,x
	lda.b d0
	sec
	sbc.w #$0010
	beq .3x
	bpl .1
.3x:
	stz.w $0EC3,x
	lda.w facedir,x
	cmp.w #$0004
	bne .1
	lda.w #$F800
	sta.w $0EC3,x
	lda.w #$0002
	sta.w facedir,x
	lda.w #SPAwallleft
	ldy.w position,x
	bne .4
	lda.w #SPAgwallleft
.4:
	jsl.l SetSPAFromA
	lda.w #$0064
	sta.w $1003,x
	sta.w pfalock,x
.1:
	rtl
.5:
	lda.w pnum,x
	asl a
	sta.b d0
	stz.b a0
	lda.w pfteam,x
	beq .1xxx
	lda.w #$0002
	sta.b a0
.1xxx:
	lda.b a0
	beq .2xxx
	lda.w #$0034
.2xxx:
	clc
	adc.b d0
	tay
	lda.w #$FFFE
	sta.w tmpdst,y
	lda.w newpnum,x
	sta.b d3
	jsl.l .8
	jmp.w setplayer
.6:
	lda.w $1563,x
	bne .1
	lda.w pflags,x
	bit.w #$4008
	bne .1
	lda.w $1043,x
	sta.b d0
	lda.w $1063,x
	sta.b d1
	lda.w #EvadePC>>16
	sta.b $8B
	lda.w #EvadePC
	sta.b a0
	jml.l skateto
.7:
	lda.w pflags,x
	and.w #$EFFF
	sta.w pflags,x
.8:
	lda.w newpos,x
	sta.b d0
	sta.w position,x
	jsl.l Setplass
	lda.w #$FFFF
	sta.w newpnum,x
	sta.w newpos,x
	rtl
