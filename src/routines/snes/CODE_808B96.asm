; Unidentified routine.
CODE_808B96:
	stx.b $0C
.1:
	lda.b $18
	clc
	adc.b $1C
	cmp.w #$0021
	bcs .3
	lda.b $18
	asl a
	tax
	phy
	jsl.l CODE_808950
	ply
.2:
	tya
	clc
	adc.w #$0020
	tay
	inc.b $1E
	lda.b $1E
	cmp.w #$0020
	bne .1x
	tya
	clc
	adc.w $079E
	tay
.1x:
	dec.b $1A
	bne .1
	rtl
.3:
	lda.w #$0020
	sbc.b $1C
	asl a
	sta.b $20
	tax
	phy
	jsl.l CODE_808950
	ply
	lda.b $18
	asl a
	sec
	sbc.b $20
	tax
	phy
	tya
	adc.w #$0400
	and.w #$FFE0
	tay
	jsl.l CODE_808950
	ply
	jmp.w .2
