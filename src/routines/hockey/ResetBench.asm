; Unidentified routine.
ResetBench:
	stz.w PBnum
	lda.w #$0010
	sta.b $A9
	stz.b $89
	jsl.l CODE_9FCDC4
	lda.w #$0001
	sta.b $A9
	lda.w #$0002
	sta.b $89
CODE_9FCDC4:
	lda.w #$0032
	sta.b $A5
CODE_9FCDC9:
	lda.w PBnum
	clc
	adc.b $A9
	sta.w PBnum
	lda.b $89
	beq CODE_9FCDD9
	lda.w #$0034
CODE_9FCDD9:
	adc.b $A5
	tay
	lda.w tmpdst,y
	bmi CODE_9FCDFA
	beq CODE_9FCDFA
	bit.w #$1000
	beq CODE_9FCE16
	and.w #$07FF
	sta.b $AD
	bne CODE_9FCE16
	lda.w PBnum
	sec
	sbc.b $A9
	sta.w PBnum
	bra CODE_9FCE16
