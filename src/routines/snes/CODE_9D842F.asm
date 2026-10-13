; Unidentified routine.
CODE_9D842F:
	jsl.l InitScoutDisplay
	lda.w #$001D
	sta.b [$89]
	inc.b $89
	inc.b $89
	lda.w #$001C
	sta.b [$89]
	inc.b $89
	inc.b $89
	lda.w $1E41
	bmi CODE_9D8453
	lda.w #$001E
	sta.b [$89]
	inc.b $89
	inc.b $89
CODE_9D8453:
	lda.w HomeTeam
	sta.b $A5
	lda.w #$001F
	sta.b [$89]
	inc.b $89
	inc.b $89
	lda.w VisTeam
	cmp.b $A5
	beq CODE_9D8471
	lda.w #$0020
	sta.b [$89]
	inc.b $89
	inc.b $89
CODE_9D8471:
	lda.w #$0021
	sta.b [$89]
	inc.b $89
	inc.b $89
	lda.w #$FFFF
	sta.b [$89]
	stz.w $1D5E
	lda.w #$7FFF
	sta.w $0D41
	rtl
