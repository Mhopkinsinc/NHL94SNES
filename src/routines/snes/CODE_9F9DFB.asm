; Unidentified routine.
CODE_9F9DFB:
	ldy.w #$0002
.loop:
	dec.w printx
	lda.b [a1],y
	and.w #$00FF
	cmp.w #$0031
	beq .1
	dec.w printx
.1:
	iny
	tya
	cmp.b [a1]
	bcc .loop
	rtl
