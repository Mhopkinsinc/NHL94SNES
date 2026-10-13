; Unidentified routine.
CODE_9D9B9B:
	stz.b $14
	ldy.w #$0000
CODE_9D9BA0:
	lda.b [$0C],y
	and.w #$00FF
	beq CODE_9D9BF9
	cmp.w #$0020
	bne CODE_9D9BB6
	cpy.w #$0000
	beq CODE_9D9BF6
	lda.w #$0005
	bra CODE_9D9BF1
