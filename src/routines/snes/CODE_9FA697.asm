; Unidentified routine.
CODE_9FA697:
	lda.b $A5
	pha
	lda.b $A7
	pha
	lda.b $A9
	pha
	lda.b $AB
	pha
	lda.b $AD
	pha
	lda.b $AF
	pha
	stx.b $87
	ldx.w #$0000
CODE_9FA6AE:
	lda.b $89,x
	pha
	inx
	inx
	cpx.w #$0014
	bne CODE_9FA6AE
	ldx.b $87
	lda.w #$FFFF
	sta.w $1D55
	sta.w $1D57
	stz.b $91
	jsl.l CODE_9FDE13
	inc.b $91
	inc.b $91
	jsl.l CODE_9FDE13
	lda.w #$007E
	sta.b $9B
	lda.w #$3136
	clc
	adc.l $7E313A
	sta.b $99
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF892
	sta.b $8D
	jsl.l CODE_9EC7BE
	pla
	sta.b $8D
	pla
	sta.b $8F
	lda.w #$0013
	sta.b $A5
	lda.w #$0005
	sta.b $A9
	ldy.w #$0004
	lda.b [$99],y
	bit.w #$0080
	bne CODE_9FA718
	inc.b $A9
	inc.b $A9
	lda.b [$99],y
	bmi CODE_9FA718
	inc.b $A9
CODE_9FA718:
	jsl.l CODE_9D8000
	stz.b $91
	ldy.w #$0002
	lda.b [$99],y
	bit.w #$0080
	beq CODE_9FA72C
	inc.b $91
	inc.b $91
CODE_9FA72C:
	lda.w #$009F
	sta.b $8F
	lda.w #GoalBoxText
	sta.b $8D
	ldy.w #$0003
	lda.b [$99],y
	and.w #$00FF
	ldy.b $91
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
	lda.b [$99],y
	and.w #$00FF
	cmp.b $A5
	bmi CODE_9FA77B
	lda.b $8D
	clc
	adc.b [$8D]
	sta.b $8D
	ldy.b $91
	bne CODE_9FA77B
	jsl.l CODE_9BA189
	lda.w Pencntdwn
	clc
	adc.w #$000A
	sta.w Pencntdwn
CODE_9FA77B:
	jsl.l CODE_9ECE15
	ldy.w #$0003
	lda.b [$99],y
	and.w #$00FF
	sta.b $A5
	jsl.l CODE_9FC4D0
	jsl.l CODE_9EC7BE
	ldy.w #$0004
	lda.b [$99],y
	and.w #$00FF
	sta.b $A5
	bit.w #$0080
	bne CODE_9FA7F3
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF897
	sta.b $8D
	jsl.l CODE_9EC7BE
	pla
	sta.b $8D
	pla
	sta.b $8F
	jsl.l CODE_9FC4D0
	jsl.l CODE_9EC7BE
	ldy.w #$0005
	lda.b [$99],y
	and.w #$00FF
	sta.b $A5
	bit.w #$0080
	bne CODE_9FA7F3
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF8A9
	sta.b $8D
	jsl.l CODE_9EC7BE
	pla
	sta.b $8D
	pla
	sta.b $8F
	jsl.l CODE_9FC4D0
	jsl.l CODE_9EC7BE
CODE_9FA7F3:
	stx.b $87
	ldx.w #$0012
CODE_9FA7F8:
	pla
	sta.b $89,x
	dex
	dex
	bpl CODE_9FA7F8
	ldx.b $87
	pla
	sta.b $AF
	pla
	sta.b $AD
	pla
	sta.b $AB
	pla
	sta.b $A9
	pla
	sta.b $A7
	pla
	sta.b $A5
	ldx.b $95
	rtl
