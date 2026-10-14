; Unidentified routine.
CODE_9C9FED:
	lda.w $0C23
	beq CODE_9CA04D
	lda.w $0C29
	and.w #$0007
	sta.w $0C29
	lda.w $0C27
	sec
	sbc.w $0ADB
org $9CA002
	bpl .t1
	clc
	adc.w #$000B
	sta.w $0C27
	lda.w $0C25
	cmp.w #$0004
	beq CODE_9CA037
	lda.w $0C29
	inc a
	cmp.w #$0006
	bne CODE_9CA03D
	lda.w $0C25
	inc a
	sta.w $0C25
	cmp.w #$0004
	beq CODE_9CA040
	lda.w #$0002
	bra CODE_9CA03D

.t1:
	sta.w $0C27
	bra CODE_9CA040
