; Unidentified routine.
CODE_9EA442:
	phy
	sta.b a0
	lda.w #$009D
	sta.b $8B
	ldy.w #$0010
	lda.b [a0],y
	sta.b d1
	lda.w sfhormode
	bne CODE_9EA425
CODE_9EA456:
	lda.w SPA,x
	cmp.w #DATA8_9DFDFE
	bcs .t1
	lda.w attribute,x
	bit.w #$0800
	beq .t1
	lda.w #$0000
	sec
	sbc.w facedir,x
	bra CODE_9EA472

.t1:
	lda.w facedir,x
CODE_9EA472:
	and.w #$0007
	asl a
	tay
	lda.b [a0],y
	sta.b a0
	ldy.w SPAnum,x
	sty.b d0
	lda.b [a0],y
	sta.b d2
	lda.w SPAcnt,x
	bmi .2
	sec
	sbc.w $0ADB
	sta.w SPAcnt,x
	bpl .4
	lda.w SPAnum,x
	clc
	adc.w #$0004
	sta.w SPAnum,x
	sta.b d0
	iny
	iny
	lda.b [a0],y
	cmp.w #$0000
	bpl .2
	stz.b d0
	stz.w SPAnum,x
	stz.w $1543,x
	stz.w pfalock,x
	lda.w SPA,x
	cmp.w #DATA8_9DFEC2
	bcs .1
	cmp.w #DATA8_9DFDFE
	bcs .6
.1:
	lda.b d1
	bne .2
	stz.w SPA,x
.2:
	ldy.b d0
	iny
	iny
	lda.b [a0],y
	bit.w #$8000
	beq .3
	eor.w #$FFFF
	inc a
.3:
	sta.w SPAcnt,x
.4:
	lda.b d2
	sta.w $0D97,x
.5:
	ply
	rtl
.6:
	lda.w #$FF78
	sta.w Xpos,x
	lda.w #$0002
	sta.w facedir,x
	sta.w pfalock,x
	lda.w #SPAwallright
	jsl.l CODE_9EA403
	bra .5
