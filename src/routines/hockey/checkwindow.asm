; Move the view so the screen follows the puck
checkwindow:
	lda.w yc1
	sta.b d2
	lda.w xc1
	sta.b d3
	lda.w sflags
	bit.w #$0040
	bne CODE_9FC102
	ldx.w #$001C
	lda.w $0AD9
	bmi CODE_9FC0DB
	tax
	lda.w pfgoal,x
	beq CODE_9FC0C6
	lda.w $0D4F
	adc.w $0CDD
	sta.w $0D4F
	cmp.w #$0032
	bmi CODE_9FC0DB
	lda.w #$0032
	sta.w $0D4F
	bra CODE_9FC0DB
