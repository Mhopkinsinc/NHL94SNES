; Unidentified routine.
CODE_9EC96B:
	bvs CODE_9EC9B0
CODE_9EC96D:
	lda.w $1D5E
	bmi CODE_9EC977
	dec.w $0D45
	bpl CODE_9EC9B0
CODE_9EC977:
	lda.w #$0097
	sta.b $8F
	lda.w #PregameText
	sta.b $8D
	lda.w $0D3F
	sta.b $A5
	bpl CODE_9EC9E2
	stz.w $0D47
	ldy.w $0D43
	inc.w $0D43
	inc.w $0D43
	lda.w #$007E
	sta.b $8B
	lda.w #$347C
	sta.b $89
	lda.b [$89],y
	sta.b $A5
	bpl CODE_9EC9B1
	lda.w #$7FFF
	sta.w $0D45
	lda.w #$01E0
	sta.w $0D41
CODE_9EC9B0:
	rtl
