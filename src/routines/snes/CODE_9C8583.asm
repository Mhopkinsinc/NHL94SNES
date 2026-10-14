; Unidentified routine.
CODE_9C8583:
	jsl.l CODE_9DE0E9
	lda.b a2
	pha
	ldx.b a2
	lda.w HomeTeam,x
	sta.l $7E3454
	lda.w #$001D
	sta.l $7E3452
	jsl.l CODE_9DD9AD
	ldx.w #$0049
	ldy.w #$0018
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF2D3
	sta.b a1
	jsl.l CODE_9C936C
	jsl.l SpriteFrameEnd
	jsl.l CODE_9DE0D4
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF2E1
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b $8F
	lda.w #$0800
	sta.w $0D0D
	lda.w #$000E
	sta.b d0
	lda.w #$0003
	sta.b d1
	jsl.l CODE_9D80DD
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF2E6
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b $8F
	lda.w #$0001
	sta.w $1DF9
	jsl.l CODE_9C8826
	lda.w #$0007
	sta.w $1DC5
	jsl.l CODE_9C8B54
	jsl.l CODE_9C8B69
	lda.w #$0058
	ldx.w #$00C0
	ldy.w #$00D0
	jsl.l CODE_9BCDF8
	lda.w #$0018
	sta.w $1DF5
	lda.w #$0001
	sta.l $7E3478
	jsl.l CODE_9DD923
	jsl.l CODE_9C88A0
	jsl.l CODE_9DDFF6
	jsl.l CODE_8086BD
CODE_9C8644:
	jsl.l CODE_9B8017
	jsl.l CODE_9B851F
	jsl.l ProcessInputWithRepeat
	lda.b d3
	bit.w #$1000
	beq CODE_9C865A
	jmp.w CODE_9C86F3
