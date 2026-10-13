; Unidentified routine.
CODE_9ECFDC:
	lda.w #SPAgready
	sta.b $A9
	lda.b $A5
	and.w #$000F
	sta.b $A5
	cmp.w #$0008
	bcc CODE_9ED009
	ldy.w $19D4,x
	bpl CODE_9ECFF7
	cmp.w #$0009
	bne CODE_9ECFFF
CODE_9ECFF7:
	lda.w Xvel,x
	ora.w Yvel,x
	bne CODE_9ED04D
CODE_9ECFFF:
	lda.w pf2aip,x
org $9ED002
	bne CODE_9ED008
	jml.l SetSPA
