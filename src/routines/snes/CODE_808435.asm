; Unidentified routine.
CODE_808435:
	lda.w #$000F
	sta.w brightness
CODE_80843B:
	stz.w fadestep
CODE_80843E:
	rep #$20
	lda.w $0787
	bne .1
	inc.w $0764
.1:
	sep #$10
	rep #$20
	ldx.w $0771
	beq .2
	lda.w $0770
	sta.w $0789
	stz.w $0770
	ldx.w $0772
	stx.w $078B
.2:
	ldx.b #$80
	phx
	pea.w NMI_FrameHookReturn-1		; rtl from the hook lands on the next line
	jml [$0789]
