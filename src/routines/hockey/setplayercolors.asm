; Set both teams' colours (SetTeamColors) and send the whole palette (palbuffer) to CGRAM
setplayercolors:
	jsl.l SetTeamColors
	lda.w #palbuffer>>16
	sta.b $0E
	lda.w #palbuffer
	sta.b $0C
	ldy.w #$0000
	ldx.w #$0100
	jsl.l DMAToCGRAM
	rtl

; Set both teams' uniform colours in palbuffer (HomeUniformPalettes / AwayUniformPalettes) and the shared colours
SetTeamColors:
	phx
	phy
	lda.w HomeTeam
	asl a
	asl a
	asl a
	asl a
	asl a
	clc
	adc.w #HomeUniformPalettes
	sta.b $0C
	lda.w #HomeUniformPalettes>>16
	sta.b $0E
	lda.w #palbuffer>>16
	sta.b $12
	lda.w #palbuffer+$180
	sta.b $10
	ldx.w #$0020
	jsl.l MemCopy
	lda.w #palbuffer>>16
	sta.b $12
	lda.w #palbuffer+$040
	sta.b $10
	ldx.w #$0020
	jsl.l MemCopy
	lda.w VisTeam
	asl a
	asl a
	asl a
	asl a
	asl a
	clc
	adc.w #AwayUniformPalettes
	sta.b $0C
	lda.w #AwayUniformPalettes>>16
	sta.b $0E
	lda.w #palbuffer>>16
	sta.b $12
	lda.w #palbuffer+$1A0
	sta.b $10
	ldx.w #$0020
	jsl.l MemCopy
	lda.w #palbuffer>>16
	sta.b $12
	lda.w #palbuffer+$060
	sta.b $10
	ldx.w #$0020
	jsl.l MemCopy
	lda.w #PlayerMarkerPalette>>16
	sta.b $0E
	lda.w #PlayerMarkerPalette
	sta.b $0C
	lda.w #palbuffer>>16
	sta.b $12
	lda.w #palbuffer+$140
	sta.b $10
	ldx.w #$0020
	jsl.l MemCopy
	ply
	plx
	rtl
