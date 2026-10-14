; Unidentified routine.
CODE_9EA46F:
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
	bmi CODE_9EA4C6
	sec
	sbc.w $0ADB
	sta.w SPAcnt,x
	bpl CODE_9EA4D8
	lda.w SPAnum,x
	clc
	adc.w #$0004
	sta.w SPAnum,x
	sta.b d0
	iny
	iny
	lda.b [a0],y
	cmp.w #$0000
	bpl CODE_9EA4C6
	stz.b d0
	stz.w SPAnum,x
	stz.w $1543,x
	stz.w pfalock,x
	lda.w SPA,x
	cmp.w #$FEC2
	bcs CODE_9EA4BF
	cmp.w #$FDFE
	bcs CODE_9EA4DF
CODE_9EA4BF:
	lda.b d1
	bne CODE_9EA4C6
	stz.w SPA,x
CODE_9EA4C6:
	ldy.b d0
	iny
	iny
	lda.b [a0],y
	bit.w #$8000
	beq CODE_9EA4D5
	eor.w #$FFFF
	inc a
CODE_9EA4D5:
	sta.w SPAcnt,x
CODE_9EA4D8:
	lda.b d2
	sta.w $0D97,x
CODE_9EA4DD:
	ply
	rtl
