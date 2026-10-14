; Append "None" (GoalieOptionText) to the pause item text
PmenuNone:
	lda.w #$009F
	sta.b $9B
	lda.w #GoalieOptionText+33
	sta.b a4
	ldy.w #$0001
	jsl.l PmenuAppend
	rtl
