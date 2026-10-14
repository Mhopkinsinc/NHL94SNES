; Unidentified routine.
lcfound:
	ldx.b $95
	ldy.b $91
	lda.b $AD
	sta.b $A5
	sta.w $17E6,y
	jsl.l getlchoice
	lda.b $A5
	bmi CODE_9FE03E
	lda.w pflags,x
	ora.w #$0008
	sta.w pflags,x
	jsl.l CODE_9FC757
	ldy.b $91
	lda.w tmflags,y
	and.w #$FFF7
	sta.w tmflags,y
	lda.b $A5
	sta.w tmline,y
	lda.w #$FFFF
	sta.w $1D55,y
	jsl.l setpersonel
	jmp.w CODE_9FDE13
