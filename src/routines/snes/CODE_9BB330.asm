; Unidentified routine.
CODE_9BB330:
	lda.w WMDATA
	lda.w WMDATA
	lda.w WMDATA
	lda.w WMDATA
	lda.w WMDATA
	sta.w $0C29
	lda.w WMDATA
	sta.w $0C2A
CODE_9BB348:
	rep #$20
	lda.w $0CAD
	and.w #$00FF
	cmp.w #$0080
	bcc CODE_9BB358
	ora.w #$FF00
CODE_9BB358:
	sta.w $0CAD
	lda.w $0CB3
	and.w #$00FF
	cmp.w #$0080
	bcc CODE_9BB369
	ora.w #$FF00
CODE_9BB369:
	sta.w $0CB3
	pla
	sta.b d1
	rtl
