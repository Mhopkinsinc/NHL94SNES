; Once a second, count down the penalty box times. The clock-stopped flag chooses the path.
updatepentime:
	lda.w #$0020
	trb.w sflags3
	lda.w gmclock
	beq .t2
	jmp.w CODE_9EBFDD

.t2:
	lda.w $163A
	beq .t1
	jmp.w CODE_9EBFDD

.t1:
	lda.w pentimer
	sec
	sbc.b d7
	sta.w pentimer
	bpl CODE_9EBFDD
	adc.w #$0018
	sta.w pentimer
	lda.w #$0020
	tsb.w sflags3
	jsl.l CODE_9EB198
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
CODE_9EBF9E:
	ldy.b a0
	lda.w tmboxlist,y
	inc.b a0
	and.w #$00FF
	sta.b d0
	bit.w #$0080
	bne CODE_9EBFDE
	lda.b a2
	beq .1
	lda.w #$0034
.1:
	clc
	adc.b d0
	tay
	lda.w tmpdst,y
	bit.w #$4000
	bne CODE_9EC01D
	dec.b d1
	bmi CODE_9EBF9E
	lda.b d0
	sta.b [a1]
	inc.b a1
	inc.b a1
	lda.w tmpdst,y
	dec a
	sta.w tmpdst,y
	bne .2
	jsl.l RemovePlayerFromList
.2:
	bra CODE_9EBF9E
