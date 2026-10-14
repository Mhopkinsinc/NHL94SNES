; Assignment: the player nearest the puck who does not have it
assnearest:
	lda.w pflags,x
	bit.w #$0002
	beq .1
	and.w #$FFFD
	sta.w pflags,x
	stz.w $1043,x
	stz.w $1023,x
	lda.w #$0008
	sta.w $10A3,x
	stz.w $1003,x
.1:
	lda.w position,x
	beq .t2
	cpx.w puckc
	bne .t3
	lda.w #$0011
	sta.b d0
	lda.w $19D4,x
	bpl .t1
	jmp.w assinsert

.t1:
	rtl

.t2:
	jml.l assgoalie

.t3:
	lda.w $1003,x
	sec
	sbc.b d7
	sta.w $1003,x
	bmi .t2x
	jmp.w CODE_9E814E

.t2x:
	adc.w $1323,x
	bpl .1x
	lda.w #$0000
.1x:
	sta.w $1003,x
	ldy.w puckc
	bmi .t1x
	lda.w position,y
	beq .t1x
	sty.b a1
	lda.w pfteam,y
	eor.w pfteam,x
	bne .t1x
	jmp.w .2

.t1x:
	ldy.b a2
	lda.w $17AE,y
	sta.b d2
	lda.w $17B2,y
	sta.b a1
	lda.b d2
	bmi .3
.2:
	cpx.b a1
	beq .3
	lda.w gmclock
	bne .3
	ldy.b a1
	lda.w pflags,y
	bit.w #$1000
	bne .3
	lda.w position,y
	beq .3
	lda.w $0B7D,y
	cmp.w #$0015
	beq .3
	ldx.b a1
	lda.w pflags,x
	and.w #$FFFE
	sta.w pflags,x
	lda.w #$0012
	sta.b d0
	jsl.l assinsert
	ldx.b $E4
	jmp.w assexit
.3:
	lda.w #$0002
	sta.b d1
	lda.b d2
	cmp.w #$00E2
	bcs .1xx
	stz.b d1
	lda.w position,x
	beq CODE_9E814E
.1xx:
	lda.w sflags
	bit.w #$2000
	beq .2x
	dec.b d1
	dec.b d1
	jsl.l chkpk2
	bne .2x
	inc.b d1
	inc.b d1
	inc.b d1
	inc.b d1
.2x:
	lda.w #$0014
	sec
	sbc.w $1483,x
	sta.b d0
	lda.b d1
	sta.b tmp0
.loop:
	dec.b tmp0
	bmi CODE_9E813D
	asl.b d0
	bra .loop
