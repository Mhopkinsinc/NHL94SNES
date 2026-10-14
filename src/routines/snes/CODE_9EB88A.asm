; Unidentified routine.
CODE_9EB88A:
	lda.w sfhormode
	beq .t2
	jmp.w CODE_9EB94B

.t2:
	lda.b d1
	pha
	lda.b $AB
	pha
	lda.b a0
	pha
	lda.b $8B
	pha
	lda.b a1
	pha
	lda.b $8F
	pha
	lda.b d0
	cmp.w #$000E
	bne .1
.1:
	sec
	sbc.w #$000E
	bmi .3
	lda.l $7E35E0
	clc
	adc.w #$00C8
	sta.l $7E35E0
	lda.w #$002D
	sta.b $81
	lda.w pfteam,x
	beq .3
	lda.l $7E35E0
	sec
	sbc.w #$00C8
	bcs .2
	lda.w #$0000
.2:
	sta.l $7E35E0
.3:
	lda.w #$0000
	sta.b $8F
	lda.w #PenBuf
	sta.b a1
	lda.w #$001F
	sta.b d1
.loop:
	lda.b [a1]
	inc.b a1
	inc.b a1
	and.w #$00FF
	cmp.w #$0034
	beq .loop
	tay
	beq .t1
	dec.b d1
	bpl .loop
	bra CODE_9EB939

.t1:
	dec.b a1
	dec.b a1
	txa
	lsr a
	xba
	and.w #$FF00
	ora.b d0
	sta.b [a1]
	lda.w #$0080
	sta.b $8B
	lda.w #DATA8_80D3EB
	sta.b a0
	ldy.b d0
	clc
	adc.b [a0],y
	sta.b a0
	lda.b [a0]
	and.w #$00FF
	beq CODE_9EB939
	lda.w pflags,x
	pha
	ora.w #$4000
	sta.w pflags,x
	pla
	bit.w #$4000
	beq CODE_9EB939
	lda.w #$0000
	sta.b [a1]
CODE_9EB939:
	pla
	sta.b $8F
	pla
	sta.b a1
	pla
	sta.b $8B
	pla
	sta.b a0
	pla
	sta.b $AB
	pla
	sta.b d1
CODE_9EB94B:
	rtl
