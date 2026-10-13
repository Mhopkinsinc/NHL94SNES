; Unidentified routine.
puckfaceoff:
	stz.w $19C0
	lda.w $1D81
	beq CODE_9FB366
	lda.w $1D83
	beq CODE_9FB366
	inc.w $1D87
	rtl
