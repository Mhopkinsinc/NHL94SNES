; Unidentified routine.
CODE_9F9DFB:
	ldy.w #$0002
CODE_9F9DFE:
	dec.w printx
	lda.b [a1],y
	and.w #$00FF
	cmp.w #$0031
	beq CODE_9F9E0E
	dec.w printx
CODE_9F9E0E:
	iny
	tya
	cmp.b [a1]
	bcc CODE_9F9DFE
	rtl
