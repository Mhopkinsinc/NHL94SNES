; Unidentified routine.
CODE_808B96:
	stx.b $0C
CODE_808B98:
	lda.b $18
	clc
	adc.b $1C
	cmp.w #$0021
	bcs CODE_808BC6
	lda.b $18
	asl a
	tax
	phy
	jsl.l CODE_808950
	ply
CODE_808BAC:
	tya
	clc
	adc.w #$0020
	tay
	inc.b $1E
	lda.b $1E
	cmp.w #$0020
	bne .1
	tya
	clc
	adc.w $079E
	tay
.1:
	dec.b $1A
	bne CODE_808B98
	rtl
