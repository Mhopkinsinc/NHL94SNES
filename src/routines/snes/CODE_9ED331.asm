; Unidentified routine.
CODE_9ED331:
	lda.w #$0006
	ora.w $0B05,x
	sta.w $0B05,x
	lda.w Xpos,x
	cmp.w #$FFD8
	bmi CODE_9ED368
	cmp.w #$0029
	bpl CODE_9ED368
	lda.w Ypos,x
	bit.w #$8000
	beq CODE_9ED353
	eor.w #$FFFF
	inc a
CODE_9ED353:
	sta.b $00
	cmp.w #$00E4
	bmi CODE_9ED368
	cmp.w #$0104
	bpl CODE_9ED368
	lda.w #$FFFB
	and.w $0B05,x
	sta.w $0B05,x
CODE_9ED368:
	lda.w Xpos,x
	cmp.w #$FFD0
	bmi CODE_9ED391
	cmp.w #$0031
	bpl CODE_9ED391
	lda.w Ypos,x
	bit.w #$8000
	beq CODE_9ED381
	eor.w #$FFFF
	inc a
CODE_9ED381:
	sta.b $00
	cmp.w #$00E4
	bmi CODE_9ED391
	lda.w #$FFFD
	and.w $0B05,x
	sta.w $0B05,x
CODE_9ED391:
	jsl.l CODE_9FDC4C
	lda.w pflags,x
	bit.w #$0002
	beq CODE_9ED3B5
	and.w #$FFFD
	sta.w pflags,x
	stz.w $1003,x
	stz.w $1023,x
	lda.w #$0008
	sta.w $10A3,x
	lda.w #$FFFF
	sta.w $1063,x
CODE_9ED3B5:
	ldy.w $19D4,x
	bpl CODE_9ED408
	lda.w Xpos,x
	cmp.w #$FFCB
	bmi CODE_9ED3DD
	cmp.w #$0035
	bpl CODE_9ED3DD
	lda.w Ypos,x
	bit.w #$8000
	beq CODE_9ED3D3
	eor.w #$FFFF
	inc a
CODE_9ED3D3:
	cmp.w #$010F
	bcs CODE_9ED3DD
	cmp.w #$00D3
	bcs CODE_9ED41E
CODE_9ED3DD:
	lda.w #$009E
	sta.b $8B
	lda.w #CODE_9ED0FC
	sta.b $89
	ldy.w #$0004
	lda.w Xpos,x
	bpl CODE_9ED3F2
	ldy.w #$FFFC
CODE_9ED3F2:
	sty.b $A5
	lda.w #$00F4
	sta.b $A9
	lda.w pfgoal,x
	beq CODE_9ED403
	lda.w #$FF0C
	sta.b $A9
CODE_9ED403:
	jml.l CODE_9EA5A4
