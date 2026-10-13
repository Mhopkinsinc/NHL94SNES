; Unidentified routine.
CODE_9BA15B:
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
	jmp.w $A0A2
