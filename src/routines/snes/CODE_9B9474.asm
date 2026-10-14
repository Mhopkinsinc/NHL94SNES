; Unidentified routine.
CODE_9B9474:
	lda.w $1DC1
	cmp.w #$0006
	bcc CODE_9B9480
CODE_9B947C:
	jsl.l CODE_9B9A5D
CODE_9B9480:
	jsr.w CODE_9B95B0
	jsl.l CODE_9DD923
	lda.w #$0058
	ldx.w #$00D0
	ldy.w #$00E0
	jsl.l CODE_9BCDF8
	jsl.l CODE_9DDFF6
	jsl.l CODE_8086BD
	lda.w #$0005
	sta.w $1DC5
	jsr.w CODE_9B9562
CODE_9B94A5:
	jsl.l CODE_9B851F
	lda.b $B1
	bit.w #$1000
	beq CODE_9B94B1
	rtl
