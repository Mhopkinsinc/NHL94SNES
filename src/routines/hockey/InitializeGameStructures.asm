; Random team pairs for the 8 other games ($7E3528 / $7E3538), none of them HomeTeam or VisTeam and no team twice (bit sets $B3 / d3)
InitializeGameStructures:
	lda.w #$FFFF
	sta.l $7E35D6
	stz.b d3
	stz.b $B3
	lda.w HomeTeam
	sta.b d0
	jsr.w .2
	lda.w VisTeam
	sta.b d0
	jsr.w .2
	ldx.w #$0000
.loop:
	jsr.w .1
	lda.b d0
	sta.l $7E3528,x
	jsr.w .1
	lda.b d0
	sta.l $7E3538,x
	inx
	inx
	cpx.w #$0010
	bne .loop
	rtl
.1:
	lda.w #$001A
	sta.b d0
	jsl.l randomd0
	jsr.w .2
	lda.w $1EAF
	cmp.w #$0000
	bne .1
	rts
.2:
	stz.w $1EAF
	lda.b d0
	sec
	sbc.w #$0010
	bmi .t1
	jsr.w .t2
	lda.b $B3
	bit.w $1EB3
	beq .1x
	inc.w $1EAF
.1x:
	ora.w $1EB3
	sta.b $B3
	rts

.t1:
	lda.b d0
	and.w #$000F
	jsr.w .t2
	lda.b d3
	bit.w $1EB3
	beq .1xx
	inc.w $1EAF
.1xx:
	ora.w $1EB3
	sta.b d3
	rts

.t2:
	tay
	lda.w #$0001
.loopx:
	cpy.w #$0000
	beq .t1x
	asl a
	dey
	bra .loopx

.t1x:
	sta.w $1EB3
	rts
