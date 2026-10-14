; Unidentified routine.
CODE_9EA9D5:
	tax
	lda.b d7
	jsl.l CODE_808F5D
	ldx.b a3
	sta.b tmp0
	lda.w $0EC3,x
	xba
	and.w #$00FF
	cmp.w #$0080
	bcc CODE_9EA9EF
	ora.w #$FF00
CODE_9EA9EF:
	tax
	jsl.l CODE_808F7D
	sta.b d4
	ldx.b a3
	lda.w $0EE3,x
	xba
	and.w #$00FF
	cmp.w #$0080
	bcc CODE_9EAA07
	ora.w #$FF00
CODE_9EAA07:
	tax
	jsl.l CODE_808F7D
	clc
	adc.b d4
	sta.b d3
	lda.w #$0300
	sec
	sbc.b d3
	sta.b d4
	sec
	sbc.w #$0180
	bpl CODE_9EAA24
	lda.w #$0180
	sta.b d4
CODE_9EAA24:
	lda.b tmp0
	ldx.b d4
	jsl.l CODE_808FEB
	lda.b $0A
	sta.b $B7
	lda.b $08
	sta.b d4
	ldx.b a3
	lda.w $1523,x
	beq CODE_9EAA4A
	lda.w #$0000
	sec
	sbc.b d4
	sta.b d4
	lda.w #$0000
	sbc.b $B7
	sta.b $B7
CODE_9EAA4A:
	lda.w $1183,x
	clc
	adc.b d4
	sta.w $1183,x
	lda.w facedir,x
	adc.b $B7
	and.w #$0007
	sta.w facedir,x
	sta.b d2
	lda.b d3
	cmp.w #$0015
	bcc CODE_9EAA89
	stz.b d1
	lda.b tmp0
	bpl CODE_9EAA72
	lda.w #$FFCE
	sta.b d1
CODE_9EAA72:
	lda.w attribute,x
	bit.w #$0800
	beq CODE_9EAA81
	lda.b d1
	eor.w #$FFCE
	sta.b d1
CODE_9EAA81:
	lda.b d1
	clc
	adc.w #$EBE2
	sta.b d1
CODE_9EAA89:
	lda.w $1543,x
	bne CODE_9EAA98
	jsl.l SetSPA
	lda.w #$0001
	sta.w $1543,x
CODE_9EAA98:
	lda.b d3
	cmp.w #$0003
	bcc CODE_9EAAA2
	jmp.w CODE_9EAB64
