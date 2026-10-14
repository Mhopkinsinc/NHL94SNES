; Unidentified routine.
CODE_9BAF80:
	lda.w sflags3
	bit.w #$0002
	bne .t1
	jmp.w CODE_9BACE5

.t1:
	jsl.l adda4
	lda.b d7
	beq CODE_9BAF6E
	lda.w $0CB3
	and.w #$00FF
	cmp.w #$00FF
	beq CODE_9BAFD8
	cmp.w #$0016
	bcs .t2
	lda.w $0CB7
	sta.b $64
	lda.w $0CB3
	and.w #$00FF
	jsl.l CODE_80A17D
	tay
	sep #$20
	lda.w $08F2,y
	cmp.b #$02
	bne .1
	lda.b #$03
	sta.w $08F2,y
	rep #$20
	tya
	asl a
	tay
	lda.w $0CB5
	sta.w $094A,y
.1:
	rep #$20
	bra CODE_9BAFD8

.t2:
	sec
	sbc.w #$0015
	jsl.l CODE_9C9A7F
CODE_9BAFD8:
	lda.w $0CAD
	and.w #$00FF
	cmp.w #$00FF
	beq CODE_9BB01D
	cmp.w #$0016
	bcs .t1
	lda.w $0CB1
	sta.b $64
	lda.w $0CAD
	and.w #$00FF
	jsl.l CODE_80A17D
	tay
	sep #$20
	lda.w $08F2,y
	cmp.b #$02
	bne .1
org $9BB001
	lda.b #$03
	sta.w $08F2,y
	rep #$20
	tya
	asl a
	tay
	lda.w $0CAF
	sta.w $094A,y
.1:
	rep #$20
	bra CODE_9BB01D

.t1:
	sec
	sbc.w #$0015
	jsl.l CODE_9C9A7F
CODE_9BB01D:
	jmp.w CODE_9BABAB
