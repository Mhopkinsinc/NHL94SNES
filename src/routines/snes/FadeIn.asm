; Fade the screen in after a short delay
FadeIn:
	lda.w #$0005
	sta.w fadestep
	ldx.w #BrightnessHook>>16
	lda.w #BrightnessHook
	jsl.l SetNMIHook
	rtl
