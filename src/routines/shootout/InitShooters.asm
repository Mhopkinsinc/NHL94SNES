; Unidentified routine.
InitShooters:		; homeshooters or awayshooters (team $91) from the team data
	lda.w #$0000
	sta.b $97
	lda.w #homeshooters
	sta.b $95
	lda.b $91
	beq CODE_80CDE0
	lda.w #$0000
	sta.b $97
	lda.w #awayshooters
	sta.b $95
CODE_80CDE0:
	ldy.b $91
	lda.w #$009C
	sta.b $8F
	lda.w tmdata,y
	sta.b $8D
	ldy.w #$000C
	clc
	adc.b [$8D],y
	sta.b $8D
	lda.w #$0007
	sta.b $A5
CODE_80CDF9:
	sep #$20
	lda.b [$8D]
	sta.b [$95]
	rep #$20
	inc.b $8D
	inc.b $95
	dec.b $A5
	bpl CODE_80CDF9
	rtl
