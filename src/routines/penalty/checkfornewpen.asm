; Look for a new penalty call and stop play when it should be called
checkfornewpen:
	lda.w sfhormode
	beq .t1
	jmp.w CODE_9EB2B4

.t1:
	lda.w #PenBuf
	sta.b a0
CODE_9EB1F2:
	lda.b (a0)
	inc.b a0
	inc.b a0
	and.w #$00FF
	cmp.w #$0034
	beq CODE_9EB1F2
	tay
	bne .t2
	jmp.w CODE_9EB2B4

.t2:
	lda.w gmode
	bit.w #$0004
	bne .3
	dec.b a0
	dec.b a0
	lda.b (a0)
	inc.b a0
	inc.b a0
	and.w #$00FF
	sta.b d0
	tay
	lda.w #$0080
	sta.b $8F
	lda.w #DATA8_80D3EB
	sta.b a1
	lda.b [a1],y
	clc
	adc.b a1
	sta.b a1
	lda.b [a1]
	and.w #$00FF
	beq .2
	lda.w $0AD9
	bmi CODE_9EB2B5
	lsr a
	sec
	sbc.w #$0006
	sta.b d0
	dec.b a0
	lda.b (a0)
	inc.b a0
	and.w #$00FF
	bit.w #$0080
	beq .1
	ora.w #$FF00
.1:
	sec
	sbc.w #$0006
	eor.b d0
	bmi CODE_9EB2B5
.2:
	jsl.l Stop4Pen
.3:
	dec.b a0
	lda.b (a0)
	tay
	ora.w #$0080
	sta.b (a0)
	inc.b a0
	tya
	bit.w #$0080
	beq .t1
	jmp.w CODE_9EB1F2

.t1:
	dec.b a0
	dec.b a0
	lda.b (a0)
	inc.b a0
	inc.b a0
	and.w #$00FF
	sta.b d0
	tay
	lda.w #$0080
	sta.b $8F
	lda.w #DATA8_80D3EB
	sta.b a1
	lda.b [a1],y
	clc
	adc.b a1
	sta.b a1
	ldy.w #$0001
	lda.b [a1],y
	and.w #$00FF
	asl a
	asl a
	asl a
	asl a
	asl a
	sta.b d1
	sec
	sbc.w Pencntdwn
	beq CODE_9EB2B1
	bmi CODE_9EB2B1
	lda.b d1
	sta.w Pencntdwn
CODE_9EB2B1:
	jmp.w CODE_9EB1F2
