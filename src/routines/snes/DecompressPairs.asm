; byte pair data at Y (after its header) to WRAM
DecompressPairs:	; byte pair data at Y (after its header) to WRAM
	iny
	iny
	lda.w #$0000
	ldx.w #$0040
.loop:
	dex
	dex
	sta.w $0100,x
	sta.w $0140,x
	sta.w $0180,x
	sta.w $01C0,x
	bne .loop
	sep #$20
	iny
	lda.w $0000,y
	tax
	inc.w $0100,x
	iny
	lda.w $0000,y
	sta.b $00
	beq .7
.loop2:
	iny
	lda.w $0000,y
	tax
	iny
	lda.w $0000,y
	sta.w $0500,x
	iny
	lda.w $0000,y
	sta.w $0600,x
	dec.w $0100,x
	dec.b $00
	bne .loop2
	bra .7
.2:
	phx
	lda.w $0500,x
	tax
	lda.w $0100,x
	beq .1
	jsr.w .12
.1:
	txa
	sta.w WMDATA
	plx
	lda.w $0600,x
	tax
	lda.w $0100,x
	beq .10
	jsr.w .12
	bra .10
.3:
	rts
.4:
	bmi .8
.5:
	iny
	lda.w $0000,y
	beq .3
	sta.w WMDATA
	iny
	lda.w $0000,y
	tax
	lda.w $0100,x
	bne .4
.6:
	txa
	sta.w WMDATA
.7:
	iny
	lda.w $0000,y
	tax
	lda.w $0100,x
	beq .6
	bpl .5
.8:
	phx
	lda.w $0500,x
	tax
	lda.w $0100,x
	bmi .11
.9:
	txa
	sta.w WMDATA
	plx
	lda.w $0600,x
	tax
	lda.w $0100,x
	beq .6
	phx
	lda.w $0500,x
	tax
	lda.w $0100,x
	bmi .2
.10:
	txa
	sta.w WMDATA
	plx
	lda.w $0600,x
	tax
	lda.w $0100,x
	beq .6
	phx
	lda.w $0500,x
	tax
	lda.w $0100,x
	beq .1x
	jsr.w .12
.1x:
	txa
	sta.w WMDATA
	plx
	lda.w $0600,x
	tax
	lda.w $0100,x
	beq .6
	jsr.w .12
	bra .6
.11:
	phx
	lda.w $0500,x
	tax
	lda.w $0100,x
	bmi .3x
.2x:
	txa
	sta.w WMDATA
	plx
	lda.w $0600,x
	tax
	lda.w $0100,x
	beq .9
	phx
	lda.w $0500,x
	tax
	lda.w $0100,x
	beq .1xx
	jsr.w .12
.1xx:
	txa
	sta.w WMDATA
	plx
	lda.w $0600,x
	tax
	lda.w $0100,x
	beq .9
	jsr.w .12
	bra .9
.3x:
	phx
	lda.w $0500,x
	tax
	lda.w $0100,x
	beq .1xxx
	jsr.w .12
.1xxx:
	txa
	sta.w WMDATA
	plx
	lda.w $0600,x
	tax
	lda.w $0100,x
	beq .2x
	jsr.w .12
	bra .2x
.12:
	phx
	lda.w $0500,x
	tax
	lda.w $0100,x
	beq .1xxxx
	jsr.w .12
.1xxxx:
	txa
	sta.w WMDATA
	plx
	lda.w $0600,x
	tax
	lda.w $0100,x
	bne .12
	rts
