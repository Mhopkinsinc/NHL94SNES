; Once a second, count down the penalty box times. The clock-stopped flag chooses the path.
updatepentime:
	lda.w #$0020
	trb.w sflags3
	lda.w gmclock
	beq .t2
	jmp.w .4

.t2:
	lda.w $163A
	beq .t1
	jmp.w .4

.t1:
	lda.w pentimer
	sec
	sbc.b d7
	sta.w pentimer
	bpl .4
	adc.w #$0018
	sta.w pentimer
	lda.w #$0020
	tsb.w sflags3
	jsl.l chkatop
	jsl.l CODE_9EB1C9
	stz.b a2
	jsl.l .1
	lda.w #$0002
	sta.b a2
.1:
	lda.b a2
	beq .2
	lda.w #$001A
.2:
	sta.b a0
	lda.w #$0000
	sta.b $8F
	lda.w #mesarea
	sta.b a1
	lda.w #$0002
	sta.b d1
	sta.b d3
.3:
	ldy.b a0
	lda.w tmboxlist,y
	inc.b a0
	and.w #$00FF
	sta.b d0
	bit.w #$0080
	bne .5
	lda.b a2
	beq .1x
	lda.w #$0034
.1x:
	clc
	adc.b d0
	tay
	lda.w tmpdst,y
	bit.w #$4000
	bne .6
	dec.b d1
	bmi .3
	lda.b d0
	sta.b [a1]
	inc.b a1
	inc.b a1
	lda.w tmpdst,y
	dec a
	sta.w tmpdst,y
	bne .2x
	jsl.l RemovePlayerFromList
.2x:
	bra .3
.4:
	rtl
.5:
	lda.w mesarea
	sta.b d0
	lda.b d1
	cmp.w #$0001
	beq .2xx
	lda.b d1
	bne .t1x
	jsl.l .2xx
	bra .1xx

.t1x:
	lda.b d1
	cmp.w #$FFFF
	bne .4
.1xx:
	lda.w mesarea+2
	sta.b d0
org $9EC000
.2xx:
	lda.b a2
	beq .1xxx
	lda.w #$0034
.1xxx:
	clc
	adc.b d0
	tay
	lda.w tmpdst,y
	cmp.w #$0006
	bpl .4
	lda.w tmpdst,y
	bne .rtl
	jsl.l releasepl
.rtl:
	rtl
.6:
	dec a
	sta.w tmpdst,y
	bit.w #$0800
	bne .t2x
	jmp.w .3

.t2x:
	bit.w #$1000
	bne .t1xx
	lda.w #$1000
	sta.w tmpdst,y
	jml.l RemovePlayerFromList

.t1xx:
	lda.w #$0000
	sta.w tmpdst,y
	jml.l RemovePlayerFromList
