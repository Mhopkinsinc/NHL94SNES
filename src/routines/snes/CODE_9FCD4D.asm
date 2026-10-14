; Unidentified routine.
CODE_9FCD4D:
	ldy.w #$0000
	cpx.w #$000C
	bcc .1
	ldy.w #$0002
.1:
	lda.w $1C94,y
	bne .t1
	rtl

.t1:
	lda.w #$0001
	ldy.w pfgoal,x
	bne CODE_9FCD69
	lda.w #$0002
CODE_9FCD69:
	sta.b d1
	phx
	ldy.b d4
	ldx.w #$0000
	lda.w $1C84,y
	cmp.w #$0001
	beq .1
	ldx.w #$000C
.1:
	lda.w #$0005
	sta.b d0
.loop:
	lda.w position,x
	cmp.b d1
	beq .t1
	inx
	inx
	dec.b d0
	bpl .loop
	bra CODE_9FCDAA

.t1:
	lda.w $19D4,x
	bpl CODE_9FCDAA
	lda.w pflags,x
	bit.w #$1000
	bne CODE_9FCDAA
	lda.w $0ADD,y
	inc a
	sta.w $0ADD,y
	stx.b d0
	jsl.l CODE_9FCB68
CODE_9FCDAA:
	plx
	rtl
