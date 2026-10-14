; Unidentified routine.
CODE_9ECFDC:
	lda.w #$E0FE
	sta.b d1
	lda.b d0
	and.w #$000F
	sta.b d0
	cmp.w #$0008
	bcc .t2
	ldy.w $19D4,x
	bpl .1
	cmp.w #$0009
	bne .2
.1:
	lda.w $0EC3,x
	ora.w $0EE3,x
	bne .t3
.2:
	lda.w $1543,x
org $9ED002
	bne .t1
	jml.l SetSPA

.t1:
	rtl

.t2:
	cpx.w $0AD9
	beq .t4
	lda.w $0B7D,x
	cmp.w #$000C
	beq .t4
	lda.w Ypos,x
	bit.w #$8000
	beq .1x
	eor.w #$FFFF
	inc a
.1x:
	cmp.w #$0098
	bcc .t4
	ldy.w $19D4,x
	bmi .2x
	lda.w SPA,x
	cmp.w #$E4B6
	bcc .2x
	cmp.w #$F90E
	bcc .t3
.2x:
	lda.b d0
	cmp.w facedir,x
	beq CODE_9ED07A
	sta.b d2
	lda.w #$E0FE
	jsl.l CODE_9EA3F1
	jml.l CODE_9EA719

.t3:
	jmp.w CODE_9EA539

.t4:
	lda.w $0BCB,x
	bne CODE_9ED07A
	lda.b d0
	sec
	sbc.w facedir,x
	sta.b d0
	beq CODE_9ED07A
	eor.w #$FFFF
	inc a
	and.w #$0004
	lsr a
	dec a
	clc
	adc.w facedir,x
	and.w #$0007
	sta.b d0
	sta.w facedir,x
	lda.w #$0006
	sta.w $0BCB,x
CODE_9ED07A:
	lda.w $0BCB,x
	beq .2
	sec
	sbc.w $0ADB
	bpl .1
	lda.w #$0000
.1:
	sta.w $0BCB,x
.2:
	lda.w $0B05,x
	bit.w #$0002
	bne .t1
	lda.w #$E0FE
	bra CODE_9ED09B

.t1:
	lda.w #$E3C0
CODE_9ED09B:
	jsl.l CODE_9EA3F1
	lda.w facedir,x
	sta.b d2
	jml.l CODE_9EA719
