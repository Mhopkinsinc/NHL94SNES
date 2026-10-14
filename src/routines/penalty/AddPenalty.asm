; Call penalty d0 on player X, unless the clock is stopped or penalties (or offsides) are turned off
AddPenalty:
	lda.w gmclock
	bne .rtl
	lda.w $163A
	bne .rtl
	lda.b d0
	cmp.w #PenIcing
	beq CODE_9EB88A
	cmp.w #$0024
	beq CODE_9EB88A
	lda.l OptPen
	beq .rtl
	lda.w gmode
	bit.w #gmoffs
	bne CODE_9EB88A
	lda.b d0
	cmp.w #PenOffsides
	bne CODE_9EB88A
.rtl:
	rtl
