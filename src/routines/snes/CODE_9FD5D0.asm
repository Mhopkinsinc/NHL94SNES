; Unidentified routine.
CODE_9FD5D0:
	ldy.b d4
	lda.b [a0],y
	and.w #$00FF
	sta.b d5
	tay
	sep #$20
	lda.b [a1],y
	ldy.b d4
	sta.b [a4],y
	lda.b d5
	beq .1
	lda.w $1E9B
	beq .1
	lda.w $1E8F
	inc a
	sta.b [a4],y
.1:
	iny
	iny
	iny
	iny
	iny
	iny
	lda.b d5
	sta.b [a4],y
	rep #$20
	lda.b d5
	bne CODE_9FD61C
	ldy.b a2
	lda.w tmgoalie,y
	inc a
	sta.b d3
	bne .2
	lda.w $1E9B
	beq .2
	inc.b d3
.2:
	ldy.b d4
	sep #$20
	lda.b d3
	sta.b [a4],y
	rep #$20
CODE_9FD61C:
	dec.b d4
	bpl CODE_9FD5D0
	lda.w #$0005
	sta.b d4
CODE_9FD625:
	ldy.b d4
	lda.b [a4],y
	and.w #$00FF
	sta.b d3
	bne .t1
	jmp.w CODE_9FD6B8

.t1:
	and.w #$00FF
	bit.w #$0080
	beq .1
	ora.w #$FF00
.1:
	dec a
	asl a
	sta.b d3
	lda.b a2
	beq .2
	lda.w #$0034
.2:
	clc
	adc.b d3
	tay
	lda.w tmpdst,y
	cmp.w #$FFFD
	beq .3
	cmp.w #$FFFC
	beq .3
	lda.w tmpdst,y
	bmi CODE_9FD6B8
	beq CODE_9FD6B8
.3:
	lda.b $97
	pha
	lda.b a3
	pha
	jsl.l CODE_9B9320
	lda.b $97
	sta.b $8F
	lda.b a3
	sta.b a1
	pla
	sta.b a3
	pla
	sta.b $97
	lda.b d4
	clc
	adc.w #$0006
	tay
	lda.b [a4],y
	and.w #$00FF
	asl a
	sta.b d0
	lda.w #$0080
	sta.b $8B
	lda.w #$D646
	sta.b a0
	ldy.b d0
	lda.b [a0],y
	clc
	adc.b a0
	sta.b a0
.loop:
	lda.b [a0]
	inc.b a0
	and.w #$00FF
	sta.b d0
	bit.w #$0080
	bne CODE_9FD6C0
	ldy.b d0
	lda.b [a1],y
	and.w #$00FF
	sta.b d0
	jsl.l TryAddPlayerToList
	beq .loop
CODE_9FD6B8:
	dec.b d4
	bmi .t1
	jmp.w CODE_9FD625

.t1:
	rtl
