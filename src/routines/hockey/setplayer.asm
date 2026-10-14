; Unidentified routine.
setplayer:
	phx
	phy
	lda.w pflags,x
	and.w #$FFFB
	sta.w pflags,x
	stz.b $89
	lda.w pfteam,x
	beq CODE_9FCF0C
	inc.b $89
	inc.b $89
CODE_9FCF0C:
	lda.b $B1
	and.w #$00FF
	sta.w pnum,x
	asl a
	sta.b $B1
	lda.w #$000B
	sta.b $A5
	lda.b $89
	beq CODE_9FCF23
	lda.w #$0034
CODE_9FCF23:
	adc.b $B1
	tay
	lda.w tmpdst,y
	sta.b $A9
	tya
	sta.b $14
	asl a
	adc.b $14
	asl a
	sta.b $14
	lda.b $A9
	bpl CODE_9FCF44
	lda.w #$000A
	sta.b $A5
	lda.b $A9
	cmp.w #$FFFE
	bne CODE_9FCF4E
CODE_9FCF44:
	jsl.l assinsert
	stz.w $14E3,x
	stz.w SPA,x
CODE_9FCF4E:
	lda.b $89
	beq CODE_9FCF55
	lda.w #$0034
CODE_9FCF55:
	clc
	adc.b $B1
	tay
	lda.w #$FFFF
	sta.w tmpdst,y
	lsr.b $B1
	ldy.b $89
	lda.w tmdata,y
	sta.b $89
	lda.w #$009C
	sta.b $8B
	lda.b $89
	pha
	lda.b $8B
	pha
	ldy.w #$0008
	lda.b [$89],y
	clc
	adc.b $89
	sta.b $89
	stz.w PPBonus
	stz.w PKBonus
	stz.w $0CE5
	stz.w HmAwBonus
	lda.w position,x
	bne CODE_9FCF91
	jmp.w CODE_9FD01F
