; Draw the sorted objects in display order, hiding ones that are off screen
setsortcords:
	lda.w benchframe
	bmi .10
	lda.w sfhormode
	bne .10
	lda.w #SpriteFrames>>16
	sta.b $12
	lda.w #SpriteFrames
	sta.b $10
	lda.w benchframe
	lsr a
	lsr a
	lsr a
	tax
	lda.w benchframe
	and.w #$0007
	clc
	adc.l .1-2,x
	sta.b $00
	lda.w Vpos
	sec
	sbc.l .2-2,x
	tay
	lda.l .3-2,x
	pha
	lda.w #$FFE2
	sec
	sbc.w Hpos
	tax
	pla
	jsl.l DrawSprite
	bra .10
.1:		; read with an index from 1, as .2 and .3: DrawSprite index (frame - 1) of the first bench frame
	dw SPFbench-1,SPFbench-1,SPFbench+6-1,SPFbench+6-1
.2:
	dw $FF31,$FFB9,$FF31,$FFB9
.3:
	dw $2000,$2200,$2000,$2200
.10:
	lda.w #OOlist
	sta.b a4
.5:
	lda.b (a4)
	and.w #$00FF
	tax
	lda.w #$0000
	cpx.w #$001C
	bne .1x
	lda.w $0DF9
.1x:
	cpx.w #$001E
	bne .2x
	lda.w $0DFB
.2x:
	sta.b d2
	cpx.w #$0018
	bcs .6
	lda.l $7E34BC
	cmp.w #$0004
	bne .3x
	lda.w position,x
	bmi .t1
.3x:
	lda.w frame,x
	cmp.w #SPFPen+7
	beq .4
	cmp.w #SPFPen+8
	bne .6
.4:
	lda.w sfhormode
	bne .t2
	lda.w #SPFPen+8
	sta.w frame,x
	bra .6

.t1:
	jmp.w .8

.t2:
	lda.w #SPFPen+7
	sta.w frame,x
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
	lda.w frame,x
	sta.w $0E23,x
	bne .1xx
	cpx.w #$0018
	bcs .8
.1xx:
	sta.w $0CCD
	lda.w frame,x
	cmp.w #SPFPen+8
	beq .9
	cmp.w #SPFbenchcheck
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
	bcc .1xxx
	ldx.w #$2200
.1xxx:
	stx.w $0CC9
	jsl.l addframe
	lda.w $0CCD
	cmp.w #SPFcup
	bcc .8
	cmp.w #SPFcupover+8
	bcs .8
	adc.w #SPFcupover-SPFcup-1	; DrawSprite index of the cup over SPFcup+n
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
