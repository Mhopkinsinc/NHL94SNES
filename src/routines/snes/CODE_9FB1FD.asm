; Unidentified routine.
CODE_9FB1FD:
	lda.w sfhormode
	bne .rtl
	lda.w $1E9B
	bne .rtl
	lda.w sflags
	bit.w #$0100
	beq .rtl
	bit.w #$0800
	bne .rtl
	stz.w $0CD3
	lda.w #$3000
	sta.w $0CCB
	ldx.w #$0000
.loop:
	lda.l $7E3126
	sta.w $0CCF
	lda.l $7E3128
	sta.w $0CD1
	lda.l $7E312A,x
	clc
	adc.w #$01A6
	sta.w $0CCD
	lda.l $7E312C,x
	and.w #$0800
	sta.w $0CC5
	lda.w #$0000
	cpx.w #$0004
	bne .1
	lda.w #$0200
.1:
	ora.w $0CCB
	sta.w $0CC9
	phx
	jsl.l CODE_9BBFB9
	plx
	inx
	inx
	inx
	inx
	cpx.w #$000C
	bne .loop
	lda.w #$2000
	sta.w $0CCB
.rtl:
	rtl
	lda.w pfalock,x
	bne .t4
	lda.w sflags
	bit.w #$0100
	bne .t4
	jml.l CODE_9E8BE6

.t4:
	rtl
	lda.w pfalock,x
	beq .t1
.1x:
	jmp.w .t2

.t1:
	lda.w sflags
	bit.w #$0100
	beq .t3
	lda.w pflags,x
	bit.w #$0002
	beq .1xx
	and.w #$FFFD
	sta.w pflags,x
	stz.w $1003,x
.1xx:
	lda.w #$007E
	sta.b $8B
	lda.w #$312A
	sta.b a0
	lda.w pfteam,x
	beq .2
	lda.w #$312E
	sta.b a0
.2:
	lda.w SPAnum,x
	lsr a
	lsr a
	inc a
	sta.b d0
	lda.w $14A3,x
	bne .3
	inc.b d0
	inc.b d0
	inc.b d0
.3:
	lda.b d0
	sta.b [a0]
	lda.w $19D4,x
	bpl .t2
	lda.w $1543,x
	pha
	lda.w #$0001
	sta.w $1543,x
	pla
	cmp.w #$0000
	bne .t2
	lda.w #$F600
	sta.b d1
	lda.w $101F
	cmp.w #$0011
	bcc .4
	jsl.l RandomWord
	and.w #$0007
	sta.b d0
	beq .4
	lda.w #$F62A
	sta.b d1
.4:
	lda.w #$0001
	sta.w $1543,x
	jml.l SetSPA

.t2:
	rtl

.t3:
	lda.w #$0014
	sta.w $1203,x
	jml.l CODE_9E8BE6
