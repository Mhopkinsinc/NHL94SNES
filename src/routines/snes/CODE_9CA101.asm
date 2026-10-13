; Unidentified routine.
CODE_9CA101:
	lda.w #$0170
	sta.w frame,x
CODE_9CA107:
	lda.w Xpos,x
	sta.b $A5
	lda.w Ypos,x
	sta.b $A9
	jsl.l projxy
	cmp.w #$4E20
	beq CODE_9CA186
	sta.w $0CD1
	lda.b $A5
	sta.w $0CCF
	lda.w frame,x
	sta.w $0E23,x
	bne CODE_9CA12F
	cpx.w #$0018
	bcs CODE_9CA186
CODE_9CA12F:
	sta.w $0CCD
	lda.w frame,x
	cmp.w #$0171
	beq CODE_9CA193
	cmp.w #$0380
	bcs CODE_9CA193
	lda.w attribute,x
	and.w #$0800
	sta.w $0CC5
	lda.w attribute,x
	and.w #$1000
	sta.w $0CD3
CODE_9CA151:
	lda.w attribute,x
	ldx.w #$2000
	lsr a
	bcc CODE_9CA15D
	ldx.w #$2200
CODE_9CA15D:
	stx.w $0CC9
	jsl.l CODE_9BBFB9
	lda.w $0CCD
	cmp.w #$00D9
	bcc CODE_9CA186
	cmp.w #$00E9
	bcs CODE_9CA186
	adc.w #$0007
	sta.b $00
	lda.w $0CC9
	and.w #$F000
	ldx.w $0CCF
	ldy.w $0CD1
	jsl.l DrawSprite
CODE_9CA186:
	inc.b $99
	lda.b $99
	cmp.w #$15D3
	beq CODE_9CA192
	jmp.w $A0B6
