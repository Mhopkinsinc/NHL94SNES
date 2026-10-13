; Unidentified routine.
CODE_9ED0EF:
	lda.w tmgoalie,y
	ora.w #$FF00
	sta.w tmgoalie,y
	jsl.l setpersonel
rtss:
	rtl
