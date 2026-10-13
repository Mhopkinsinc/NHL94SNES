; Unidentified routine.
CODE_9EE17A:
	lda.w #$0008
	sta.w passdir
	lda.w #$0008
	tsb.w sflags
	stz.b $A5
	lda.w #$0128
	sta.b $A9
	lda.w pfgoal,x
	bne CODE_9EE197
	lda.w #$FED8
	sta.b $A9
CODE_9EE197:
	lda.b $A5
	sec
	sbc.w Xpos,x
	sta.b $A5
	lda.b $A9
	sec
	sbc.w Ypos,x
	sta.b $A9
	jsl.l vtoa
	lda.w #$000F
	sta.w passspeed
	ldy.w #$ED4A
	jsl.l Findhittype
	beq CODE_9EE1BD
	ldy.w #$EE5C
CODE_9EE1BD:
	sty.b $A9
	jml.l SetSPA
