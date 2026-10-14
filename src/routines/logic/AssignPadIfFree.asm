; AssignPadPlayer when player d0 has no pad yet ($19D4 negative)
AssignPadIfFree:
	ldy.b d0
	lda.w $19D4,y
	bpl .rtl
	jsl.l AssignPadPlayer
.rtl:
	rtl
