; Unidentified routine.
CODE_9EA10F:
	jsl.l CODE_9EC124
	lda.b $A5
	cmp.w #$0001
	bcs CODE_9EA132
	lda.w gmode
	bit.w #$0010
	bne CODE_9EA132
	lda.w $0793
	and.w #$0002
	clc
	adc.w #$001C
	sta.b $A5
	jsl.l AddPenalty
CODE_9EA132:
	jsl.l CODE_9EC042
	beq CODE_9EA151
	lda.w $1E8D
	bpl CODE_9EA151
	ldy.b $91
	sty.w $1E8D
	lda.w $19D4,y
	sta.w $1E93
	lda.w #$0024
	sta.b $A5
	jsl.l AddPenalty
CODE_9EA151:
	jmp.w CODE_9E9B52
