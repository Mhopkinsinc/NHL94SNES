; Unidentified routine.
CODE_9FB092:
	lda.w #$2400
	sta.b $0C
	stz.b $0E
	lda.w #$0007
	jsl.l CODE_9C9AD0
	lda.w #$0100
	trb.w sflags
	lda.w #$0000
	sta.l $7E3120
	lda.w #DMA_OAM
	trb.w sflags
	stz.w $0CA9
	stz.w gmclock
	lda.w #$0010
	tsb.w sflags3
	lda.l $7E3122
	sta.b d3
	lda.w #$0800
	sta.b d4
	stz.b a1
	lda.w #$0010
	sta.b d2
	lda.l $7E312A
	tax
	lda.l DATA8_9FB1F7-1,x
	and.w #$00FF
	bit.w #$0080
	beq .2
.1:
	ora.w #$FF00
.2:
	eor.w #$FFFF
	inc a
	clc
	adc.b d2
	sta.b d2
	lda.l $7E312E
	tax
	lda.l DATA8_9FB1F7-1,x
	and.w #$00FF
	bit.w #$0080
	beq .4
.3:
	ora.w #$FF00
.4:
	clc
	adc.b d2
	sta.b d2
	jsl.l RandomWord
	and.w #$001F
	inc a
	cmp.b d2
	bcs .5
	lda.w #$0004
	sta.b a1
.5:
	ldx.b a1
	lda.l $7E312C,x
	bit.w #$0800
	beq .6
	lda.l $7E3124
	sta.b d3
	lda.w #$F800
	sta.b d4
.6:
	lda.b d3
	bit.w #$0008
	bne .7
	and.w #$0007
	sta.b d0
	lda.w seed
	and.w #$0003
	bne .8
.7:
	lda.w #$0005
	jsl.l CODE_9BB385
	dec a
	dec a
	and.w #$0007
	sta.b d0
	lda.b d4
	bmi .8
	lda.b d0
	eor.w #$0004
	sta.b d0
.8:
	asl.b d0
	asl.b d0
	ldx.b d0
	lda.l DATA8_80DA06,x
	asl a
	asl a
	asl a
	asl a
	asl a
	ldx.b a3
	sta.w Xvel,x
	ldx.b d0
	lda.l DATA8_80DA06+2,x
	asl a
	asl a
	asl a
	asl a
	asl a
	clc
	adc.b d4
	ldx.b a3
	sta.w Yvel,x
	lda.w #$0004
	ldy.w #$0000
	jsr.w CODE_9FB1DE
	bmi CODE_9FB1B1
	lda.w puckvy
	bpl CODE_9FB1A4
	lda.w pfgoal,y
	bne CODE_9FB1A9
CODE_9FB197:
	lda.w #$0004
	ldy.w #$000C
	jsr.w CODE_9FB1DE
	bmi CODE_9FB1B1
	bra CODE_9FB1A9
