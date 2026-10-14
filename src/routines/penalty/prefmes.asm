; Print the message for penalty d0, or clear it
prefmes:
	lda.b d0
	pha
	lda.b $A7
	pha
	lda.b d1
	pha
	lda.b $AB
	pha
	lda.b d2
	pha
	lda.b $AF
	pha
	lda.b a1
	pha
	lda.b $8F
	pha
	lda.w sfhormode
	beq .t1
	jmp.w .t5

.t1:
	lda.l $7E344C
	beq .1
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF72F
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b $8F
	lda.w #$000E
	sta.b d0
	lda.w #$0003
	sta.b d1
	lda.l blankchar
	sta.b d2
	jsl.l eraser
	lda.w #$0000
	sta.l $7E344C
.1:
	lda.b d0
	bpl .t4
	jmp.w .3

.t4:
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF734
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b $8F
	lda.w #$0080
	sta.b $8F
	lda.w #PenaltyList
	sta.b a1
	ldy.b d0
	lda.l $7E344C
	beq .t3
	cpy.w #$0006
	bne .t1x
	jmp.w .3

.t1x:
	cpy.w #$0008
	bne .t2
	jmp.w .3

.t2:
	cpy.w #$000C
	bne .t1xx
	jmp.w .3

.t1xx:
	cpy.w #$0012
	bne .t3
	jmp.w .3

.t3:
	lda.b [a1],y
	clc
	adc.b a1
	inc a
	inc a
	sta.b a1
	lda.b [a1]
	dec a
	dec a
	sta.b d0
	bne .t1x2
	jmp.w .3

.t1x2:
	inc a
	lsr a
	sta.b d0
	lda.w printx
	sec
	sbc.b d0
	sta.w printx
	bpl .1x
	stz.w printx
.1x:
	lda.b [a1]
	sta.b d0
	tay
	dec.b a1
	lda.b [a1],y
	inc.b a1
	and.w #$00FF
	bne .2
	dec.b d0
.2:
	lda.w #$0001
	sta.l $7E344C
	lda.w #$0003
	sta.b d1
	jsl.l Framer
	dec.w printy
	dec.w printy
	inc.w printx
	jsl.l print
	bra .3

.t5:
	jsl.l ClearPenaltyMessage
	lda.b d0
	bmi .3
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF739
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b $8F
	lda.w #$0080
	sta.b $8F
	lda.w #PenaltyList
	sta.b a1
	ldy.b d0
	lda.b [a1],y
	clc
	adc.b a1
	inc a
	inc a
	sta.b a1
	lda.b [a1]
	lsr a
	sta.b d0
	lda.w printx
	sec
	sbc.b d0
	sta.w printx
	jsl.l print
.3:
	pla
	sta.b $8F
	pla
	sta.b a1
	pla
	sta.b $AF
	pla
	sta.b d2
	pla
	sta.b $AB
	pla
	sta.b d1
	pla
	sta.b $A7
	pla
	sta.b d0
	rtl
