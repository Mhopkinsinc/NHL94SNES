; Unidentified routine.
CODE_9DA973:
	lda.l $7E3456
	beq .1
	lda.l $7E34BE
	sta.w HomeTeam
	lda.l $7E34C0
	sta.w VisTeam
	jsl.l setteams
	lda.w #$0000
	sta.l $7E3456
.1:
	lda.l $7E35D0
	sta.b d2
	lda.w #$0020
	sta.b d0
	lda.w #$000E
	sta.b d1
	lda.w #$000E
	sta.w printy
	stz.w printx
	jsl.l eraser
	lda.b d7
	sta.b d6
	lda.w #$000E
	sta.w printy
	stz.b d2
	ldx.w #$0000
.4:
	lda.w #$3800
	sta.w $0D0D
	lda.w #$009D
	sta.b $8F
	lda.w #GameSetupNames
	sta.b a1
	stx.b d0
	lda.l $7E34BC
	asl a
	asl a
	asl a
	asl a
	adc.b d0
	tax
	lda.l DATA8_9DAC7F,x
	ldx.b d0
	cmp.w #$0000
	beq .6
	bpl .2
	lda.w #$009D
	sta.b $8F
	lda.w #PlayoffSetupNames
	sta.b a1
.2:
	lda.w #$0003
	sta.w printx
	txa
	lsr a
	sta.b d0
	jsl.l CODE_9ECFC6
	lda.w #$0011
	sta.w printx
	stx.b d7
	jsr.w CODE_9DA8B8
	txy
	lda.w #$007E
	sta.b $8B
	lda.w #$34BC
	sta.b a0
	lda.b [a0],y
	sta.b d3
	lda.w #$009D
	sta.b $8B
	lda.w #DATA8_9DACDF
	sta.b a0
	clc
	adc.b [a0],y
	sta.b a0
.loop:
	lda.b $8B
	sta.b $8F
	lda.b a0
	sta.b a1
	clc
	adc.b [a0]
	sta.b a0
	dec.b d3
	bpl .loop
	cpx.b d6
	bne .3
	lda.w #$2000
	sta.w $0D0D
.3:
	stx.b d7
	cpx.w #$0002
	beq .7
	cpx.w #$0004
	beq .7
	jsl.l print
.5:
	inc.w printy
	inc.w printy
.6:
	inx
	inx
	cpx.w #$000E
	bcs .t1
	jmp.w .4

.t1:
	lda.b d6
	sta.b d7
	rts
.7:
	ldy.b d7
	lda.w #$007E
	sta.b $8F
	lda.w #$34BC
	sta.b a1
	lda.b [a1],y
	sta.b d3
	jsl.l CODE_9BC5AB
	jsl.l print
	bra .5
