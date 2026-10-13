; Unidentified routine.
CODE_9EA9D5:
	tax
	lda.b $C1
	jsl.l CODE_808F5D
	ldx.b $95
	sta.b $C5
	lda.w Xvel,x
	xba
	and.w #$00FF
	cmp.w #$0080
	bcc CODE_9EA9EF
	ora.w #$FF00
CODE_9EA9EF:
	tax
	jsl.l CODE_808F7D
	sta.b $B5
	ldx.b $95
	lda.w Yvel,x
	xba
	and.w #$00FF
	cmp.w #$0080
	bcc CODE_9EAA07
	ora.w #$FF00
CODE_9EAA07:
	tax
	jsl.l CODE_808F7D
	clc
	adc.b $B5
	sta.b $B1
	lda.w #$0300
	sec
	sbc.b $B1
	sta.b $B5
	sec
	sbc.w #$0180
	bpl CODE_9EAA24
	lda.w #$0180
	sta.b $B5
CODE_9EAA24:
	lda.b $C5
	ldx.b $B5
	jsl.l CODE_808FEB
	lda.b $0A
	sta.b $B7
	lda.b $08
	sta.b $B5
	ldx.b $95
	lda.w pfrev,x
	beq CODE_9EAA4A
	lda.w #$0000
	sec
	sbc.b $B5
	sta.b $B5
	lda.w #$0000
	sbc.b $B7
	sta.b $B7
CODE_9EAA4A:
	lda.w facefrac,x
	clc
	adc.b $B5
	sta.w facefrac,x
	lda.w facedir,x
	adc.b $B7
	and.w #$0007
	sta.w facedir,x
	sta.b $AD
	lda.b $B1
	cmp.w #$0015
	bcc CODE_9EAA89
	stz.b $A9
	lda.b $C5
	bpl CODE_9EAA72
	lda.w #$FFCE
	sta.b $A9
CODE_9EAA72:
	lda.w attribute,x
	bit.w #$0800
	beq CODE_9EAA81
	lda.b $A9
	eor.w #$FFCE
	sta.b $A9
CODE_9EAA81:
	lda.b $A9
	clc
	adc.w #SPAturnr
	sta.b $A9
CODE_9EAA89:
	lda.w pf2aip,x
	bne CODE_9EAA98
	jsl.l SetSPA
	lda.w #$0001
	sta.w pf2aip,x
CODE_9EAA98:
	lda.b $B1
	cmp.w #$0003
	bcc CODE_9EAAA2
	jmp.w $AB64
