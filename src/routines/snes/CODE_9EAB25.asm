; Unidentified routine.
CODE_9EAB25:
	ldy.w #$0001
	lda.w #SPAskateback
	sta.b $A9
	lda.w pfrev,x
	bne CODE_9EAB57
	ldy.w #$0000
	lda.w #SPAskate
	sta.b $A9
	lda.w pflags,x
	bit.w #$0004
	beq CODE_9EAB4A
	ldy.w #$0001
	lda.w #SPAstumble
	sta.b $A9
CODE_9EAB4A:
	cpx.w puckc
	bne CODE_9EAB57
	ldy.w #$0000
	lda.w #SPAskatewp
	sta.b $A9
CODE_9EAB57:
	lda.w pf2aip,x
	bne CODE_9EAB64
	tya
	sta.w pf2aip,x
	jsl.l SetSPA
CODE_9EAB64:
	lda.w pfrev,x
	beq CODE_9EAB70
	lda.b $AD
	eor.w #$0004
	sta.b $AD
CODE_9EAB70:
	jml.l CODE_9EA719
