; When the clock runs out, freeze the view and end the period
clockcont:
	lda.w gmclock
	ora.w gameclock
	bne CODE_9FA635
	jsl.l freezewindow
	jmp.w clockcont_0
