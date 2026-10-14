; When the clock runs out, freeze the view and end the period
clockcont:
	lda.w gmclock
	ora.w gameclock
	bne .t1
	jsl.l freezewindow
	jmp.w clockcont_0

.t1:
	rtl
