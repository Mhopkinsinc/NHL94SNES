; Unidentified routine.
CODE_808160:
	phx
	phy
	lda.w #$16D3
	sta.b $3E
	sep #$10
	ldx.w $0774
	beq CODE_80817D
	lda.w $0773
	sta.w $078C
	stz.w $0773
	ldx.w $0775
	stx.w $078E
CODE_80817D:
	ldx.b #$80
	phx
	pea.w NMI_HookReturn-1		; rtl from the hook lands on the next line
	jml [$078C]
