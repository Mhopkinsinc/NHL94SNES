; Assignment: celebrating a goal
assscore:
	lda.w gmode
	bit.w #$0040
	beq .1x
	lda.b a2
	inc a
	inc a
	jsl.l CODE_9C9FD5
.1x:
	ldy.w $19D4,x
	bmi .t2
	lda.w JoyPad,y
	and.w #$FFF0
	beq .t2
	rtl

.t2:
	lda.w $0EC3,x
	tax
	lda.w #$00C0
	jsl.l CODE_808FC9
	ldx.b a3
	lda.b $09
	sta.w $0EC3,x
	lda.w $0EE3,x
	tax
	lda.w #$00C0
	jsl.l CODE_808FC9
	ldx.b a3
	lda.b $09
	sta.w $0EE3,x
	txa
	lsr a
	cmp.w puckc
	bne .1x2
	lda.w #$FFFF
	sta.w puckc
	lda.w #$0708
	sta.w $1203,x
.1x2:
	lda.w pflags,x
	bit.w #$0002
	beq .3
	and.w #$FFFD
	sta.w pflags,x
	jsl.l .6
	stz.w $1023,x
	lda.w #$0008
	sta.w $10A3,x
	lda.w #$005A
	sta.w $1043,x
	lda.w Hpos
	bpl .2x
	lda.w #$FFA6
	sta.w $1043,x
.2x:
	lda.w Vpos
	sta.w $1063,x
.3:
	lda.w #$009E
	sta.b $8B
	lda.w #rtss
	sta.b a0
	lda.w $1043,x
	sta.b d0
	lda.w $1063,x
	sta.b d1
	lda.w $1003,x
	sec
	sbc.b d7
	sta.w $1003,x
	bpl .t1x
	lda.w #SPAcelebrate
	sta.b d1
	sta.w pfalock,x
	cpx.w $0D29
	bne .5
.4:
	lda.w #DATA8_9DFA84
	sta.b d1
	lda.w #$FFFF
	sta.w $0D29
.5:
	jsl.l SetSPA
.6:
	lda.w #$0078
	jsl.l randoma8
	sta.w $1003,x
	rtl

.t1x:
	jmp.w skateto
