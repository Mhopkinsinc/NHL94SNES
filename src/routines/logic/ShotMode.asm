; Unidentified routine.
ShotMode:
	cpx.w puckc
	bne CODE_9EE219
	lda.w SPA,x
	cmp.w #SPAshotf
	bcc CODE_9EE219
	cmp.w #DATA8_9DF020+1
	bcs CODE_9EE219
	lda.w SPAnum,x
	cmp.w #$0018
	bcs CODE_9EE220
	lda.b $A5
	bit.w #$0008
	bne CODE_9EE1EA
	and.w #$0007
	sta.w passdir
CODE_9EE1EA:
	lda.w SPAnum,x
	cmp.w #$0010
	bcs CODE_9EE21F
	lda.w passspeed
	clc
	adc.b $C1
	sta.w passspeed
	lda.b $AD
	bit.w #$0080
	beq CODE_9EE21F
	lda.w #$001C
	sec
	sbc.w SPAnum,x
	sta.w SPAnum,x
	cmp.w #$0018
	bcc CODE_9EE21F
	lda.w #$0018
	sta.w SPAnum,x
	bra CODE_9EE220
