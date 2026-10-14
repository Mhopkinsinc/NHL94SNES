; Unidentified routine.
CODE_9DAA83:
	lda.l $7E34BC
	asl a
	asl a
	asl a
	asl a
	adc.w #$0004
	tax
	lda.l DATA8_9DAC7F,x
	bne .t1
	lda.w #$001C
	sta.l $7E3454
	lda.w #$0001
	sta.w printx
	lda.w #$000A
	sta.w printy
	lda.w #$000A
	sta.b d0
	lda.w #$0002
	sta.b d1
	lda.l $7E35D0
	sta.b d2
	jsl.l eraser
	lda.w #$0001
	sta.l $7E3460
	bra .1

.t1:
	lda.w VisTeam
	sta.l $7E3454
.1:
	dex
	dex
	lda.l DATA8_9DAC7F,x
	bne .t1x
	lda.w #$001D
	sta.l $7E3452
	lda.w #$0016
	sta.w printx
	lda.w #$000A
	sta.w printy
	lda.w #$000A
	sta.b d0
	lda.w #$0002
	sta.b d1
	lda.l $7E35D0
	sta.b d2
	jsl.l eraser
	lda.w #$0001
	sta.l $7E3460
	bra .5

.t1x:
	lda.w HomeTeam
	sta.l $7E3452
.5:
	lda.l $7E3458
	dec a
	dec a
	sta.l $7E3458
	bmi .t1xx
	rts

.t1xx:
	jsl.l SpriteFrameStart
	jsr.w .t2
	ldx.w #$004F
	ldy.w #$0018
	lda.w #$009C
	sta.b $8F
	lda.w #GameSetupAlt
	sta.b a1
	jsl.l CODE_9C936C
	lda.l $7E3454
	cmp.w #$001C
	bpl .1x
	lda.w #$0001
	sta.w printx
	lda.w #$000A
	sta.w printy
	lda.w VisTeam
	sta.b d1
	jsl.l CODE_9FBE08
.1x:
	lda.l $7E3452
	cmp.w #$001C
	bpl .2
	lda.w #$0016
	sta.w printx
	lda.w #$000A
	sta.w printy
	lda.w HomeTeam
	sta.b d1
	jsl.l CODE_9FBE08
.2:
	lda.l $7E3452
	bpl .3
	lda.w #$0000
	sta.b $8F
	lda.w #$0A5C
	sta.b a1
	stz.b a2
	lda.w #$FFFF
	sta.b d1
	ldx.w #$0008
	ldy.w #$0043
	jsl.l CODE_9C943E
.3:
	lda.l $7E3454
	bpl .4
	lda.w #$0000
	sta.b $8F
	lda.w #mesarea
	sta.b a1
	lda.w #$0002
	sta.b a2
	lda.w #$FFFF
	sta.b d1
	ldx.w #$0008
	ldy.w #$0043
	jsl.l CODE_9C943E
.4:
	jsl.l CODE_9DDDB3
	jsl.l SpriteFrameEnd
	jsl.l SendColours
	rts

.t2:
	lda.w #$0078
	sta.l $7E3458
	lda.l $7E345E
	inc a
	cmp.w #$0007
	bcc .1xx
	lda.w #$0000
.1xx:
	sta.l $7E345E
	cmp.w #$0006
	beq .rts
	lda.l $7E3452
	cmp.w #$001C
	bpl .2x
	lda.w #$FFFF
	sta.l $7E3452
	ldx.w #$0000
	jsr.w .t1xxx
.2x:
	lda.l $7E3454
	cmp.w #$001C
	bpl .3x
	lda.w #$FFFF
	sta.l $7E3454
	ldx.w #$0002
	jsr.w .t1xxx
.3x:
	stz.b a2
	lda.l $7E345E
	sta.l $7E345A
	lda.w #$0002
	sta.b a2
	lda.l $7E345E
	sta.l $7E345C
.rts:
	rts

.t1xxx:
	stx.b a2
	lda.l $7E345E
	jsl.l CODE_9DC973
	jsl.l PlayerShortName
	cpx.w #$0000
	bne .rtsx
	lda.b $8F
	sta.b $0E
	lda.b a1
	sta.b $0C
	lda.w #$0000
	sta.b $12
	lda.w #$0A5C
	sta.b $10
	ldx.w #$0031
	jsl.l MemCopy
.rtsx:
	rts
