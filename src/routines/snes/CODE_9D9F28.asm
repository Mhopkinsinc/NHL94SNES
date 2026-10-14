; Unidentified routine.
CODE_9D9F28:
	lda.b a1
	clc
	adc.b [a1]
	adc.w #$0004
	sta.b a1
CODE_9D9F32:
	lda.b [a1]
	bmi .1
	dec.b d0
	bpl CODE_9D9F28
.1:
	lda.b [a1]
	bpl .t2
	dec.w $0D47
	bra CODE_9D9F08

.t2:
	jsl.l print
	lda.b [a1]
	sta.b $B7
	ldy.w #$0002
	lda.b [a1],y
	sta.b d4
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF464
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b $8F
	lda.w #$0020
	sta.b d0
	lda.w #$0013
	sta.b d1
	lda.l $7E35D0
	sta.b d2
	jsl.l eraser
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF469
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b $8F
	jsl.l GoalieCount
	lda.b d0
	dec a
	sta.b d1
	lda.w #$009D
	sta.b $9F
	lda.w #RosterGoalieMarks
	sta.b $9D
	lda.w #$009D
	sta.b $97
	lda.w #DATA8_9DA04D
	sta.b a3
	lda.w SelectedPlayerIdx
	dec a
	sta.b d0
	bmi .3
	asl a
	asl a
	asl a
	sta.b d0
	ldy.b a2
	lda.w #$009C
	sta.b $97
	lda.w tmdata,y
	sta.b a3
	ldy.w #$0006
	clc
	adc.b [a3],y
	sec
	adc.b d0
	sta.b a3
	lda.w #$0080
	sta.b $9F
	lda.w #PositionNames
	sta.b $9D
	lda.w #$0004
	sta.b d1
	lda.w SelectedPlayerIdx
	sec
	sbc.w #$0005
	beq .3
	bmi .t1
	bvc .2
.1x:
	bra .3

.t1:
	bvc .3
.2:
	dec.b d1
.3:
	lda.w #$0001
org $9DA000
	sta.w printx
	lda.b $9F
	sta.b $8F
	lda.b $9D
	sta.b a1
	jsl.l print
	lda.b $8F
	sta.b $9F
	lda.b a1
	sta.b $9D
	lda.w #$0004
	sta.w printx
	lda.b [a3]
	inc.b a3
	and.w #$00FF
	dec a
	sta.b d0
	sta.b $04
	stz.b $08
	jsl.l GoalieCount
	lda.b $04
	cmp.b d0
	bpl .1xx
	lda.w #$0010
	sta.b $08
.1xx:
	lda.b $04
	sta.b d0
	jsl.l CODE_9F9745
	inc.w printy
	inc.w printy
	dec.b d1
	bpl .3
CODE_9DA04C:
	rtl
DATA8_9DA04D:
	db $01,$02,$03,$04
