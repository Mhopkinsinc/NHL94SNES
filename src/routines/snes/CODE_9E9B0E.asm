; Unidentified routine.
CODE_9E9B0E:
	phy
	ldy.w $0EC3,x
	lda.w $0EE3,x
	jsl.l ApproxLength
	sta.b $14
	lda.b $01,s
	tay
	lda.w $0EC3,y
	pha
	lda.w $0EE3,y
	tay
	pla
	jsl.l ApproxLength
	ply
	cmp.b $14
	bcs .t1
	lda.w $0EC3,x
	sta.b $0C
	lda.w $0EE3,x
	sta.b $0E
	bra .1

.t1:
	lda.w $0EC3,y
	sta.b $0C
	lda.w $0EE3,y
	sta.b $0E
.1:
	asl.b $0C
	asl.b $0E
	lda.w #$000F
	jsl.l sfx
	rtl
