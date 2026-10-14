; Fade the screen out over the next frames
FadeOut:
	lda.w #$FFFF
	sta.w fadestep
	ldx.w #BrightnessHook>>16
	lda.w #BrightnessHook
	jsl.l SetFrameHook
	rtl
