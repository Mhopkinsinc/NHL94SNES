; Player a2 takes the puck
puckglue:
	ldy.b a2
	cpy.w puckc
	beq .1
	lda.w #$0003
	jsl.l PuckSfx
	jsl.l EndPenaltyShot
	stz.w $1E8B
	stz.w $1E89
.1:
	ldy.b a2
	sty.w puckc
	sty.b d0
	stz.b a0
	lda.w #$0002
	sta.b a1
	lda.w pfteam,y
	bne .2
	stz.b a1
	lda.w #$0002
	sta.b a0
.2:
	ldy.b a0
	lda.w #$FFFF
	sta.w tmtouch2,y
	sta.w tmtouch3,y
	lda.w tmflags,y
	ora.w #$0004
	sta.w tmflags,y
	lda.w #$0010
	trb.w sflags3
	beq .3
	ldy.b a1
	lda.w $1792,y
	inc a
	sta.w $1792,y
	lda.l crowdlevel
	clc
	adc.w #$00C8
	sta.l crowdlevel
	lda.w #$0014
	sta.b $81
.3:
	lda.w gmclock
	bne .4
	lda.b a2
	cmp.w passReceiverPlayerNum
	bne .4
	ldy.b a1
	lda.w $17BA,y
	inc a
	sta.w $17BA,y
.4:
	lda.w #$000C
	trb.w sflags
	ldy.b a2
	lda.w position,y
	bne .6
	jsl.l ChkShotStat
	ldy.b a2
	lda.w #$008C
	sta.w temp5,y
	lda.w SPA,y
	cmp.w #SPAgdive
	bne .6
.5:
	lda.w #$0005
	sta.w temp5,y
.6:
	lda.b a2
	cmp.w passReceiverPlayerNum
	bne .t1
	ldy.b a1
	lda.w $0B01,y
	sta.b d4
	bmi .t1
	jsl.l AssignPadIfFree
	bra .7

.t1:
	jsl.l PuckCarrierPad
.7:
	lda.w #$FFFF
	sta.w passReceiverPlayerNum
	rtl
