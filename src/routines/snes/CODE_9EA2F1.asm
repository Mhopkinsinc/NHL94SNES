; Unidentified routine.
CODE_9EA2F1:
	lda.w position,x
	beq .t1
	lda.w pfalock,x
	bne .t1
	ldy.b a2
	lda.w Xpos,x
	sec
	sbc.w Xpos,y
	sta.b d0
	lda.w Ypos,x
	sec
	sbc.w Ypos,y
	sta.b d1
	jsl.l vtoa
	ldy.b a2
	lda.b d0
	sec
	sbc.w facedir,y
	inc a
	and.w #$0007
	cmp.w #$0003
	bcs .t1
	lda.w shotPlIdx
	cmp.b a3
	bne .t2
	lda.w #$0008
	trb.w sflags
	bra .t2

.t1:
	rtl

.t2:
	lda.b d0
	sta.w facedir,y
	ldy.b a2
	lda.w $0EC3,x
	clc
	adc.w $0EC3,y
	pha
	asl a
	pla
	ror a
	sta.w $0EC3,x
	sta.w $0EC3,y
	lda.w $0EE3,x
	clc
	adc.w $0EE3,y
	pha
	asl a
	pla
	ror a
	sta.w $0EE3,x
	sta.w $0EE3,y
	tya
	sta.w $0F03,x
	lda.w #$F46A
	sta.w pfalock,x
	jsl.l SetSPAFromA
	ldx.b a2
	ldy.b a3
	sty.b a2
	stx.b a3
	tya
	sta.w $0F03,x
	lda.w #$F3A6
	sta.w pfalock,x
	ldy.w SPA,x
	cpy.w #$F374
	beq .1
	lda.w #$F3D8
.1:
	jsl.l SetSPAFromA
	jsl.l CODE_9EC042
	beq .t1x
	lda.w $1E8D
	bpl .t1x
	ldy.b a2
	sty.w $1E8D
	lda.w $19D4,y
	sta.w $1E93
	lda.w #$0024
	sta.b d0
	jsl.l AddPenalty
	bra CODE_9EA3CE

.t1x:
	jsl.l checkagr
	lda.b d0
	cmp.w #$0001
	bcs CODE_9EA3CE
	lda.w #$0028
	sta.b d0
	lda.w SPA,x
	cmp.w #$F3A6
	beq .1x
	lda.w #$0020
	sta.b d0
.1x:
	jsl.l AddPenalty
CODE_9EA3CE:
	ldx.b a2
	ldy.b a3
	sty.b a2
	stx.b a3
	lda.w #$FFFF
	sta.w $0CDB
	rtl
