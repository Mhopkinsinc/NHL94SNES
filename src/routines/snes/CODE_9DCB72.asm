; Unidentified routine.
CODE_9DCB72:
	ldy.b a2
	lda.w #$009C
	sta.b $97
	lda.w tmdata,y
	sta.b a3
	ldy.w #$000C
	clc
	adc.b [a3],y
	sta.b a3
	ldy.w #$0005
CODE_9DCB89:
	lda.b [a3],y
	and.w #$00FF
	dec a
	cmp.w $1D9B
	beq CODE_9DCB9B
	dey
	bpl CODE_9DCB89
	lda.w #$0001
	rtl
