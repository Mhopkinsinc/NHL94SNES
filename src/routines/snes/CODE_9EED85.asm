; Unidentified routine.
CODE_9EED85:
	lda.w #$0014
	sta.b $A5
	jmp.w $8C18
	cpx.w $0AD9
	bne CODE_9EEDBD
	lda.w pflags,x
	bit.w #$0002
	beq CODE_9EEDC0
	jsl.l CODE_9EECF6
	lda.w pflags,x
	and.w #$FFFD
	sta.w pflags,x
	lda.w $19D4,x
	bpl CODE_9EEDC0
	lda.w $0BA5
	cmp.w #$0014
	beq CODE_9EEDBA
	cmp.w #$0008
	beq CODE_9EEDBA
CODE_9EEDB9:
	rtl
