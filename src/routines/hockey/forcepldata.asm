; Unidentified routine.
forcepldata:
	stx.b $87
	ldx.w #$0000
CODE_9FCE22:
	lda.b $A5,x
	pha
	inx
	inx
	cpx.w #$0014
	bne CODE_9FCE22
	ldx.b $87
	stx.b $87
	ldx.w #$0000
CODE_9FCE33:
	lda.b $89,x
	pha
	inx
	inx
	cpx.w #$0010
	bne CODE_9FCE33
	ldx.b $87
	ldy.b $91
	lda.w tmsort,y
	sta.b $95
	lda.w #$0005
	sta.b $B5
CODE_9FCE4B:
	ldx.b $95
	lda.w newpos,x
	and.w #$00FF
	bit.w #$0080
	beq CODE_9FCE5B
	ora.w #$FF00
CODE_9FCE5B:
	sta.b $A5
	sta.w position,x
	cmp.w #$0000
	bmi CODE_9FCE9E
	jsl.l Setplass
	ldx.b $95
	lda.w position,x
	cmp.w #$0004
	bne CODE_9FCE7C
	lda.w #$0012
	sta.b $A5
	jsl.l assinsert
CODE_9FCE7C:
	ldx.b $95
	lda.w newpnum,x
	and.w #$00FF
	asl a
	sta.b $B1
	lda.b $91
	beq CODE_9FCE8E
	lda.w #$0034
CODE_9FCE8E:
	clc
	adc.b $B1
	tay
	lda.w #$FFFF
	sta.w tmpdst,y
	lsr.b $B1
	jsl.l setplayer
CODE_9FCE9E:
	ldx.b $95
	lda.w #$FFFF
	sta.w newpnum,x
	sta.w newpos,x
	inc.b $95
	inc.b $95
	dec.b $B5
	bpl CODE_9FCE4B
	stx.b $87
	ldx.w #$000E
CODE_9FCEB6:
	pla
	sta.b $89,x
	dex
	dex
	bpl CODE_9FCEB6
	ldx.b $87
	stx.b $87
	ldx.w #$0012
CODE_9FCEC4:
	pla
	sta.b $A5,x
	dex
	dex
	bpl CODE_9FCEC4
	ldx.b $87
	ldx.b $95
	rtl
