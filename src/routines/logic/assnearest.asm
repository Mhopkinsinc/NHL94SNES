; Unidentified routine.
assnearest:
	lda.w pflags,x
	bit.w #$0002
	beq .1
	and.w #$FFFD
	sta.w pflags,x
	stz.w temp3,x
	stz.w temp2,x
	lda.w #$0008
	sta.w temp2b,x
	stz.w temp1,x
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
	jml.l CODE_9ED331

.t3:
	lda.w temp1,x
	sec
	sbc.b d7
	sta.w temp1,x
	bmi .t2x
	jmp.w CODE_9E814E

.t2x:
	adc.w aioff,x
	bpl .1x
	lda.w #$0000
.1x:
	sta.w temp1,x
	ldy.w puckc
	bmi .t1x
	lda.w position,y
	beq .t1x
	sty.b a1
	lda.w pfteam,y
	eor.w pfteam,x
	bne .t1x
	jmp.w CODE_9E8086

.t1x:
	ldy.b a2
	lda.w $17AE,y
	sta.b d2
	lda.w $17B2,y
	sta.b a1
	lda.b d2
	bmi CODE_9E80BF
CODE_9E8086:
	cpx.b a1
	beq CODE_9E80BF
	lda.w gmclock
	bne CODE_9E80BF
	ldy.b a1
	lda.w pflags,y
	bit.w #$1000
	bne CODE_9E80BF
	lda.w position,y
	beq CODE_9E80BF
	lda.w $0B7D,y
	cmp.w #$0015
	beq CODE_9E80BF
	ldx.b a1
	lda.w pflags,x
	and.w #$FFFE
	sta.w pflags,x
	lda.w #$0012
	sta.b d0
	jsl.l assinsert
	ldx.b $E4
	jmp.w CODE_9E8BE6
