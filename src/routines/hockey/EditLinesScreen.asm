; Change the lines on the ice. Start opens the line menu.
EditLinesScreen:
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
	jsl.l PrintLineNames
	lda.w #$0005
	ldx.w #$0068
	jsl.l CODE_9DCCF5
	jsl.l CODE_9DDFF6
	jsl.l ScreenOn
.3:
	jsl.l CODE_9DD923
	jsl.l WaitFrame
	jsl.l ReadPads
	jsl.l CODE_9B851F
	jsl.l ProcessInputWithRepeat
	lda.b d1
	bit.w #$1000
	beq .t2
	jsr.w EditLinesMenu
	cmp.w #$0000
	beq .t1
	jmp.w CODE_9B8860

.t1:
	jsl.l PrintLineNames
	bra .3

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
	jsl.l PrintLineNames
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
	lda.w #LineMenuNames
	sta.b a1
	lda.l $7E34C6
	bne .2
	lda.w #$009B
	sta.b $8F
	lda.w #BestLineNames
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
	jmp.w .5

.t3:
	stz.b d0
	inc.b d0
	bit.w #$0100
	bne .t2x
	dec.b d0
	dec.b d0
	bit.w #$0200
	bne .t2x
	bit.w #$0400
	bne .1x
	inc.b d0
	inc.b d0
	bit.w #$0800
	beq .5
.1x:
	lda.b d0
	clc
	adc.w $1D8B
	bmi .5
	cmp.w $1D9F
	bpl .5
	sta.w $1D8B
	jsl.l PrintLineNames
	jmp.w .5

.t2x:
	lda.l $7E34C6
	beq .5
	lda.b d0
	clc
	adc.w SelectedPlayerIdx
	dec a
	bmi .5
	cmp.w #$0007
	bcs .5
	inc a
	sta.w SelectedPlayerIdx
	cmp.w #$0006
	bmi .t1x2
	lda.w $1D9F
	cmp.w #$0004
	beq .4
	dec.w $1D9F
	lda.w $1D8B
	beq .4
	dec.w $1D8B
	bra .4

.t1x2:
	lda.w $1D9F
	cmp.w #$0005
	beq .4
	inc.w $1D9F
	inc.w $1D8B
.4:
	jsl.l PrintLineNames
.5:
	jmp.w .3
