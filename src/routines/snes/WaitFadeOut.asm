; Wait until the fade has reached black
WaitFadeOut:
	jsl.l WaitFrame
	lda.w brightness
	bne WaitFadeOut
	rtl
