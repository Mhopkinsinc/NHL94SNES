; Unidentified routine.
CODE_9FEAB4:
	lda.w #$2400
	sta.w $0D0D
	lda.b d0
	cmp.w $0D15
	bne .1
	lda.w #$2000
	sta.w $0D0D
.1:
	lda.w #$0006
	sta.w printx
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF902
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b $8F
	lda.w #$0000
	sta.b $8F
	lda.w #mesarea
	sta.b a1
	ldy.w #$001E
.loop:
	lda.b [a0],y
	sta.b [a1],y
	dey
	dey
	bpl .loop
	jsl.l .t3
	jsl.l CODE_9FEBA6
	jsl.l CODE_9FEBEB
	lda.b [a1]
	lsr a
	eor.w #$FFFF
	inc a
	clc
	adc.w #$0011
	sta.w printx
	jsl.l print
	inc.w printy
	lda.b a0
	clc
	adc.b [a0]
	sta.b a0
	inc.b d0
	lda.b d0
	sec
	sbc.w $0D13
	cmp.w #$0005
	bne CODE_9FEAB4
	rtl

.t3:
	lda.w #$009F
	sta.b $97
	lda.w #DATA8_9FEC72
	sta.b a3
	lda.w $1EB7
	asl a
	clc
	adc.b a3
	sta.b a3
	lda.b [a3]
	cmp.b d0
	beq .t1
	jmp.w CODE_9FEBA5

.t1:
	jsl.l CODE_9FC76C
	ldy.b a2
	lda.w tmgoalie,y
	bpl .t2
	jmp.w CODE_9FEC60

.t2:
	sta.b tmp0
	lda.w tmdata,y
	sta.b a4
	lda.w #$009C
	sta.b $9B
	ldy.w #$0000
	lda.b [a4],y
	clc
	adc.b a4
	sta.b a4
.loopx:
	dec.b tmp0
	bmi .t1x
	lda.b [a4]
	clc
	adc.b a4
	adc.w #$0008
	sta.b a4
	bra .loopx

.t1x:
	ldy.w #$0001
.loopxx:
	iny
	lda.b [a4],y
	and.w #$00FF
	cmp.w #$0020
	bne .loopxx
CODE_9FEB90:
	iny
	tya
	cmp.b [a4]
	beq CODE_9FEBA5
	lda.b [a4],y
	phy
	ldy.w mesarea
	sta.w mesarea,y
	inc.w mesarea
	ply
	bra CODE_9FEB90
CODE_9FEBA5:
	rtl
CODE_9FEBA6:
	lda.w #$009F
	sta.b $97
	lda.w #DATA8_9FEC72+12
	sta.b a3
	lda.w $1EB7
	asl a
	clc
	adc.b a3
	sta.b a3
	lda.b [a3]
	cmp.b d0
	beq .t2
	jmp.w CODE_9FEBA5

.t2:
	jsl.l CODE_9FC76C
	ldy.b a2
	lda.w $1C90,y
	beq .t1
	lda.w #$009F
	sta.b $9B
	lda.w #$EC42
	sta.b a4
	bra .1

.t1:
	lda.w #$009F
	sta.b $9B
	lda.w #GoalieOptionText
	sta.b a4
.1:
	ldy.w #$0001
	jsl.l CODE_9FEB90
	rtl
CODE_9FEBEB:
	lda.w #$009F
	sta.b $97
	lda.w #DATA8_9FEC72+24
	sta.b a3
	lda.w $1EB7
	asl a
	clc
	adc.b a3
	sta.b a3
	lda.b [a3]
	cmp.b d0
	beq .t2
	jmp.w CODE_9FEBA5

.t2:
	jsl.l CODE_9FC76C
	ldy.b a2
	lda.w $1C94,y
	beq .t1
	lda.w #$009F
	sta.b $9B
	lda.w #$EC57
	sta.b a4
	bra .1

.t1:
	lda.w #$009F
	sta.b $9B
	lda.w #$EC5B
	sta.b a4
.1:
	ldy.w #$0001
	jsl.l CODE_9FEB90
	rtl
