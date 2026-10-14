; Draw a referee frame in the referee window
PushRef:
	phx
	lda.b d0
	pha
	lda.b $A7
	pha
	lda.b d1
	pha
	lda.b $AB
	pha
	lda.b d2
	pha
	lda.b $AF
	pha
	lda.b a0
	pha
	lda.b $8B
	pha
	lda.b a1
	pha
	lda.b $8F
	pha
	lda.b d0
	cmp.w #$0040
	bne .t1
	jmp.w .t2

.t1:
	cmp.w #$0006
	beq .1
	lda.w #$0001
	sta.l $7E344A
.1:
	lda.b d0
	ldx.w #$0070
	jsl.l Mul8U
	sta.b d0
	lda.w #$0096
	sta.b $8B
	lda.w #DATA8_96F15D
	sta.b a0
	lda.w #$0084
	sta.b tmp1
	lda.l $7E35CA
	ora.w #$2000
	sta.b tmp0
	lda.w sfhormode
	beq .2
	lda.l $7E35C8
	sta.b tmp0
	lda.w #$03DA
	sta.b tmp1
	lda.w #$0095
	sta.b $8B
	lda.w #DATA8_95DB8E+6
	sta.b a0
.2:
	lda.b a0
	clc
	adc.b d0
	sta.b a0
	lda.w #$0008
	sta.b tmp2
.loop:
	ldy.w #$0007
.loop2:
	lda.b [a0]
	clc
	adc.b tmp0
	adc.l $7E35AA
	ldx.b tmp1
	sta.l textmap,x
	txa
	lsr a
	cmp.w textdirtylo
	bcs .3
	sta.w textdirtylo
.3:
	cmp.w textdirtyhi
	bcc .4
	sta.w textdirtyhi
.4:
	inc.b a0
	inc.b a0
	inc.b tmp1
	inc.b tmp1
	dey
	bne .loop2
	lda.b tmp1
	clc
	adc.w #$0032
	sta.b tmp1
	dec.b tmp2
	bne .loop
	lda.w #$0200
	tsb.w sflags
	bra .5

.t2:
	lda.w #$0007
	sta.b d0
	lda.w #$0008
	sta.b d1
	lda.l blankchar
	sta.b d2
	lda.w #$0002
	sta.w printx
	sta.w printy
	lda.w sfhormode
	beq .1x
	lda.w #$000D
	sta.w printx
	lda.w #$000F
	sta.w printy
.1x:
	jsl.l eraser
	lda.w #$0200
	tsb.w sflags
	lda.w #$FFFF
	sta.b d0
	jsl.l prefmes
	lda.w #$0000
	sta.l $7E344A
.5:
	pla
	sta.b $8F
	pla
	sta.b a1
	pla
	sta.b $8B
	pla
	sta.b a0
	pla
	sta.b $AF
	pla
	sta.b d2
	pla
	sta.b $AB
	pla
	sta.b d1
	pla
	sta.b $A7
	pla
	sta.b d0
	plx
	rtl
	padbyte $FF
	pad $9F8000
