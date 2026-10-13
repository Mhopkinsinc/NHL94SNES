; Unidentified routine.
CODE_9DA973:
	lda.l $7E3456
	beq CODE_9DA992
	lda.l $7E34BE
	sta.w HomeTeam
	lda.l $7E34C0
	sta.w VisTeam
	jsl.l setteams
	lda.w #$0000
	sta.l $7E3456
CODE_9DA992:
	lda.l $7E35D0
	sta.b $AD
	lda.w #$0020
	sta.b $A5
	lda.w #$000E
	sta.b $A9
	lda.w #$000E
	sta.w printy
	stz.w printx
	jsl.l eraser
	lda.b $C1
	sta.b $BD
	lda.w #$000E
	sta.w printy
	stz.b $AD
	ldx.w #$0000
CODE_9DA9BE:
	lda.w #$3800
	sta.w printa
	lda.w #$009D
	sta.b $8F
	lda.w #DATA8_9DADFD
	sta.b $8D
	stx.b $A5
	lda.l $7E34BC
	asl a
	asl a
	asl a
	asl a
	adc.b $A5
	tax
	lda.l DATA8_9DAC7F,x
	ldx.b $A5
	cmp.w #$0000
	beq CODE_9DAA5A
	bpl CODE_9DA9F2
	lda.w #$009D
	sta.b $8F
	lda.w #DATA8_9DAE40
	sta.b $8D
CODE_9DA9F2:
	lda.w #$0003
	sta.w printx
	txa
	lsr a
	sta.b $A5
	jsl.l CODE_9ECFC6
	lda.w #$0011
	sta.w printx
	stx.b $C1
	jsr.w $A8B8
	txy
	lda.w #$007E
	sta.b $8B
	lda.w #$34BC
	sta.b $89
	lda.b [$89],y
	sta.b $B1
	lda.w #$009D
	sta.b $8B
	lda.w #DATA8_9DACDF
	sta.b $89
	clc
	adc.b [$89],y
	sta.b $89
CODE_9DAA29:
	lda.b $8B
	sta.b $8F
	lda.b $89
	sta.b $8D
	clc
	adc.b [$89]
	sta.b $89
	dec.b $B1
	bpl CODE_9DAA29
	cpx.b $BD
	bne CODE_9DAA44
	lda.w #$2000
	sta.w printa
CODE_9DAA44:
	stx.b $C1
	cpx.w #$0002
	beq CODE_9DAA69
	cpx.w #$0004
	beq CODE_9DAA69
	jsl.l CODE_9EC7BE
CODE_9DAA54:
	inc.w printy
	inc.w printy
CODE_9DAA5A:
	inx
	inx
	cpx.w #$000E
	bcs CODE_9DAA64
	jmp.w $A9BE
