; Unidentified routine.
CODE_9BC2DF:
	bit.w #DMA_OAM
	bne CODE_9BC35C
CODE_9BC2E4:
	lda.w $1DBD
	beq CODE_9BC316
	dec a
	bne CODE_9BC2F2
CODE_9BC2EC:
	cmp.l $7E35D6
	beq CODE_9BC316
CODE_9BC2F2:
	lda.w #$0004
	sta.w printx
	lda.w $1DBD
	asl a
	adc.w $1DBD
	sta.w printy
	lda.w #$2000
	sta.w $0D0D
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9C9363
	sta.b a1
	jsl.l CODE_9EC894
CODE_9BC316:
	lda.w $1DBD
	clc
	adc.w $1DC5
	clc
	adc.w $1DE9
	cmp.w $1DC1
	bpl CODE_9BC351
	lda.w #$0004
	sta.w printx
	lda.w $1DBD
	clc
	adc.w $1DC5
	dec a
	sta.b $14
	asl a
	adc.b $14
	inc a
	sta.w printy
	lda.w #$2000
	sta.w $0D0D
	lda.w #$009C
	sta.b $8F
	lda.w #$9366
	sta.b a1
	jsl.l CODE_9EC894
CODE_9BC351:
	jsl.l CODE_9BC44B
	jsl.l WaitFrame
	jmp.w CODE_9BC2C9
