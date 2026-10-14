; Unidentified routine.
CODE_9FA840:
	and.w #$FFFD
	sta.w pflags,x
	stx.b xsave
	ldx.w #$0000
CODE_9FA84B:
	lda.b d0,x
	pha
	inx
	inx
	cpx.w #$0020
	bne CODE_9FA84B
	ldx.b xsave
	stx.b xsave
	ldx.w #$0000
CODE_9FA85C:
	lda.b a0,x
	pha
	inx
	inx
	cpx.w #$001C
	bne CODE_9FA85C
	ldx.b xsave
	lda.w #$7000
	sta.b $64
	lda.w #$0012
	jsl.l CODE_80A17D
	lda.w #$0013
	jsl.l CODE_80A17D
	lda.w #$FFFF
	sta.w $0CAD
	sta.w $0CB3
	lda.w #$0000
	sta.l $7E3448
	lda.l $7E35E0
	cmp.w #$0258
	bcc CODE_9FA89B
	lda.w #$0258
	sta.l $7E35E0
CODE_9FA89B:
	lda.w $0AD3
	beq CODE_9FA8AB
	jsl.l CODE_9F96F7
	jsl.l CODE_9F9708
	stz.w $0AD3
CODE_9FA8AB:
	jsl.l CODE_9F96E6
	lda.w #$000A
	sta.w $0AD1
	lda.w MusicOn
	bne CODE_9FA90C
	lda.w PBnum
	beq CODE_9FA8E3
	lsr a
	lsr a
	lsr a
	lsr a
	sta.b $14
	lda.w PBnum
	and.w #$000F
	cmp.b $14
	beq CODE_9FA8E3
	bcs CODE_9FA8DA
CODE_9FA8D1:
	lda.w #$0004
	jsl.l CODE_9C9B5F
	bra CODE_9FA90C
