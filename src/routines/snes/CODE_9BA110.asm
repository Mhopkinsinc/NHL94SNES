; Unidentified routine.
CODE_9BA110:
	lda.w $0C7F,x
	sec
	sbc.w $0ADB
	sta.w $0C7F,x
	bpl CODE_9BA106
	ldy.w $0C2B,x
	lda.b [$10],y
	sta.b $0C
	lda.w #$009B
	sta.b $0E
	ldy.w $0C55,x
	lda.b [$0C],y
	bmi .t1
	iny
	iny
	lda.b [$0C],y
	bmi .t1
	tya
	sta.w $0C55,x
	jmp.w CODE_9BA0A2

.t1:
	lda.w $0C2B,x
	cmp.w #$000E
	bne .t2
	stz.w $0C2B,x
	bra CODE_9BA106

.t2:
	cpx.w #$0024
	beq .1
	cpx.w #$0026
	bne .t1x
.1:
	lda.w $0C53
	sta.w $0C2B,x
	bra CODE_9BA166

.t1x:
	cmp.w #$000C
	beq CODE_9BA178
	lda.w #$000C
	sta.w $0C2B,x
CODE_9BA166:
	ldy.w $0C2B,x
	lda.b [$10],y
	sta.b $0C
	lda.w #$009B
	sta.b $0E
	stz.w $0C55,x
	jmp.w CODE_9BA0A2
