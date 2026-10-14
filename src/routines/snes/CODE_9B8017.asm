; Unidentified routine.
CODE_9B8017:
	lda.w JoyPad
	xba
	and.w #$000F
	tax
	lda.l PadDirection,x
	and.w #$00FF
	sta.w $0AA4
	lda.w $0778
	xba
	and.w #$000F
	tax
	lda.l PadDirection,x
	and.w #$00FF
	sta.w $0AA6
	lda.w $077A
	xba
	and.w #$000F
	tax
	lda.l PadDirection,x
	and.w #$00FF
	sta.w $0AA8
	lda.w $077C
	xba
	and.w #$000F
	tax
	lda.l PadDirection,x
	and.w #$00FF
	sta.w $0AAA
	lda.w $077E
	xba
	and.w #$000F
	tax
	lda.l PadDirection,x
	and.w #$00FF
	sta.w $0AAC
	jsr.w CODE_9B8472
	lda.w $0AAE
	ora.w $0AB0
	ora.w $0AB2
	ora.w $0AB4
	ora.w $0AB6
	sta.w $0AC2
	rtl
