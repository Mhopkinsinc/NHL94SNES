; Unidentified routine.
CODE_9EB0D6:
	lda.w $0EC3,x
	tax
	lda.w #$00C0
	jsl.l CODE_808FC9
	ldx.b $95
	lda.b $09
	sta.w $0EC3,x
	lda.w $0EE3,x
	tax
	lda.w #$00C0
	jsl.l CODE_808FC9
	ldx.b $95
	lda.b $09
	sta.w $0EE3,x
	txa
	lsr a
	cmp.w $0AD9
	bne CODE_9EB10D
	lda.w #$FFFF
	sta.w $0AD9
	lda.w #$0708
	sta.w $1203,x
CODE_9EB10D:
	lda.w pflags,x
	bit.w #$0002
	beq CODE_9EB13F
	and.w #$FFFD
	sta.w pflags,x
	jsl.l CODE_9EB17A
	stz.w $1023,x
	lda.w #$0008
	sta.w $10A3,x
	lda.w #$005A
	sta.w $1043,x
	lda.w $0CEB
	bpl CODE_9EB139
	lda.w #$FFA6
	sta.w $1043,x
CODE_9EB139:
	lda.w $0D37
	sta.w $1063,x
CODE_9EB13F:
	lda.w #$009E
	sta.b $8B
	lda.w #CODE_9ED0FC
	sta.b $89
	lda.w $1043,x
	sta.b $A5
	lda.w $1063,x
	sta.b $A9
	lda.w $1003,x
	sec
	sbc.b $C1
	sta.w $1003,x
	bpl CODE_9EB185
	lda.w #$F940
	sta.b $A9
	sta.w $14E3,x
	cpx.w $0D29
	bne CODE_9EB176
CODE_9EB16B:
	lda.w #$FA84
	sta.b $A9
	lda.w #$FFFF
	sta.w $0D29
CODE_9EB176:
	jsl.l SetSPA
CODE_9EB17A:
	lda.w #$0078
	jsl.l CODE_9BB385
	sta.w $1003,x
	rtl
