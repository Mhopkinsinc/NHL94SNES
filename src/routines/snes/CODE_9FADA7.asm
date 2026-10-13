; Unidentified routine.
CODE_9FADA7:
	lda.w #$009C
	sta.b $8F
	lda.w #$F8C2
	sta.b $8D
	jsl.l CODE_9ECE15
CODE_9FADB5:
	ldx.b $95
	lda.l $7E34C6
	beq CODE_9FAE2E
CODE_9FADBD:
	lda.w $1E9B
	ora.w $1E9D
	bne CODE_9FAE2E
	lda.w printy
	clc
	adc.w #$000A
	sta.w printy
	lda.w #$000C
	sta.b $A5
	lda.w #$0003
	sta.b $A9
	jsl.l CODE_9D8000
	lda.w tmline
	sta.b $A5
	lda.w $1798
	sta.b $A9
	lda.w gmode
	bit.w #$0002
	bne CODE_9FADF9
	lda.w tmline
	sta.b $A9
	lda.w $1798
	sta.b $A5
CODE_9FADF9:
	inc.w printx
	dec.w printy
	dec.w printy
	lda.w #$0080
	sta.b $8F
	lda.w #$D6BE
	sta.b $8D
	jsl.l CODE_9ECFC6
	inc.w printx
	inc.w printx
	inc.w printx
	inc.w printx
	lda.b $A9
	sta.b $A5
	lda.w #$0080
	sta.b $8F
	lda.w #$D6BE
	sta.b $8D
	jsl.l CODE_9ECFC6
CODE_9FAE2E:
	jsl.l RandomWord
	and.w #$007F
	adc.w #$00B4
	sta.b $A5
	ldx.b $95
	sta.w $1003,x
	lda.w $1E9B
	beq CODE_9FAE4A
	lda.w #$00B4
	sta.w $1003,x
CODE_9FAE4A:
	lda.w #$0001
	sta.l $7E312A
	lda.w #$8000
	sta.l $7E312C
	sta.l $7E3134
	lda.w #$0004
	sta.l $7E312E
	lda.w #$A800
	sta.l $7E3130
	lda.w #$0007
	sta.l $7E3132
	lda.w gmode
	bit.w #$0002
	bne CODE_9FAE87
	lda.w #$8800
	sta.l $7E312C
	lda.w #$A000
	sta.l $7E3130
CODE_9FAE87:
	lda.w #$FFFF
	sta.l $7E3122
	sta.l $7E3124
	stx.b $87
	ldx.w #$001A
CODE_9FAE97:
	pla
	sta.b $89,x
	dex
	dex
	bpl CODE_9FAE97
	ldx.b $87
	stx.b $87
	ldx.w #$001E
CODE_9FAEA5:
	pla
	sta.b $A5,x
	dex
	dex
	bpl CODE_9FAEA5
	ldx.b $87
	ldx.b $95
	rtl
