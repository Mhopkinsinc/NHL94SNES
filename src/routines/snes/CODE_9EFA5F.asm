; Unidentified routine.
CODE_9EFA5F:
	cmp.w #$0006
	beq CODE_9EFA6B
	lda.w #$0001
	sta.l $7E344A
CODE_9EFA6B:
	lda.b d0
	ldx.w #$0070
	jsl.l CODE_808F4C
	sta.b d0
	lda.w #$0096
	sta.b $8B
	lda.w #DATA8_96F15D
	sta.b a0
	lda.w #$0084
	sta.b tmp1
	lda.l $7E35CA
	ora.w #$2000
	sta.b tmp0
	lda.w sfhormode
	beq CODE_9EFAA8
	lda.l $7E35C8
	sta.b tmp0
	lda.w #$03DA
	sta.b tmp1
	lda.w #a3
	sta.b $8B
	lda.w #$DB94
	sta.b a0
CODE_9EFAA8:
	lda.b a0
	clc
	adc.b d0
	sta.b a0
	lda.w #$0008
	sta.b tmp2
CODE_9EFAB4:
	ldy.w #$0007
CODE_9EFAB7:
	lda.b [a0]
	clc
	adc.b tmp0
	adc.l $7E35AA
	ldx.b tmp1
	sta.l textmap,x
	txa
	lsr a
	cmp.w textdirtylo
	bcs CODE_9EFAD0
	sta.w textdirtylo
CODE_9EFAD0:
	cmp.w textdirtyhi
	bcc CODE_9EFAD8
	sta.w textdirtyhi
CODE_9EFAD8:
	inc.b a0
	inc.b a0
	inc.b tmp1
	inc.b tmp1
	dey
	bne CODE_9EFAB7
	lda.b tmp1
	clc
	adc.w #$0032
	sta.b tmp1
	dec.b tmp2
	bne CODE_9EFAB4
	lda.w #$0200
	tsb.w sflags
	bra CODE_9EFB3B
