; Unidentified routine.
CODE_9BAE77:
	lda.w $0CAB
	cmp.w #$FFFF
	bne CODE_9BAECF
	lda.w $0AE7
	cmp.w #$000F
	beq .t1
	asl a
	tax
	lda.w #$000F
	sta.w $0AF3
	lda.w Xpos,x
	sta.w $0D75
	lda.w Ypos,x
	sta.w $0DD7
	bra CODE_9BAECF

.t1:
	lda.w #$000F
	sta.w $0AF3
	lda.w puckx
	cmp.w #$FF78
	bpl .2
.1:
	lda.w #$FF78
.2:
	cmp.w #$0088
	bmi .4
.3:
	lda.w #$0088
.4:
	sta.w $0D75
	lda.w pucky
	cmp.w #$FED4
	bpl .6
.5:
	lda.w #$FED4
.6:
	cmp.w #$012C
	bmi .8
.7:
	lda.w #$012C
.8:
	sta.w $0DD7
CODE_9BAECF:
	lda.b d1
	bit.w #$8000
	beq .2
	lda.l $7E35F0
	beq .1
	lda.l $7E35D0
	clc
	adc.l $7E35AA
	ldx.w #$0180
	ldy.w #$0000
	jsl.l CODE_808862
	jsl.l WaitFrame
	lda.w #$0000
	sta.l $7E35F0
.1:
	lda.w sflags3
	eor.w #$0002
	sta.w sflags3
.2:
	lda.b d3
	bit.w #$0020
	bne .t1
	bit.w #$0050
	bne .t5
	lda.b d1
	bit.w #$2000
	bne .t3
	bit.w #$1000
	bne .t2
	lda.b d3
	bit.w #$0080
	bne .t4
	bit.w #$4000
	beq CODE_9BAF80
	jsl.l suba4
	jsl.l suba4
	bra CODE_9BAF6E

.t1:
	jsl.l suba4
	ldx.w #$0006
	bra CODE_9BAF67

.t2:
	jmp.w CODE_9BB020

.t3:
	lda.w #$FFFF
	sta.w $0CAB
	lda.w #$0020
	trb.w sflags
	jmp.w CODE_9BACE5

.t4:
	jsl.l adda4
	jsl.l adda4
	bra CODE_9BAF6E

.t5:
	jsl.l adda4
	ldx.w #$0006
	lda.b d3
	bit.w #$0010
	bne CODE_9BAF67
	ldx.w #$000C
CODE_9BAF67:
	ldy.w #$0000
	jsl.l WaitFrames_Inc
CODE_9BAF6E:
	jsl.l SoundVoicesOff
	lda.w #$0001
	sta.b d7
	lda.w #$0002
	trb.w sflags3
	jmp.w CODE_9BABAB
