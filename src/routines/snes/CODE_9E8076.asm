; Unidentified routine.
CODE_9E8076:
	ldy.b a2
	lda.w $17AE,y
	sta.b d2
	lda.w $17B2,y
	sta.b a1
	lda.b d2
	bmi CODE_9E80BF
CODE_9E8086:
	cpx.b a1
	beq CODE_9E80BF
	lda.w gmclock
	bne CODE_9E80BF
	ldy.b a1
	lda.w pflags,y
	bit.w #$1000
	bne CODE_9E80BF
	lda.w position,y
	beq CODE_9E80BF
	lda.w $0B7D,y
	cmp.w #$0015
	beq CODE_9E80BF
	ldx.b a1
	lda.w pflags,x
	and.w #$FFFE
	sta.w pflags,x
	lda.w #$0012
	sta.b d0
	jsl.l assinsert
	ldx.b $E4
	jmp.w CODE_9E8BE6
