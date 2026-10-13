; Unidentified routine.
CODE_9E9B52:
	lda.w $19BE
	clc
	adc.w #$000F
	bmi FallDown
	sta.w $19BE
FallDown:
	ldy.b $91
	cpy.w #$0018
	bcs CODE_9E9BB2
	lda.w SPA,y
	cmp.w #SPAinjury1
	beq CODE_9E9BB2
	cmp.w #SPAstumble
	beq CODE_9E9BB2
	cmp.w #SPAfallfwd
	beq CODE_9E9BB2
	cmp.w #SPAfallback
	beq CODE_9E9BB2
	cmp.w #SPAflip
	beq CODE_9E9BB2
	lda.w #SPAstumble
	sta.b $A9
	lda.w gmclock
	bne CODE_9E9BB3
	lda.w stickhand,y
	cmp.w #$000C
	bcc CODE_9E9BB3
	lda.w nopuckb,y
	bne CODE_9E9BB3
	lda.w seed
	and.w #$000F
	adc.w #$000A
	sta.b $A5
	sec
	sbc.w $0F23,y
	bmi CODE_9E9BB3
	lda.w #$003C
	sta.w nopuckb,y
	jmp.w $9D59
