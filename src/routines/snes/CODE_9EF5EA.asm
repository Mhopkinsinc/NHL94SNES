; Unidentified routine.
CODE_9EF5EA:
	lda.w pflags,y
	and.w #$FFFE
	sta.w pflags,y
	ldy.w puckc
	bpl .t1
	jmp.w CODE_9EF69A

.t1:
	lda.w pfteam,y
	ldy.b a2
	cmp.w pfteam,y
	beq CODE_9EF5E9
	lda.b d0
	cmp.w #$0025
	bcs CODE_9EF5E9
	lda.w position,y
	beq .1
	ldy.b a0
	lda.w position,y
	beq CODE_9EF5E9
	lda.w stickhand,y
	jsl.l CODE_9FDCEB
	lda.b d0
	pha
	lda.b a0
	ldy.b a2
	sty.b a0
	sta.b a2
	lda.w stickhand,y
	sta.b d0
	jsl.l CODE_9FDCEB
	lda.b a0
	ldy.b a2
	sty.b a0
	sta.b a2
	pla
	sec
	sbc.b d0
	clc
	adc.w #$0024
	jsl.l CODE_9BB370
	cmp.w #$0003
	bcs CODE_9EF5E9
.1:
	ldy.b a0
	lda.w stickhand,y
	jsl.l CODE_9FDCEB
	lda.b d0
	adc.w #$0014
	ldy.b a0
	sta.w nopuck,y
	lda.b a0
	ldy.b a2
	sty.b a0
	sta.b a2
	lda.w stickhand,y
	jsl.l CODE_9FDCEB
	lda.b d0
	adc.w #$0014
	ldy.b a0
	sta.w nopuck,y
	lda.b a0
	ldy.b a2
	sty.b a0
	sta.b a2
	tya
	lsr a
	sta.w $0CF3
	lda.w #$000C
	trb.w sflags
CODE_9EF68B:
	lda.w #$0003
	jsl.l CODE_9C9ABC
	jsl.l a2touchpuck
	jmp.w CODE_9EF722
