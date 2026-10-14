; Unidentified routine.
CODE_9EBDF8:
	ldy.b a2
	lda.w $19D0,y
	cmp.w #$0004
	bcc CODE_9EBE24
.1:
	sta.b d1
	lda.w #$0006
	sta.b d0
	lda.w tmsort,y
	tax
	ldy.w #$0000
.loop:
	lda.w position,x
	bmi .2
	beq .2
	iny
.2:
	inx
	inx
	dec.b d0
	bne .loop
	cpy.b d1
	beq CODE_9EBE35
	bcc CODE_9EBE35
CODE_9EBE24:
	ldx.b $E4
	lda.w $19D4,x
	bpl .t1
	jmp.w CODE_9EBDF7

.t1:
	sta.b d4
	jsl.l CODE_9FCD0A
	rtl
