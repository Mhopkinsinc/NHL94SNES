; Unidentified routine.
CODE_9EE9BF:
	stz.w $0BAB
	lda.w #$0004
	trb.w sflags
	lda.w #$FFFF
	sta.w puckc
	lda.w #$0010
	sta.w nopuck,x
	txa
	lsr a
	sta.w $0CF3
	lda.w #$0007
	sta.b $A5
	lda.w position,x
	beq CODE_9EE9E8
	lda.w $13A3,x
	sta.b $A5
CODE_9EE9E8:
	lda.b $A5
	asl a
	asl a
	adc.w #$0090
	sta.w passspeed
	lda.w #$FFFF
	sta.b $B5
	lda.w #$0005
	sta.b $B1
	stz.b $8D
	cpx.w #$000C
	bcc CODE_9EEA08
	lda.w #$000C
	sta.b $8D
CODE_9EEA08:
	cpx.b $8D
	beq CODE_9EEA50
	ldy.b $8D
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
	cmp.b $B5
	bcs CODE_9EEA50
	sta.b $B5
	lda.b $8D
	sta.b $89
CODE_9EEA50:
	inc.b $8D
	inc.b $8D
	dec.b $B1
	bmi CODE_9EEA5B
	jmp.w $EA08
