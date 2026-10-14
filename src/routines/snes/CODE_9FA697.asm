; Unidentified routine.
CODE_9FA697:
	lda.b d0
	pha
	lda.b $A7
	pha
	lda.b d1
	pha
	lda.b $AB
	pha
	lda.b d2
	pha
	lda.b $AF
	pha
	stx.b xsave
	ldx.w #$0000
CODE_9FA6AE:
	lda.b a0,x
	pha
	inx
	inx
	cpx.w #$0014
	bne CODE_9FA6AE
	ldx.b xsave
	lda.w #$FFFF
	sta.w $1D55
	sta.w $1D57
	stz.b a2
	jsl.l CODE_9FDE13
	inc.b a2
	inc.b a2
	jsl.l CODE_9FDE13
	lda.w #$007E
	sta.b $9B
	lda.w #$3136
	clc
	adc.l $7E313A
	sta.b a4
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF892
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b $8F
	lda.w #$0013
	sta.b d0
	lda.w #$0005
	sta.b d1
	ldy.w #$0004
	lda.b [a4],y
	bit.w #$0080
	bne CODE_9FA718
	inc.b d1
	inc.b d1
	lda.b [a4],y
	bmi CODE_9FA718
	inc.b d1
CODE_9FA718:
	jsl.l CODE_9D8000
	stz.b a2
	ldy.w #$0002
	lda.b [a4],y
	bit.w #$0080
	beq CODE_9FA72C
	inc.b a2
	inc.b a2
CODE_9FA72C:
	lda.w #$009F
	sta.b $8F
	lda.w #GoalBoxText
	sta.b a1
	ldy.w #$0003
	lda.b [a4],y
	and.w #$00FF
	ldy.b a2
	beq CODE_9FA746
	clc
	adc.w #$001A
CODE_9FA746:
	tay
	lda.w $18EE,y
	and.w #$00FF
	cmp.w #$0003
	bne CODE_9FA77B
	jsl.l GoalieCount
	ldy.w #$0003
	lda.b [a4],y
	and.w #$00FF
	cmp.b d0
	bmi CODE_9FA77B
	lda.b a1
	clc
	adc.b [a1]
	sta.b a1
	ldy.b a2
	bne CODE_9FA77B
	jsl.l CODE_9BA189
	lda.w Pencntdwn
	clc
	adc.w #$000A
	sta.w Pencntdwn
CODE_9FA77B:
	jsl.l CODE_9ECE15
	ldy.w #$0003
	lda.b [a4],y
	and.w #$00FF
	sta.b d0
	jsl.l CODE_9FC4D0
	jsl.l print
	ldy.w #$0004
	lda.b [a4],y
	and.w #$00FF
	sta.b d0
	bit.w #$0080
	bne CODE_9FA7F3
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF897
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b $8F
	jsl.l CODE_9FC4D0
	jsl.l print
	ldy.w #$0005
	lda.b [a4],y
	and.w #$00FF
	sta.b d0
	bit.w #$0080
	bne CODE_9FA7F3
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF8A9
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b $8F
	jsl.l CODE_9FC4D0
	jsl.l print
CODE_9FA7F3:
	stx.b xsave
	ldx.w #$0012
CODE_9FA7F8:
	pla
	sta.b a0,x
	dex
	dex
	bpl CODE_9FA7F8
	ldx.b xsave
	pla
	sta.b $AF
	pla
	sta.b d2
	pla
	sta.b $AB
	pla
	sta.b d1
	pla
	sta.b $A7
	pla
	sta.b d0
	ldx.b a3
	rtl
