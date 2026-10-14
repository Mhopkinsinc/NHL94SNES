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
	bne .t1
	jmp.w .6

.t1:
	lda.w sflags
	bit.w #$2000
	beq .5
	jsl.l chkpk2
	beq .t2
	ldy.w #$0001
	lda.b [a0],y
	and.w #$000F
	sta.w PPBonus
	bra .5

.t2:
	ldy.w #$0001
	lda.b [a0],y
	lsr a
	lsr a
	lsr a
	lsr a
	and.w #$000F
	eor.w #$FFFF
	inc a
	sta.w PKBonus
.5:
	ldy.w #$0002
	lda.b [a0],y
	and.w #$000F
	eor.w #$FFFF
	inc a
	sta.b d0
	lda.w pfteam,x
	bne .1
	lda.b [a0],y
	lsr a
	lsr a
	lsr a
	lsr a
	and.w #$000F
	sta.b d0
.1:
	lda.b d0
	sta.w HmAwBonus
	lda.w gsp
	sec
	sbc.w #$0002
	bmi .6
	bne .2
	jsl.l GetPeriodTime
	lsr.b d0
	lda.b d0
	sec
	sbc.w gameclock
	beq .2
	bpl .6
.2:
	lda.w $178E
org $9FD000
	sec
	sbc.w $1790
	sta.b tmp0
	beq .4
	lda.w pfteam,x
	beq .3
	lda.w #$0000
	sec
	sbc.b tmp0
	sta.b tmp0
.3:
	lda.b tmp0
	bpl .6
.4:
	lda.w #$0002
	sta.w $0CE5
.6:
	pla
	sta.b $8B
	pla
	sta.b a0
	ldy.w #$0000
	lda.b [a0],y
	clc
	adc.b a0
	sta.b a0
.loop:
	lda.b [a0]
	clc
	adc.b a0
	adc.w #$0008
	sta.b a0
	dec.b d3
	bpl .loop
	lda.b a0
	sec
	sbc.w #$0008
	sta.b a0
	lda.b [a0]
	and.w #$00FF
	sta.w $13C3,x
	ldy.w #$0001
	lda.b [a0],y
	and.w #$00F0
	lsr a
	sta.w $12C3,x
	lda.b [a0],y
	and.w #$0007
	sta.b $00
	asl a
	asl a
	adc.b $00
	lsr a
	ldy.w #$0000
	jsl.l CODE_9FD22B
	sta.w $12E3,x
	ldy.w #$0002
	lda.b [a0],y
	lsr a
	lsr a
	lsr a
	lsr a
	and.w #$0007
	sta.b $00
	asl a
	asl a
	adc.b $00
	lsr a
	ldy.w #$0001
	jsl.l CODE_9FD22B
	sta.w $1303,x
	ldy.w #$0002
	lda.b [a0],y
	and.w #$0007
	sta.b $00
	asl a
	asl a
	adc.b $00
	lsr a
	clc
	adc.w PPBonus
	clc
	adc.w PKBonus
	clc
	adc.w HmAwBonus
	clc
	adc.w $0CE5
	ldy.w #$0002
	jsl.l CODE_9FD22B
	eor.w #$000F
	clc
	adc.w #$000F
	lsr a
	sta.w $1323,x
	ldy.w #$0003
	lda.b [a0],y
	lsr a
	lsr a
	lsr a
	lsr a
	and.w #$0007
	sta.b $00
	asl a
	asl a
	adc.b $00
	lsr a
	clc
	adc.w HmAwBonus
	ldy.w #$0003
	jsl.l CODE_9FD22B
	pha
	lda.w position,x
	beq .t1x
	pla
	eor.w #$000F
	clc
	adc.w #$0007
	sta.w $1343,x
	bra .7

.t1x:
	pla
	eor.w #$000F
	clc
	adc.w #$000F
	lsr a
	sta.w $1343,x
.7:
	ldy.w #$0003
	lda.b [a0],y
	and.w #$0007
	sta.b $00
	asl a
	asl a
	adc.b $00
	lsr a
	ldy.w #$0004
	jsl.l CODE_9FD22B
	sta.w $1363,x
	ldy.w #$0004
	lda.b [a0],y
	lsr a
	lsr a
	lsr a
	lsr a
	and.w #$0007
	sta.b $00
	asl a
	asl a
	adc.b $00
	lsr a
	clc
	adc.w $0CE5
	ldy.w #$0005
	jsl.l CODE_9FD22B
	sta.w $1483,x
	lda.w attribute,x
	and.w #$F7FF
	sta.w attribute,x
	ldy.w #$0004
	lda.b [a0],y
	and.w #$0001
	eor.w #$0001
	sta.w $14A3,x
	bne .1x
	lda.w attribute,x
	ora.w #$0800
	sta.w attribute,x
.1x:
	lda.b [a0],y
	and.w #$000E
	sta.w $1463,x
	ldy.w #$0005
	lda.b [a0],y
	lsr a
	lsr a
	lsr a
	lsr a
	and.w #$0007
	sta.b $00
	asl a
	asl a
	adc.b $00
	lsr a
	clc
	adc.w PPBonus
	clc
	adc.w PKBonus
	clc
	adc.w HmAwBonus
	ldy.w #$0006
	jsl.l CODE_9FD22B
	sta.w $1403,x
	ldy.w #$0005
	lda.b [a0],y
	and.w #$0007
	sta.b $00
	asl a
	asl a
	adc.b $00
	lsr a
	clc
	adc.w PPBonus
	clc
	adc.w PKBonus
	clc
	adc.w HmAwBonus
	ldy.w #$0007
	jsl.l CODE_9FD22B
	sta.w $1383,x
	ldy.w #$0006
	lda.b [a0],y
	lsr a
	lsr a
	lsr a
	lsr a
	and.w #$0007
	sta.b $00
	asl a
	asl a
	adc.b $00
	lsr a
	ldy.w #$0008
	jsl.l CODE_9FD22B
	sta.w $1423,x
	ldy.w #$0006
	lda.b [a0],y
	and.w #$0007
	sta.b $00
	asl a
	asl a
	adc.b $00
	lsr a
	clc
	adc.w $0CE5
	clc
	adc.w $0CE5
	ldy.w #$0009
	jsl.l CODE_9FD22B
	sta.w $13E3,x
	ldy.w #$0007
	lda.b [a0],y
	lsr a
	lsr a
	lsr a
	lsr a
	and.w #$0007
	sta.b $00
	asl a
	asl a
	adc.b $00
	lsr a
	clc
	adc.w PPBonus
	clc
	adc.w HmAwBonus
	ldy.w #$000A
	jsl.l CODE_9FD22B
	sta.w $13A3,x
	ldy.w #$0007
	lda.b [a0],y
	and.w #$0007
	sta.b $00
	asl a
	asl a
	adc.b $00
	lsr a
	ldy.w #$000B
	jsl.l CODE_9FD22B
	sta.w $1443,x
	ply
	plx
	rtl
