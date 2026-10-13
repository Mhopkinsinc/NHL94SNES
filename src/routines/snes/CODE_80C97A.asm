; Unidentified routine.
CODE_80C97A:
	ldy.w #$0002
CODE_80C97D:
	phy
	lda.w HomeTeam,y
	jsl.l CODE_9BC5AB
	lda.b [$8D]
	and.w #$00FF
	dec a
	dec a
	asl a
	tax
	txa
	clc
	adc.w #$0002
	sta.b $A5
	lda.w #$0020
	sec
	sbc.b $A5
	lsr a
	sta.w printx
	sta.b $00
	lda.w #$000D
	sta.w printy
	lda.w #$0006
	sta.b $A9
	jsl.l CODE_9D8000
	lda.b $00
	inc a
	sta.w printx
	lda.w #$000E
	sta.w printy
	jsl.l CODE_9ECE15
	lda.w #$000C
	sta.w printx
	lda.w #$0010
	sta.w printy
	ply
	lda.w HomeTeam,y
	cmp.w #$000E
	beq CODE_80C9EA
	cmp.w #$000D
	beq CODE_80C9EA
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CEF59
	sta.b $8D
	jsl.l CODE_9ECE15
	bra CODE_80C9F8
