; Unidentified routine.
SetupTeamForIntermission:
	jsl.l ResetBench
	lda.w #$0001
	sta.l $7E344E
	stz.b $91
	lda.w #$0002
	sta.b $95
	jsl.l CODE_9FE05C
	stz.b $95
	lda.w #$0002
	sta.b $91
CODE_9FE05C:
	jsl.l reenergizeteam
	ldx.b $95
	ldy.b $91
	stz.w tmline,x
	lda.l $7E34C6
	beq CODE_9FE088
	lda.w tmap,x
	sec
	sbc.w tmap,y
	sta.b $A5
	beq CODE_9FE088
	lda.w #$0003
	sta.w tmline,x
	lda.b $A5
	bpl CODE_9FE088
	lda.w #$0005
	sta.w tmline,x
CODE_9FE088:
	rtl
