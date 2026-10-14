; Unidentified routine.
CODE_9F992E:
	lda.b d0
	asl a
	adc.b d0
	asl a
	asl a
	sta.b $00
	stz.b $A7
	ldy.b a2
	beq CODE_9F9945
	lda.b $00
	clc
	adc.w #$0138
	sta.b $00
CODE_9F9945:
	lda.w #$009C
	sta.b $8B
	lda.w tmdata,y
	sta.b a0
	clc
	ldy.w #$0000
	adc.b [a0],y
	sta.b a0
	dec.b d0
	bmi CODE_9F9969
CODE_9F995B:
	lda.b a0
	clc
	adc.b [a0]
	adc.w #$0008
	sta.b a0
	dec.b d0
	bpl CODE_9F995B
CODE_9F9969:
	lda.b [a0]
	clc
	adc.b a0
	sta.b a0
	stz.b d0
	stz.b d1
	phx
	lda.w #$0000
CODE_9F9978:
	sta.b d2
	asl a
	tax
	lda.l DATA8_80DA26,x
	bit.b $B7
	bne CODE_9F9987
	jmp.w CODE_9F9A5C
