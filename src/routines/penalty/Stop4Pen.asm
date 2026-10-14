; Stop play for a penalty: stop the clock, set the face off spot and blow the whistle
Stop4Pen:
	lda.w #$FFFF
	tsb.w gmclock
	beq CODE_9EB2D4
	jmp.w CODE_9EB388
