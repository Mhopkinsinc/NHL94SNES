; Unidentified routine.
CODE_9B869B:
	jsl.l CODE_9DE0E9
	ldy.b a2
	lda.w tmline,y
	inc a
	sta.b d0
	sta.w SelectedPlayerIdx
	stz.w $0D47
	ldx.b a2
	lda.w HomeTeam,x
	sta.l $7E3454
	lda.w #$FFFF
	sta.l $7E3452
	jsl.l CODE_9DD9AD
	jsl.l CODE_9B890F
	lda.w #$0005
	sta.w $1D9F
	dec a
	sta.w $1D8B
	jsl.l CODE_9B8810
	lda.w #$0005
	ldx.w #$0068
	jsl.l CODE_9DCCF5
	jsl.l CODE_9DDFF6
	jsl.l CODE_8086BD
CODE_9B86E5:
	jsl.l CODE_9DD923
	jsl.l WaitFrame
	jsl.l CODE_9B8017
	jsl.l CODE_9B851F
	jsl.l ProcessInputWithRepeat
	lda.b d1
	bit.w #$1000
	beq .t2
	jsr.w CODE_9B8A15
	cmp.w #$0000
	beq .t1
	jmp.w CODE_9B8860

.t1:
	jsl.l CODE_9B8810
	bra CODE_9B86E5

.t2:
	bit.w #$8080
	bne .t1x
	jmp.w .t3

.t1x:
	jsl.l CODE_9B8D86
	cmp.w #$0000
	bmi .1
	jsr.w CODE_9B8C7A
.1:
	lda.w #$0001
	sta.l $7E3468
	jsl.l CODE_9B8810
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CEFDB
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b $8F
	lda.w SelectedPlayerIdx
	sta.b d0
	lda.w #$009B
	sta.b $8F
	lda.w #DATA8_9B8861
	sta.b a1
	lda.l $7E34C6
	bne .2
	lda.w #$009B
	sta.b $8F
	lda.w #DATA8_9B88E9
	sta.b a1
.2:
	jsl.l AdvanceStringPtr
	jsl.l print
	jsl.l CODE_9DD923
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CEFE0
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b $8F
	jmp.w CODE_9B880D

.t3:
	stz.b d0
	inc.b d0
	bit.w #$0100
	bne .t2x
	dec.b d0
	dec.b d0
	bit.w #$0200
	bne .t2x
	bit.w #DMA_OAM
	bne .1x
	inc.b d0
	inc.b d0
	bit.w #$0800
	beq CODE_9B880D
.1x:
	lda.b d0
	clc
	adc.w $1D8B
	bmi CODE_9B880D
	cmp.w $1D9F
	bpl CODE_9B880D
	sta.w $1D8B
	jsl.l CODE_9B8810
	jmp.w CODE_9B880D

.t2x:
	lda.l $7E34C6
	beq CODE_9B880D
	lda.b d0
	clc
	adc.w SelectedPlayerIdx
	dec a
	bmi CODE_9B880D
	cmp.w #$0007
	bcs CODE_9B880D
	inc a
	sta.w SelectedPlayerIdx
	cmp.w #$0006
	bmi .t1x2
	lda.w $1D9F
	cmp.w #$0004
	beq CODE_9B8809
	dec.w $1D9F
	lda.w $1D8B
	beq CODE_9B8809
	dec.w $1D8B
	bra CODE_9B8809

.t1x2:
	lda.w $1D9F
	cmp.w #$0005
	beq CODE_9B8809
	inc.w $1D9F
	inc.w $1D8B
CODE_9B8809:
	jsl.l CODE_9B8810
CODE_9B880D:
	jmp.w CODE_9B86E5
