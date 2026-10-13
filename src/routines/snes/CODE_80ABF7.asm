; Unidentified routine.
CODE_80ABF7:
	sep #$20
	lda.w $08F2,y
	beq CODE_80AC45
	cmp.b #$01
	beq CODE_80AC46
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
	bcc CODE_80AC2E
	lda.b #$9F
	bra CODE_80AC40
