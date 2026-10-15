; Draw team d1 on the player select screen at printx: its palette, logo tiles and city name (TeamPlaceNames)
DrawSelectTeam:
	lda.b a2
	pha
	phx
	lda.w #$0001
	sta.l bigtextchar
	lda.w #$1800
	sta.b $14
	ldy.w #$0060
	lda.b d1
	cmp.w HomeTeam
	bne .1
	ldx.w #$1C00
	stx.b $14
	ldy.w #$0070
	lda.w #$0018
	sta.l bigtextchar
.1:
	lda.b d1
	asl a
	asl a
	tax
	lda.l TeamBlockPalettes+2,x
	sta.b $0E
	lda.l TeamBlockPalettes,x
	sta.b $0C
	ldx.w #$0010
	jsl.l SetColours
	lda.w HomeTeam
	cmp.w VisTeam
	bne .t1
	lda.b $14
	cmp.w #$1800
	beq .t1
	lda.w #$1800
	sta.b $14
	ldy.w #$0060
	lda.b d1
	bra .1

.t1:
	lda.l redrawblocks
	beq .1x
	ldy.w #$0000
	lda.w #TeamBlocksMap>>16
	sta.b a2+2
	lda.w #TeamBlocksMap+6
	sta.b a2
	lda.w printy
	asl a
	asl a
	asl a
	asl a
	asl a
	adc.w printx
	asl a
	adc.w printm
	tax
	lda.w #$0009
	sta.b tmp0
	sta.b tmp1
.loop:
	lda.b [a2],y
	clc
	adc.l scorechars
	clc
	adc.l printfontset
	clc
	adc.b $14
	sta.l textmap,x
	iny
	iny
	inx
	inx
	dec.b tmp0
	bne .loop
.loop2:
	lda.b [a2],y
	clc
	adc.l scorechars
	clc
	adc.l printfontset
	clc
	adc.b $14
	sta.l textmap+$2E,x
	iny
	iny
	inx
	inx
	dec.b tmp1
	bne .loop2
.1x:
	lda.b d1
	asl a
	tax
	lda.l TeamPlaceNames,x
	sta.b $0C
	lda.w #$009C
	sta.b $0E
	lda.w printx
	pha
	lda.w #$005C
	sta.w jmlvector
	lda.w #BigLetterSelect
	sta.w jmlvector+1
	lda.w #BigLetterSelect>>16
	sta.w jmlvector+3
	jsl.l RenderBigText
	pla
	sta.w printx
	plx
	pla
	sta.b a2
	rts
