; Unidentified routine.
CODE_9FC7EC:
	stz.w $1EAF
	lda.b d0
	sec
	sbc.w #$0010
	bmi .t1
	jsr.w .t2
	lda.b $B3
	bit.w $1EB3
	beq .1
	inc.w $1EAF
.1:
	ora.w $1EB3
	sta.b $B3
	rts

.t1:
	lda.b d0
	and.w #$000F
	jsr.w .t2
	lda.b d3
	bit.w $1EB3
	beq .1x
	inc.w $1EAF
.1x:
	ora.w $1EB3
	sta.b d3
	rts

.t2:
	tay
	lda.w #$0001
.loop:
	cpy.w #$0000
	beq .t1x
	asl a
	dey
	bra .loop

.t1x:
	sta.w $1EB3
	rts
