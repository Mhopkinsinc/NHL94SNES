; Unidentified routine.
CODE_9FE6EC:
	lda.w #$003C
	sta.w $0AC8
CODE_9FE6F2:
	lda.w $0D2F
	beq CODE_9FE712
	lda.w $1C84
	ora.w $1C86
	ora.w $1C88
	ora.w $1C8A
	ora.w $1C8C
	bne CODE_9FE712
	dec.w $0CE3
	bne CODE_9FE712
CODE_9FE70D:
	lda.w #$1000
	tsb.b $B1
CODE_9FE712:
	lda.b $A9
	ora.b $B1
	bne CODE_9FE71B
	jmp.w CODE_9FE618
