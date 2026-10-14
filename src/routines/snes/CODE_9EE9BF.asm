; Unidentified routine.
CODE_9EE9BF:
	stz.w $0BAB
	lda.w #$0004
	trb.w sflags
	lda.w #$FFFF
	sta.w $0AD9
	lda.w #$0010
	sta.w $1203,x
	txa
	lsr a
	sta.w $0CF3
	lda.w #$0007
	sta.b d0
	lda.w position,x
	beq CODE_9EE9E8
	lda.w $13A3,x
	sta.b d0
CODE_9EE9E8:
	lda.b d0
	asl a
	asl a
	adc.w #$0090
	sta.w passspeed
	lda.w #$FFFF
	sta.b d4
	lda.w #$0005
	sta.b d3
	stz.b a1
	cpx.w #$000C
	bcc CODE_9EEA08
	lda.w #$000C
	sta.b a1
CODE_9EEA08:
	cpx.b a1
	beq CODE_9EEA50
	ldy.b a1
	lda.w position,y
	bmi CODE_9EEA50
	beq CODE_9EEA50
	lda.w pflags,y
	bit.w #$1000
	bne CODE_9EEA50
	lda.w $0B5D,y
	sec
	sbc.w passdir
	sec
	sbc.w #$0004
	stz.b $00
	and.w #$0007
	beq CODE_9EEA3E
	cmp.w #$0001
	beq CODE_9EEA39
	cmp.w #$0007
	bne CODE_9EEA50
CODE_9EEA39:
	lda.w #$1000
	sta.b $00
CODE_9EEA3E:
	lda.b $00
	clc
	adc.w $0B3D,y
	bcs CODE_9EEA50
	cmp.b d4
	bcs CODE_9EEA50
	sta.b d4
	lda.b a1
	sta.b a0
CODE_9EEA50:
	inc.b a1
	inc.b a1
	dec.b d3
	bmi CODE_9EEA5B
	jmp.w CODE_9EEA08
