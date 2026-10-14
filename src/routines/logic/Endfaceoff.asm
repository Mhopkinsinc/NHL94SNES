; Drop the puck: pick the face off winner and send the puck off
Endfaceoff:
	lda.w #$2400
	sta.b $0C
	stz.b $0E
	lda.w #$0007
	jsl.l sfx
	lda.w #$0100
	trb.w sflags
	lda.w #$0000
	sta.l $7E3120
	lda.w #$0400
	trb.w sflags
	stz.w $0CA9
	stz.w gmclock
	lda.w #$0010
	tsb.w sflags3
	lda.l $7E3122
	sta.b d3
	lda.w #$0800
	sta.b d4
	stz.b a1
	lda.w #$0010
	sta.b d2
	lda.l $7E312A
	tax
	lda.l DATA8_9FB1F7-1,x
	and.w #$00FF
	bit.w #$0080
	beq .2
.1:
	ora.w #$FF00
.2:
	eor.w #$FFFF
	inc a
	clc
	adc.b d2
	sta.b d2
	lda.l $7E312E
	tax
	lda.l DATA8_9FB1F7-1,x
	and.w #$00FF
	bit.w #$0080
	beq .4
.3:
	ora.w #$FF00
.4:
	clc
	adc.b d2
	sta.b d2
	jsl.l RandomWord
	and.w #$001F
	inc a
	cmp.b d2
	bcs .5
	lda.w #$0004
	sta.b a1
.5:
	ldx.b a1
	lda.l $7E312C,x
	bit.w #$0800
	beq .6
	lda.l $7E3124
	sta.b d3
	lda.w #$F800
	sta.b d4
.6:
	lda.b d3
	bit.w #$0008
	bne .7
	and.w #$0007
	sta.b d0
	lda.w $0792
	and.w #$0003
	bne .8
.7:
	lda.w #$0005
	jsl.l randoma8
	dec a
	dec a
	and.w #$0007
	sta.b d0
	lda.b d4
	bmi .8
	lda.b d0
	eor.w #$0004
	sta.b d0
.8:
	asl.b d0
	asl.b d0
	ldx.b d0
	lda.l dirtab,x
	asl a
	asl a
	asl a
	asl a
	asl a
	ldx.b a3
	sta.w $0EC3,x
	ldx.b d0
	lda.l dirtab+2,x
	asl a
	asl a
	asl a
	asl a
	asl a
	clc
	adc.b d4
	ldx.b a3
	sta.w $0EE3,x
	lda.w #$0004
	ldy.w #$0000
	jsr.w .13
	bmi .12
	lda.w puckvy
	bpl .10
	lda.w pfgoal,y
	bne .11
.9:
	lda.w #$0004
	ldy.w #$000C
	jsr.w .13
	bmi .12
	bra .11
.10:
	lda.w pfgoal,y
	bne .9
.11:
	sty.b a2
	ldx.b a3
	jsl.l a2touchpuck
.12:
	lda.w tmflags
	and.w #$FFFB
	sta.w tmflags
	lda.w $17E0
	and.w #$FFFB
	sta.w $17E0
	ldx.b a3
	jsl.l RandomWord
	and.w #$07FF
	sta.w $0E01
	stz.w $0DF9
	stz.w $1563,x
	lda.w #$0018
	sta.b d0
	jml.l assreplace
.13:
	pha
	lda.w #$0006
	sta.b d0
	pla
.loop:
	cmp.w position,y
	beq .1x
	iny
	iny
	dec.b d0
	bne .loop
	ldy.w #$FFFF
.1x:
	cpy.w #$0000
	rts
