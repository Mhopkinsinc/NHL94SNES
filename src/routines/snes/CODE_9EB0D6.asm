; Unidentified routine.
CODE_9EB0D6:
	lda.w Xvel,x
	tax
	lda.w #$00C0
	jsl.l CODE_808FC9
	ldx.b $95
	lda.b $09
	sta.w Xvel,x
	lda.w Yvel,x
	tax
	lda.w #$00C0
	jsl.l CODE_808FC9
	ldx.b $95
	lda.b $09
	sta.w Yvel,x
	txa
	lsr a
	cmp.w puckc
	bne CODE_9EB10D
	lda.w #$FFFF
	sta.w puckc
	lda.w #$0708
	sta.w nopuck,x
CODE_9EB10D:
	lda.w pflags,x
	bit.w #$0002
	beq CODE_9EB13F
	and.w #$FFFD
	sta.w pflags,x
	jsl.l CODE_9EB17A
	stz.w temp2,x
	lda.w #$0008
	sta.w temp2b,x
	lda.w #$005A
	sta.w temp3,x
	lda.w Hpos
	bpl CODE_9EB139
	lda.w #$FFA6
	sta.w temp3,x
CODE_9EB139:
	lda.w Vpos
	sta.w temp4,x
CODE_9EB13F:
	lda.w #$009E
	sta.b $8B
	lda.w #rtss
	sta.b $89
	lda.w temp3,x
	sta.b $A5
	lda.w temp4,x
	sta.b $A9
	lda.w temp1,x
	sec
	sbc.b $C1
	sta.w temp1,x
	bpl CODE_9EB185
	lda.w #SPAcelebrate
	sta.b $A9
	sta.w pfalock,x
	cpx.w $0D29
	bne CODE_9EB176
CODE_9EB16B:
	lda.w #DATA8_9DFA84
	sta.b $A9
	lda.w #$FFFF
	sta.w $0D29
CODE_9EB176:
	jsl.l SetSPA
CODE_9EB17A:
	lda.w #$0078
	jsl.l CODE_9BB385
	sta.w temp1,x
	rtl
