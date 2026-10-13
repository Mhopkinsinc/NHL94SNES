; Unidentified routine.
CODE_9BA003:
	cpx.w #$0026
	beq CODE_9BA076
	cpx.w #$0024
	beq CODE_9BA076
	cpx.w #$0022
	beq CODE_9BA04D
	cpx.w #$0020
	beq CODE_9BA079
	cpx.w #$0028
	beq CODE_9BA038
	ldy.w #$0008
	lda.b [$10],y
	asl a
	asl a
	asl a
	asl a
	asl a
	asl a
	cmp.l $7E35E0
	beq CODE_9BA02F
	bcs CODE_9BA076
CODE_9BA02F:
	jsl.l RandomWord
	and.w #$03F0
	bne CODE_9BA076
CODE_9BA038:
	lda.w #$000A
	sta.w $0C2B,x
	tay
	stz.w $0C55,x
	lda.b [$10],y
	sta.b $0C
	lda.w #$009B
	sta.b $0E
	bra CODE_9BA0A2
