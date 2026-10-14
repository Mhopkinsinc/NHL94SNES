; At the blue line: CheckBreakaway into $1E8B; a new breakaway queues sound 5, raises CwdExciteLvl by 20 and counts it for the team ($17C2)
StartBreakaway:
	jsl.l CheckBreakaway
	lda.w $1638
	sta.w $1E8B
	beq .rtl
	lda.w $1E9B
	bne .1
	lda.w #$7000
	sta.b $64
	lda.w #$0005
	jsl.l QueueSound
.1:
	lda.w CwdExciteLvl
	clc
	adc.w #$0014
	bmi .2
	sta.w CwdExciteLvl
.2:
	phy
	ldy.w #$0000
	lda.w puckc
	cmp.w #$000C
	bmi .3
	ldy.w #$0002
.3:
	lda.w $1E9B
	bne .4
	lda.w $17C2,y
	inc a
	sta.w $17C2,y
.4:
	ply
.rtl:
	rtl
