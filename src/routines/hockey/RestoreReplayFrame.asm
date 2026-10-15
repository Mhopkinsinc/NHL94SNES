; Put one recorded replay frame back into the objects, the puck and the screen
RestoreReplayFrame:
	lda.b d1
	pha
	inc.w $0CB9
	sep #$20
	ldx.b a4
	stx.w WMADDL
	lda.b $9B
	sta.w WMADDH
	lda.b #$0F
	sta.b d1
	ldx.w #$0000
.loop:
	lda.w WMDATA
	sta.w Xpos,x
	lda.w WMDATA
	sta.b $14
	and.b #$0F
	bit.b #$08
	beq .1
	ora.b #$F0
.1:
	sta.w Xpos+1,x
	lda.w WMDATA
	sta.w Ypos,x
	lda.b $14
	lsr a
	lsr a
	lsr a
	lsr a
	bit.b #$08
	beq .2
	ora.b #$F0
.2:
	sta.w Ypos+1,x
	lda.w WMDATA
	sta.w frame,x
	lda.w WMDATA
	sta.b $14
	and.b #$3F
	sta.w frame+1,x
	lda.w attribute+1,x
	and.b #$E7
	sta.w attribute+1,x
	lda.b $14
	lsr a
	lsr a
	lsr a
	and.b #$18
	ora.w attribute+1,x
	sta.w attribute+1,x
	inx
	inx
	dec.b d1
	bpl .loop
	lda.b #$05
	sta.b d1
	ldx.w #$0000
.loop2:
	lda.w WMDATA
	sta.w rostnum,x
	lda.w WMDATA
	sta.w rostnum+2,x
	stz.w position+1,x
	lda.w WMDATA
	sta.b $14
	and.b #$0F
	cmp.b #$0F
	bne .3
	lda.b #$FF
	sta.w position+1,x
.3:
	sta.w position,x
	stz.w position+3,x
	lda.b $14
	lsr a
	lsr a
	lsr a
	lsr a
	and.b #$0F
	cmp.b #$0F
	bne .4
	lda.b #$FF
	sta.w position+3,x
.4:
	sta.w position+2,x
	inx
	inx
	inx
	inx
	dec.b d1
	bpl .loop2
	lda.w WMDATA
	sta.w puckz
	bpl .t1
	lda.b #$FF
	bra .5

.t1:
	lda.b #$00
.5:
	sta.w puckz+1
	lda.w WMDATA
	sta.w shadowz
	bpl .t1x
	lda.b #$FF
	bra .6

.t1x:
	lda.b #$00
.6:
	sta.w shadowz+1
	lda.w WMDATA
	sta.w $0CAD
	lda.w WMDATA
	sta.w $0CAF
	lda.w WMDATA
	sta.w $0CB0
	lda.w WMDATA
	sta.w $0CB2
	lda.w WMDATA
	sta.w $0CB3
	lda.w WMDATA
	sta.w $0CB5
	lda.w WMDATA
	sta.w $0CB6
	lda.w WMDATA
	sta.w $0CB8
	lda.w WMDATA
	sta.b d7
	lda.w WMDATA
	sta.b $14
	and.b #$0F
	sta.w $0AE7
	lda.b $14
	lsr a
	lsr a
	lsr a
	lsr a
	sta.w $0AE9
	lda.w WMDATA
	sta.b $14
	and.b #$0F
	sta.w $0AEB
	lda.b $14
	lsr a
	lsr a
	lsr a
	lsr a
	sta.w $0AED
	lda.w WMDATA
	sta.b $14
	and.b #$0F
	sta.w $0AEF
	lda.b $14
	lsr a
	lsr a
	lsr a
	lsr a
	sta.w $0AF1
	lda.w WMDATA
	sta.l crowdlevel
	lda.w WMDATA
	sta.l $7E35E1
	lda.w WMDATA
	sta.w PBnum
	bpl .t1xx
	lda.b #$FF
	bra .7

.t1xx:
	lda.b #$00
.7:
	sta.w $1625
	lda.w sflags
	bit.b #$20
	bne .t1xxx
	lda.w WMDATA
	sta.w Hpos
	lda.w WMDATA
	sta.w Hpos+1
	lda.w WMDATA
	sta.w Vpos
	lda.w WMDATA
	sta.w Vpos+1
	lda.w WMDATA
	sta.w benchframe
	lda.w WMDATA
	sta.w $0C2A
	bra .8

.t1xxx:
	lda.w WMDATA
	lda.w WMDATA
	lda.w WMDATA
	lda.w WMDATA
	lda.w WMDATA
	sta.w benchframe
	lda.w WMDATA
	sta.w $0C2A
.8:
	rep #$20
	lda.w $0CAD
	and.w #$00FF
	cmp.w #$0080
	bcc .1x
	ora.w #$FF00
.1x:
	sta.w $0CAD
	lda.w $0CB3
	and.w #$00FF
	cmp.w #$0080
	bcc .2x
	ora.w #$FF00
.2x:
	sta.w $0CB3
	pla
	sta.b d1
	rtl
