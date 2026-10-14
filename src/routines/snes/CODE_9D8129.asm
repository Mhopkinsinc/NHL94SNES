; Unidentified routine.
CODE_9D8129:
	lda.w #$0001
	sta.l $7E3474
	stz.w $1E3F
	jsl.l ClearTeamStats
	jsl.l CODE_9D87D7
	ldx.w #$0000
	jsl.l CODE_9DCC36
	ldx.w #$0002
	jsl.l CODE_9DCC36
	lda.w #$0008
	ldx.w #$003E
	jsl.l CODE_9DCCF5
	stz.w $1DB9
	stz.w $1E3D
	jsl.l CODE_9D8292
	jsl.l CODE_9D842F
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF390
	sta.b $8D
	jsl.l CODE_9EC7BE
	pla
	sta.b $8D
	pla
	sta.b $8F
	lda.w #$0016
	sta.b $A5
	lda.w #$000B
	sta.b $A9
	jsl.l CODE_9D80DD
	jsl.l CODE_9D8489
	jsl.l CODE_9D8B49
	jsl.l CODE_8086BD
CODE_9D8195:
	jsl.l CODE_9DD923
	jsl.l WaitFrame
	jsl.l CODE_9B8017
	ldx.w #$0002
	lda.w $0AB8
	sta.b $14
CODE_9D81A9:
	lda.w $1C84,x
	beq CODE_9D81B5
	lda.w $0AB8,x
	ora.b $14
	sta.b $14
CODE_9D81B5:
	inx
	inx
	cpx.w #$000A
	bcc CODE_9D81A9
	lda.b $14
	bit.w #$1000
	bne CODE_9D821A
	bit.w #$0800
	beq CODE_9D81CC
	jsl.l CODE_9B866C
CODE_9D81CC:
	bit.w #$4000
	bne CODE_9D8222
	bit.w #$8080
	bne CODE_9D8240
	bit.w #$0040
	beq CODE_9D81DE
	jmp.w CODE_9D825E
