; Unidentified routine.
CODE_9EA46F:
	lda.w $1163,x
CODE_9EA472:
	and.w #$0007
	asl a
	tay
	lda.b [$89],y
	sta.b $89
	ldy.w SPAnum,x
	sty.b $A5
	lda.b [$89],y
	sta.b $AD
	lda.w $11E3,x
	bmi CODE_9EA4C6
	sec
	sbc.w $0ADB
	sta.w $11E3,x
	bpl CODE_9EA4D8
	lda.w SPAnum,x
	clc
	adc.w #$0004
	sta.w SPAnum,x
	sta.b $A5
	iny
	iny
	lda.b [$89],y
	cmp.w #$0000
	bpl CODE_9EA4C6
	stz.b $A5
	stz.w SPAnum,x
	stz.w $1543,x
	stz.w $14E3,x
	lda.w SPA,x
	cmp.w #$FEC2
	bcs CODE_9EA4BF
	cmp.w #$FDFE
	bcs CODE_9EA4DF
CODE_9EA4BF:
	lda.b $A9
	bne CODE_9EA4C6
	stz.w SPA,x
CODE_9EA4C6:
	ldy.b $A5
	iny
	iny
	lda.b [$89],y
	bit.w #$8000
	beq CODE_9EA4D5
	eor.w #$FFFF
	inc a
CODE_9EA4D5:
	sta.w $11E3,x
CODE_9EA4D8:
	lda.b $AD
	sta.w $0D97,x
CODE_9EA4DD:
	ply
	rtl
