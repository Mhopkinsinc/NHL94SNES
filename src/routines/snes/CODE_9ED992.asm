; Unidentified routine.
CODE_9ED992:
	lda.w $0B5D,x
	sec
	sbc.w facedir,x
	and.w #$0007
	sta.b d3
	beq CODE_9ED93F
CODE_9ED9A0:
	cmp.w #$0004
	beq CODE_9ED92A
	lsr a
	lsr a
	sta.b d0
	lda.w attribute,x
	bit.w #$0800
	beq CODE_9ED9B8
	lda.b d0
	eor.w #$0001
	sta.b d0
CODE_9ED9B8:
	lda.b d3
	cmp.w #$0004
	bcc CODE_9ED9C5
	eor.w #$FFFF
	adc.w #$0008
CODE_9ED9C5:
	cmp.w #$0002
	bcs CODE_9ED987
	lda.w $0DF9
	sec
	sbc.w #$0008
	bpl CODE_9EDA04
	lda.w $0E01
	sec
	sbc.w #$0800
	bpl CODE_9EDA04
	lda.b d0
	clc
	adc.w #$0004
	sta.b d0
	ldy.w #$0002
	lda.b [a0],y
	cmp.w #$0009
	bcc CODE_9EDA04
	lda.w facedir,x
	cmp.w #$0002
	beq CODE_9EDA04
	cmp.w #$0006
	beq CODE_9EDA04
	lda.w $0AD9
	bmi CODE_9EDA04
	dec.b d0
	dec.b d0
CODE_9EDA04:
	asl.b d0
	lda.w #$009E
	sta.b $8F
	lda.w #DATA8_9EDBF4
	sta.b a1
	ldy.b d0
	lda.b [a1],y
	sta.w pfalock,x
	jsl.l CODE_9EA3F1
	lda.l $7E35E0
	clc
	adc.w #$0096
	sta.l $7E35E0
	lda.w #$001E
	sta.b $81
CODE_9EDA2C:
	lda.b [a0]
	sta.b d0
	lda.w pucky
	sec
	sbc.w #$00FC
	bpl CODE_9EDA42
	lda.w pucky
	sec
	sbc.w #$FF04
	bpl CODE_9EDA51
CODE_9EDA42:
	lda.w #$0018
	sta.b d0
	lda.w $0D71
	bpl CODE_9EDA51
	lda.w #$FFE8
	sta.b d0
CODE_9EDA51:
	lda.w $19D4,x
	bmi CODE_9EDA59
	jmp.w CODE_9EDBF3
