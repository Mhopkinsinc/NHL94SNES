; Unidentified routine.
CODE_80ABF7:
	sep #$20
	lda.w $08F2,y
	beq .3
	cmp.b #$01
	beq .4
	lda.b #$04
	sta.w $08F2,y
	phy
	rep #$20
	lda.w $092A,x
	sta.b $4E
	ldy.b #$15
	lda.b ($4E),y
	lsr a
	and.w #$7000
	clc
	adc.w #$0FFF
	sta.w $093A,x
	ldy.b #$10
	lda.b ($4E),y
	xba
	ply
	sep #$20
	cmp.b #$6D
	bcc .t2
	lda.b #$9F
	bra .2

.t2:
	cmp.b #$36
	bcc .t1
	lda.b #$99
	bra .2

.t1:
	cmp.b #$03
	bcc .1
	lda.b #$8C
	bra .2
.1:
	lda.b #$81
.2:
	sta.b $5B
	jsr.w CODE_80A44A
.3:
	rts
.4:
	jsr.w CODE_80ABC7
	rts
