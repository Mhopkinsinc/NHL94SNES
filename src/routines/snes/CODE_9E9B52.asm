; Unidentified routine.
CODE_9E9B52:
	lda.w $19BE
	clc
	adc.w #$000F
	bmi CODE_9E9B5E
	sta.w $19BE
CODE_9E9B5E:
	ldy.b $91
	cpy.w #$0018
	bcs CODE_9E9BB2
	lda.w SPA,y
	cmp.w #$F90E
	beq CODE_9E9BB2
	cmp.w #$F7B2
	beq CODE_9E9BB2
	cmp.w #$F49C
	beq CODE_9E9BB2
	cmp.w #$F54E
	beq CODE_9E9BB2
	cmp.w #$F6C0
	beq CODE_9E9BB2
	lda.w #$F7B2
	sta.b $A9
	lda.w $15D6
	bne CODE_9E9BB3
	lda.w $1403,y
	cmp.w #$000C
	bcc CODE_9E9BB3
	lda.w $1223,y
	bne CODE_9E9BB3
	lda.w $0792
	and.w #$000F
	adc.w #$000A
	sta.b $A5
	sec
	sbc.w $0F23,y
	bmi CODE_9E9BB3
	lda.w #$003C
	sta.w $1223,y
	jmp.w $9D59
