; Unidentified routine.
CODE_9DA5CA:
	jsl.l CODE_9F96F7
	lda.w #$0001
	sta.l $7E3474
	lda.w #$0000
	sta.l $7E3478
	lda.w #$FFFF
	sta.l $7E346C
	sta.l $7E346E
	lda.w #$0001
	sta.l $7E3460
	sta.l $7E3458
	sta.l $7E3456
	lda.w #$0005
	sta.l $7E345E
	jsl.l CODE_8086A9
	jsl.l CODE_9DD977
	jsl.l CODE_9DE074
	lda.l $7E34BE
	sta.w HomeTeam
	lda.l $7E34C0
	sta.w VisTeam
	jsl.l setteams
	lda.w VisTeam
	clc
	adc.w #$0021
	sta.l $7E3454
	lda.w HomeTeam
	sta.l $7E3452
	jsl.l CODE_9DD9AD
	sep #$20
	lda.b #$01
	sta.w BGMODE
	rep #$20
	ldx.w #$004F
	ldy.w #$0018
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF597
	sta.b a1
	jsl.l CODE_9C936C
	lda.w #$1D47
	sta.l $7F750A
	lda.w #$FFFF
	sta.l $7F750E
	lda.w #$14A5
	sta.l $7F7682
	lda.w #$6F7B
	sta.l $7F75C2
	jsl.l CODE_9DE0D4
	jsl.l SpriteFrameEnd
	jsl.l CODE_9DD923
	jsl.l CODE_9B8017
	jsl.l CODE_9B8526
	lda.w #$0000
	sta.w $0CCB
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF5A3
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b $8F
	jsl.l CODE_9CA227
	lda.w #$0028
	sta.w $0E43
	sta.w $0E4F
	lda.w #$FFFF
	sta.l $7E34CC
	lda.b a2
	pha
	lda.w #$0000
	sta.b a2
	jsl.l CODE_9B9334
	lda.w #$0002
	sta.b a2
	jsl.l CODE_9B9334
	pla
	sta.b a2
	stz.b d7
	stz.b d0
	jsr.w CODE_9DAC4F
	jsr.w CODE_9DA973
	jsr.w CODE_9DAA83
	jsl.l CODE_9B8017
	jsl.l CODE_9DDFF6
	jsl.l CODE_8086BD
	lda.w #$0008
	ldx.w #$0040
	jsl.l CODE_9DCCF5
	jsl.l CODE_9DD923
	ldx.w #$0000
	jsl.l CODE_9DCC36
	ldx.w #$0002
	jsl.l CODE_9DCC36
CODE_9DA6FF:
	lda.w #$12C0
	sta.b d6
CODE_9DA704:
	jsl.l WaitFrame
	lda.w OAMReady
	bne CODE_9DA704
	inc.w $0792
	bne CODE_9DA715
	inc.w $0794
CODE_9DA715:
	jsl.l WaitFrame
	ldx.w $1A0E
	txa
	eor.b $AF
	bne CODE_9DA724
	jmp.w CODE_9DA768
