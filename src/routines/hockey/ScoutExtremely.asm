; Script code %e: "extremely " (ScoutFragments) when the hot / cold totals differ by 8 or more ($1E43), else nothing
ScoutExtremely:
	inc.b a2
	lda.w $1E43
	bne .t1
	jmp.w ScoutPlainWord

.t1:
	lda.w #$009E
	sta.b $8F
	lda.w #ScoutFragments
	sta.b a1
	jmp.w ScoutAppend
