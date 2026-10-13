; Unidentified routine.
CODE_9D9893:
	lda.l $7E3598,x
	and.w #$FFFE
	sta.l $7E3598,x
	lda.b [$89]
	inc.b $89
	and.w #$00FF
	sta.l $7E3528,x
	lda.b [$89]
	inc.b $89
	and.w #$00FF
	sta.l $7E3538,x
	rtl
