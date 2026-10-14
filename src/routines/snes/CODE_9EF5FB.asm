; Unidentified routine.
CODE_9EF5FB:
	lda.w pfteam,y
	ldy.b $91
	cmp.w pfteam,y
	beq CODE_9EF5E9
	lda.b $A5
	cmp.w #$0025
	bcs CODE_9EF5E9
	lda.w position,y
	beq CODE_9EF64C
	ldy.b $89
	lda.w position,y
	beq CODE_9EF5E9
	lda.w $1403,y
	jsl.l CODE_9FDCEB
	lda.b $A5
	pha
	lda.b $89
	ldy.b $91
	sty.b $89
	sta.b $91
	lda.w $1403,y
	sta.b $A5
	jsl.l CODE_9FDCEB
	lda.b $89
	ldy.b $91
	sty.b $89
	sta.b $91
	pla
	sec
	sbc.b $A5
	clc
	adc.w #$0024
	jsl.l CODE_9BB370
	cmp.w #$0003
	bcs CODE_9EF5E9
CODE_9EF64C:
	ldy.b $89
	lda.w $1403,y
	jsl.l CODE_9FDCEB
	lda.b $A5
	adc.w #$0014
	ldy.b $89
	sta.w $1203,y
	lda.b $89
	ldy.b $91
	sty.b $89
	sta.b $91
	lda.w $1403,y
	jsl.l CODE_9FDCEB
	lda.b $A5
	adc.w #$0014
	ldy.b $89
	sta.w $1203,y
	lda.b $89
	ldy.b $91
	sty.b $89
	sta.b $91
	tya
	lsr a
	sta.w $0CF3
	lda.w #$000C
	trb.w sflags
CODE_9EF68B:
	lda.w #$0003
	jsl.l CODE_9C9ABC
	jsl.l a2touchpuck
	jmp.w CODE_9EF722
