; Unidentified routine.
CODE_9EAB25:
	ldy.w #$0001
	lda.w #$F104
	sta.b $A9
	lda.w $1523,x
	bne CODE_9EAB57
	ldy.w #$0000
	lda.w #$EAFE
	sta.b $A9
	lda.w pflags,x
	bit.w #$0004
	beq CODE_9EAB4A
	ldy.w #$0001
	lda.w #$F7B2
	sta.b $A9
CODE_9EAB4A:
	cpx.w $0AD9
	bne CODE_9EAB57
	ldy.w #$0000
	lda.w #$EA4C
	sta.b $A9
CODE_9EAB57:
	lda.w $1543,x
	bne CODE_9EAB64
	tya
	sta.w $1543,x
	jsl.l SetSPA
CODE_9EAB64:
	lda.w $1523,x
	beq CODE_9EAB70
	lda.b $AD
	eor.w #$0004
	sta.b $AD
CODE_9EAB70:
	jml.l CODE_9EA719
