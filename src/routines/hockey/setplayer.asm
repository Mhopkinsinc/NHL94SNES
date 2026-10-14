; Bring roster player d3 onto the ice as object X and set his stats
setplayer:
	phx
	phy
	lda.w pflags,x
	and.w #(~pf2inj&$FFFF)
	sta.w pflags,x
	stz.b a0
	lda.w pfteam,x
	beq .0
	inc.b a0
	inc.b a0
.0:
	lda.b d3
	and.w #$00FF
	sta.w pnum,x
	asl a
	sta.b d3
	lda.w #$000B
	sta.b d0
	lda.b a0
	beq .idx
	lda.w #$0034
.idx:
	adc.b d3
	tay
	lda.w tmpdst,y
	sta.b d1
	tya
	sta.b $14
	asl a
	adc.b $14
	asl a
	sta.b $14
	lda.b d1
	bpl .da
	lda.w #$000A
	sta.b d0
	lda.b d1
	cmp.w #TMPDBENCH
	bne .nda
.da:
	jsl.l assinsert
	stz.w pfalock,x
	stz.w SPA,x
.nda:
	lda.b a0
	beq .nda1
	lda.w #$0034
.nda1:
	clc
	adc.b d3
	tay
	lda.w #TMPDICE
	sta.w tmpdst,y
	lsr.b d3
	ldy.b a0
	lda.w tmdata,y
	sta.b a0
	lda.w #TeamList>>16
	sta.b a0+2
	lda.b a0
	pha
	lda.b a0+2
	pha
	ldy.w #$0008
	lda.b [a0],y
	clc
	adc.b a0
	sta.b a0
	stz.w PPBonus
	stz.w PKBonus
	stz.w $0CE5
	stz.w HmAwBonus
	lda.w position,x
	bne CODE_9FCF91
	jmp.w CODE_9FD01F
