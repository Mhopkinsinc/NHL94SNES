; Unidentified routine.
CODE_9F992E:
	lda.b $A5
	asl a
	adc.b $A5
	asl a
	asl a
	sta.b $00
	stz.b $A7
	ldy.b $91
	beq CODE_9F9945
	lda.b $00
	clc
	adc.w #$0138
	sta.b $00
CODE_9F9945:
	lda.w #$009C
	sta.b $8B
	lda.w tmdata,y
	sta.b $89
	clc
	ldy.w #$0000
	adc.b [$89],y
	sta.b $89
	dec.b $A5
	bmi CODE_9F9969
CODE_9F995B:
	lda.b $89
	clc
	adc.b [$89]
	adc.w #$0008
	sta.b $89
	dec.b $A5
	bpl CODE_9F995B
CODE_9F9969:
	lda.b [$89]
	clc
	adc.b $89
	sta.b $89
	stz.b $A5
	stz.b $A9
	phx
	lda.w #$0000
CODE_9F9978:
	sta.b $AD
	asl a
	tax
	lda.l DATA8_80DA26,x
	bit.b $B7
	bne CODE_9F9987
	jmp.w CODE_9F9A5C
