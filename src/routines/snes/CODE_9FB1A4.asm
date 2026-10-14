; Unidentified routine.
CODE_9FB1A4:
	lda.w pfgoal,y
	bne CODE_9FB197
CODE_9FB1A9:
	sty.b a2
	ldx.b a3
	jsl.l a2touchpuck
CODE_9FB1B1:
	lda.w tmflags
	and.w #$FFFB
	sta.w tmflags
	lda.w $17E0
	and.w #$FFFB
	sta.w $17E0
	ldx.b a3
	jsl.l RandomWord
	and.w #$07FF
	sta.w $0E01
	stz.w $0DF9
	stz.w pfnc,x
	lda.w #$0018
	sta.b d0
	jml.l assreplace
