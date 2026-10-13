; Unidentified routine.
CODE_9E8076:
	ldy.b $91
	lda.w $17AE,y
	sta.b $AD
	lda.w $17B2,y
	sta.b $8D
	lda.b $AD
	bmi CODE_9E80BF
CODE_9E8086:
	cpx.b $8D
	beq CODE_9E80BF
	lda.w $15D6
	bne CODE_9E80BF
	ldy.b $8D
	lda.w pflags,y
	bit.w #$1000
	bne CODE_9E80BF
	lda.w position,y
	beq CODE_9E80BF
	lda.w $0B7D,y
	cmp.w #$0015
	beq CODE_9E80BF
	ldx.b $8D
	lda.w pflags,x
	and.w #$FFFE
	sta.w pflags,x
	lda.w #$0012
	sta.b $A5
	jsl.l assinsert
	ldx.b $E4
	jmp.w $8BE6
