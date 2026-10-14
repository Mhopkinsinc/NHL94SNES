; Unidentified routine.
NMI_Fast:
	rep #$30
	phb
	phk
	plb
	pha
	cli
	lda.w #$0000
	tcd
	lda.w RDNMI
	lda.b $38
	beq .t1
	pla
	plb
	rti

.t1:
	phx
	phy
	lda.w #$16D3
	sta.b $3E
	sep #$10
	ldx.w $0774
	beq .1
	lda.w $0773
	sta.w $078C
	stz.w $0773
	ldx.w $0775
	stx.w $078E
.1:
	ldx.b #$80
	phx
	pea.w NMI_HookReturn-1		; rtl from the hook lands on the next line
	jml [$078C]
