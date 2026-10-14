; Unidentified routine.
CODE_9CA0B1:
	lda.w #OOlist
	sta.b a4
.5:
	lda.b (a4)
	and.w #$00FF
	tax
	lda.w #$0000
	cpx.w #$001C
	bne .1
	lda.w $0DF9
.1:
	cpx.w #$001E
	bne .2
	lda.w $0DFB
.2:
	sta.b d2
	cpx.w #$0018
	bcs .6
	lda.l $7E34BC
	cmp.w #$0004
	bne .3
	lda.w position,x
	bmi .t1
.3:
	lda.w $0D97,x
	cmp.w #$0170
	beq .4
	cmp.w #$0171
	bne .6
.4:
	lda.w sfhormode
	bne .t2
	lda.w #$0171
	sta.w $0D97,x
	bra .6

.t1:
	jmp.w .8

.t2:
	lda.w #$0170
	sta.w $0D97,x
.6:
	lda.w Xpos,x
	sta.b d0
	lda.w Ypos,x
	sta.b d1
	jsl.l projxy
	cmp.w #$4E20
	beq .8
	sta.w $0CD1
	lda.b d0
	sta.w $0CCF
	lda.w $0D97,x
	sta.w $0E23,x
	bne .1x
	cpx.w #$0018
	bcs .8
.1x:
	sta.w $0CCD
	lda.w $0D97,x
	cmp.w #$0171
	beq .9
	cmp.w #$0380
	bcs .9
	lda.w attribute,x
	and.w #$0800
	sta.w $0CC5
	lda.w attribute,x
	and.w #$1000
	sta.w $0CD3
.7:
	lda.w attribute,x
	ldx.w #$2000
	lsr a
	bcc .1xx
	ldx.w #$2200
.1xx:
	stx.w $0CC9
	jsl.l CODE_9BBFB9
	lda.w $0CCD
	cmp.w #$00D9
	bcc .8
	cmp.w #$00E9
	bcs .8
	adc.w #$0007
	sta.b $00
	lda.w $0CC9
	and.w #$F000
	ldx.w $0CCF
	ldy.w $0CD1
	jsl.l DrawSprite
.8:
	inc.b a4
	lda.b a4
	cmp.w #$15D3
	beq .t1x
	jmp.w .5

.t1x:
	rtl
.9:
	stz.w $0CC5
	stz.w $0CD3
	bra .7
