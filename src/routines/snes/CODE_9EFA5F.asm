; Unidentified routine.
CODE_9EFA5F:
	cmp.w #$0006
	beq CODE_9EFA6B
	lda.w #$0001
	sta.l $7E344A
CODE_9EFA6B:
	lda.b $A5
	ldx.w #$0070
	jsl.l CODE_808F4C
	sta.b $A5
	lda.w #$0096
	sta.b $8B
	lda.w #DATA8_96F15D
	sta.b $89
	lda.w #$0084
	sta.b $C7
	lda.l $7E35CA
	ora.w #$2000
	sta.b $C5
	lda.w sfhormode
	beq CODE_9EFAA8
	lda.l $7E35C8
	sta.b $C5
	lda.w #$03DA
	sta.b $C7
	lda.w #$0095
	sta.b $8B
	lda.w #$DB94
	sta.b $89
CODE_9EFAA8:
	lda.b $89
	clc
	adc.b $A5
	sta.b $89
	lda.w #$0008
	sta.b $C9
CODE_9EFAB4:
	ldy.w #$0007
CODE_9EFAB7:
	lda.b [$89]
	clc
	adc.b $C5
	adc.l $7E35AA
	ldx.b $C7
	sta.l $7E37F4,x
	txa
	lsr a
	cmp.w $0CD5
	bcs CODE_9EFAD0
	sta.w $0CD5
CODE_9EFAD0:
	cmp.w $0CD7
	bcc CODE_9EFAD8
	sta.w $0CD7
CODE_9EFAD8:
	inc.b $89
	inc.b $89
	inc.b $C7
	inc.b $C7
	dey
	bne CODE_9EFAB7
	lda.b $C7
	clc
	adc.w #$0032
	sta.b $C7
	dec.b $C9
	bne CODE_9EFAB4
	lda.w #$0200
	tsb.w sflags
	bra CODE_9EFB3B
