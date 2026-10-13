; Unidentified routine.
CODE_9BCC41:
	lda.w #$0200
	sta.b $A5
	jsl.l CODE_9CA41B
	lda.b $A5
	pha
	stz.b $C1
	lda.w #$0007
	sta.b $AD
	lda.w #$000E
	sta.b $8D
CODE_9BCC59:
	ldx.b $8D
	lda.l $7E3598,x
	and.w #$FFFB
	sta.l $7E3598,x
	lda.w #$0005
	sta.b $A5
	jsl.l CODE_9BCD1C
	lda.b $A5
	ldx.b $8D
	sta.l $7E3558,x
	cmp.w #$0004
	bne CODE_9BCC87
	lda.l $7E3598,x
	ora.w #$0004
	sta.l $7E3598,x
CODE_9BCC87:
	lda.w #$0005
	sta.b $A5
	jsl.l CODE_9BCD1C
	ldx.b $8D
	lda.b $A5
	sta.l $7E3548,x
	cmp.w #$0004
	bne CODE_9BCCA8
	lda.l $7E3598,x
	ora.w #$0004
	sta.l $7E3598,x
CODE_9BCCA8:
	dec.b $8D
	dec.b $8D
	dec.b $AD
	bpl CODE_9BCC59
	lda.w #$4000
	sta.b $A5
	jsl.l CODE_9BCD1C
	lda.b $A5
	sta.w $0AD5
	lda.w #$0004
	sta.b $A5
	jsl.l CODE_9BCD1C
	lda.b $A5
	sta.l $7E34CE
	lda.w #$0010
	sta.b $A5
	jsl.l CODE_9BCD1C
	lda.b $A5
	sta.l $7E34F2
	lda.w #$0004
	sta.b $A5
	jsl.l CODE_9BCD1C
	lda.b $A5
	sta.l $7E35D4
	lda.w #$0008
	sta.b $A5
	jsl.l CODE_9BCD1C
	lda.b $A5
	sta.w $0ACF
	lda.w #$0020
	sta.b $A5
	jsl.l CODE_9BCD1C
	lda.b $A5
	sta.l $7E34D0
	lda.b $C1
	and.w #$01FF
	sta.b $C5
	pla
	cmp.b $C5
	beq CODE_9BCD1B
	lda.w #$FFFF
	sta.l $7E34D0
CODE_9BCD1B:
	rtl
