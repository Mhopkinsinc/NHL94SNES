; Unidentified routine.
CODE_9FEA24:
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF8FD
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b $8F
	lda.w $0D13
	sta.b d0
	lda.w $1EB7
	beq .t1
	cmp.w #$0001
	beq .t3
	cmp.w #$0002
	beq .t4
	cmp.w #$0003
	beq .t5
	cmp.w #$0004
	beq .t6
	bra .t2

.t1:
	lda.w #$009F
	sta.b $8B
	lda.w #PauseMenuItems
	sta.b a0
	bra .t7

.t2:
	lda.w #$009F
	sta.b $8B
	lda.w #PauseMenuItems+210
	sta.b a0
	bra .t7

.t3:
	lda.w #$009F
	sta.b $8B
	lda.w #PauseMenuItems+429
	sta.b a0
	bra .t7

.t4:
	lda.w #$009F
	sta.b $8B
	lda.w #PauseMenuItems+626
	sta.b a0
	bra .t7

.t5:
	lda.w #$009F
	sta.b $8B
	lda.w #PauseMenuItems+732
	sta.b a0
	bra .t7

.t6:
	lda.w #$009F
	sta.b $8B
	lda.w #PauseMenuItems+808
	sta.b a0
	bra .t7

.t7:
	lda.b a0
	ldx.b d0
.loop:
	dex
	bmi CODE_9FEAB4
	clc
	adc.b [a0]
	sta.b a0
	bra .loop
